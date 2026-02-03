/*
** scheduler module for executing lua threads
** See Copyright Notice in luathread.h
*/

/* 
 * this is a modified version of lpsched.c
 */

// avoid generating #error message when compiling for library inclusion!
#ifndef __CATALINA_libthreads
#define __CATALINA_libthreads
#endif

#include "pthread.h"
#include <stdio.h>
#include <stdlib.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#include "lthreads.h"
#include "lthrsch.h"

#ifdef __CATALINA__
#include <cog.h>
#define PTHREAD_T_IS_POINTER
#else
#ifdef __linux__
#define PTHREAD_T_IS_POINTER
#endif
#define pthread_printf printf
#define pthread_yield sched_yield
#endif

// Catalina uses pointers for type pthread_t, which is easy.
// On other platforms we cannot be sure, so unless we are
// explicitly told so (by the fact that PTHREAD_T_IS_POINTER 
// is defined) we must assume it is not, and define a structure
// to hold a pthread_t so that we can define a pointer to it.
#ifdef PTHREAD_T_IS_POINTER
#define PTHREAD_T_IS_POINTER
#define PTHREAD_T pthread_t
#else
typedef struct PTHREAD_ST {
  pthread_t p;
} PTHREAD_ST;

typedef PTHREAD_ST *PTHREAD_T;
#endif

#define FALSE 0
#define TRUE  !FALSE
#define LUATHREAD_SCHED_WORKERS_TABLE "workertb"

#if (LUA_VERSION_NUM >= 504)
#define luathread_resume( L, from, nargs, nresults ) lua_resume( L, from, nargs, nresults )
#elif (LUA_VERSION_NUM >= 502)
#define luathread_resume( L, from, nargs, nresults ) lua_resume( L, from, nargs )
#else
#define luathread_resume( L, from, nargs, nresults ) lua_resume( L, nargs )
#endif

/********************
 * global variables *
 *******************/

/* ready process list */
list ready_lp_list;

/* ready process queue access mutex */
pthread_mutex_t mutex_sched = PTHREAD_MUTEX_INITIALIZER;

/* active luathread count access mutex */
pthread_mutex_t mutex_lp_count = PTHREAD_MUTEX_INITIALIZER;

/* wake worker up conditional variable */
pthread_cond_t cond_wakeup_worker = PTHREAD_COND_INITIALIZER;

/* no active luathread conditional variable */
pthread_cond_t cond_no_active_lp = PTHREAD_COND_INITIALIZER;

/* lua_State used to store workers hash table */
static lua_State *workerls = NULL;

int lpcount = 0;         /* number of active luathreads */
int workerscount = 0;    /* number of active workers */
int destroyworkers = 0;  /* number of workers to destroy */

extern int stacksize;

int factories = 1;       /* number of factories */

#ifdef __CATALINA__

affinity_t next_factory = 1; /* factory to use for next worker created */

#define MAX_FACTORIES    ANY_COG /* see also luathreads.c */

/* the factory does not need much stack space */
#define FACTORY_SIZE     (4*(MIN_THREAD_STACK_SIZE + 25))  

// structure to hold factory data
struct _factory_struct {
   int     cog;
   void   *stack;
};

struct _factory_struct factory[MAX_FACTORIES];

#endif

/***********************
 * register prototypes *
 ***********************/

static void sched_dec_lpcount( void );

/*************************************************
 * Process stall/allow (not currently required!) *
 *************************************************/

#ifdef __CATALINA__

#define proc_allow()
#define proc_stall()

#else

#define proc_allow()
#define proc_stall()

#endif

/*******************************
 * worker thread main function *
 *******************************/

/* worker thread main function */
void *workermain( void *args ) {

  luathread *lp;
  int procstat;
  int nresults;
#ifdef PTHREAD_T_IS_POINTER
  PTHREAD_T self;
#else
  PTHREAD_ST self;
#endif

#ifdef PTHREAD_T_IS_POINTER
   self = pthread_self();
#else
   self.p = pthread_self();
#endif

  pthread_mutex_lock( &mutex_sched );

  /* add worker to workers table */
  lua_getglobal( workerls, LUATHREAD_SCHED_WORKERS_TABLE );
#ifdef PTHREAD_T_IS_POINTER
  lua_pushlightuserdata( workerls, (void *)self );
#else
  lua_pushlightuserdata( workerls, (void *)&self );
#endif
  lua_pushboolean( workerls, TRUE );
  lua_rawset( workerls, -3 );
  lua_pop( workerls, 1 ); /* pop workers table from stack */

  pthread_mutex_unlock( &mutex_sched );

  /* main worker loop */
  while ( TRUE ) {
    /*
      wait until instructed to wake up (because there's work to do
      or because workers must be destroyed)
    */
    pthread_mutex_lock( &mutex_sched );
    while (( list_count( &ready_lp_list ) == 0 ) && ( destroyworkers <= 0 )) {
      pthread_cond_wait( &cond_wakeup_worker, &mutex_sched );
      pthread_yield();
    }

    if ( destroyworkers > 0 ) {  /* check whether workers should be destroyed */
      
      destroyworkers--; /* decrease workers to be destroyed count */
      workerscount--; /* decrease active workers count */

      /* remove worker from workers table */
      lua_getglobal( workerls, LUATHREAD_SCHED_WORKERS_TABLE );
#ifdef PTHREAD_T_IS_POINTER
      lua_pushlightuserdata( workerls, self);
#else
      lua_pushlightuserdata( workerls, &self);
#endif
      lua_pushnil( workerls );
      lua_rawset( workerls, -3 );
      lua_pop( workerls, 1 );

      pthread_cond_signal( &cond_wakeup_worker );  /* wake other workers up */
      pthread_mutex_unlock( &mutex_sched );
      pthread_exit( NULL );  /* destroy itself */
    }

    /* remove lua process from the ready queue */
    lp = list_remove( &ready_lp_list );
    pthread_mutex_unlock( &mutex_sched );

    /* execute the lua code specified in the lua process struct */
    procstat = luathread_resume( luathread_get_state( lp ), NULL,
                               luathread_get_numargs( lp ), &nresults);
    /* reset the process argument count */
    luathread_set_numargs( lp, 0 );

    /* has the lua process sucessfully finished its execution? */
    if ( procstat == 0 ) {
      luathread_set_status( lp, LUATHREAD_STATUS_FINISHED );  
      luathread_recycle_insert( lp );  /* try to recycle finished lua process */
      sched_dec_lpcount();  /* decrease active lua process count */
    }

    /* has the lua process yielded? */
    else if ( procstat == LUA_YIELD ) {

      /* yield attempting to send a message */
      if ( luathread_get_status( lp ) == LUATHREAD_STATUS_BLOCKED_SEND ) {
        luathread_queue_sender( lp );  /* queue lua process on channel */
        /* unlock channel */
        luathread_unlock_channel( luathread_get_channel( lp ));
      }

      /* yield attempting to receive a message */
      else if ( luathread_get_status( lp ) == LUATHREAD_STATUS_BLOCKED_RECV ) {
        luathread_queue_receiver( lp );  /* queue lua process on channel */
        /* unlock channel */
        luathread_unlock_channel( luathread_get_channel( lp ));
      }

      /* yield on explicit coroutine.yield call */
      else { 
        /* re-insert the job at the end of the ready process queue */
        pthread_mutex_lock( &mutex_sched );
        list_insert( &ready_lp_list, lp );
        pthread_mutex_unlock( &mutex_sched );
      }

    }

    /* or was there an error executing the lua process? */
    else {
      /* print error message */
      fprintf( stderr, "close lua_State (error: %s)\n",
               luaL_checkstring( luathread_get_state( lp ), -1 ));
      lua_close( luathread_get_state( lp ));  /* close lua state */
      sched_dec_lpcount();  /* decrease active lua process count */
    }

    /* don't monopolize the factory! */
    pthread_yield();
  }
  return NULL;  
}

/***********************
 * auxiliary functions *
 **********************/

/* decrease active lua process count */
static void sched_dec_lpcount( void ) {
  pthread_mutex_lock( &mutex_lp_count );
  lpcount--;
  /* if count reaches zero, signal there are no more active processes */
  if ( lpcount == 0 ) {
    pthread_cond_signal( &cond_no_active_lp );
  }
  pthread_mutex_unlock( &mutex_lp_count );
}

/**********************
 * exported functions *
 **********************/

/* increase active lua process count */
void sched_inc_lpcount( void ) {
  pthread_mutex_lock( &mutex_lp_count );
  lpcount++;
  pthread_mutex_unlock( &mutex_lp_count );
}

/* local scheduler initialization */
int sched_init( void ) {

  int i;
  int res;
  struct sched_param priority = { 127 };

#ifdef PTHREAD_T_IS_POINTER
  PTHREAD_T worker;
#else
  PTHREAD_ST worker;
#endif
  pthread_attr_t attr;


  pthread_attr_init(&attr);
  pthread_attr_setstacksize(&attr, stacksize);

#ifdef __CATALINA__
  _thread_ticks(_thread_id(), 131);
  pthread_attr_setschedparam(&attr, &priority);
  /* initialize factory data (the initial factory is us!) */
  factories = 1;
  next_factory = 1;
  factory[0].cog = _cogid();
  /* this factory needs no separate stack */
  factory[0].stack = NULL;
#endif

  /* initialize ready process list */
  list_init( &ready_lp_list );

  /* initialize workers table and lua_State used to store it */
  workerls = luaL_newstate();
  lua_newtable( workerls );
  lua_setglobal( workerls, LUATHREAD_SCHED_WORKERS_TABLE );

  /* create default number of initial worker threads */
  for ( i = 0; i < LUATHREAD_SCHED_DEFAULT_WORKER_THREADS; i++ ) {

#ifdef PTHREAD_T_IS_POINTER
    res = pthread_create( &worker, &attr, workermain, NULL );
#else
    res = pthread_create( &worker.p, &attr, workermain, NULL );
#endif
    if ( res != 0 ) {
      return LUATHREAD_SCHED_PTHREAD_ERROR;
    }
#ifdef __CATALINA__
    if (factories > 1) {
       res = pthread_setaffinity(worker, factory[next_factory-1].cog);
       pthread_yield();
       next_factory = (next_factory % factories) + 1;
    }
#endif

    workerscount++; /* increase active workers count */
  }

  pthread_attr_destroy(&attr);

  // give the workers a chance to execute
  pthread_yield();

  return LUATHREAD_SCHED_OK;
}

/* set number of active workers */
int sched_set_numworkers( int numworkers ) {

  int i, delta;
  int res;
#ifdef PTHREAD_T_IS_POINTER
  PTHREAD_T worker;
#else
  PTHREAD_ST worker;
#endif
  pthread_attr_t attr;


  pthread_attr_init(&attr);
  pthread_attr_setstacksize(&attr, stacksize);

  pthread_mutex_lock( &mutex_sched );

  if ( numworkers > workerscount ) {

    /* we need to create some additional workers */
    delta = numworkers - workerscount;

    for ( i = 0; i < delta; i++ ) {

#ifdef PTHREAD_T_IS_POINTER
      res = pthread_create( &worker, &attr, workermain, NULL );
#else
      res = pthread_create( &worker.p, &attr, workermain, NULL );
#endif
      pthread_yield();
      if ( res != 0 ) {
        return LUATHREAD_SCHED_PTHREAD_ERROR;
      }
#ifdef __CATALINA__
      if (factories > 1) {
         res = pthread_setaffinity(worker, factory[next_factory-1].cog);
         pthread_yield();
         next_factory = (next_factory % factories) + 1;
      }
#endif
      workerscount++; /* increase active workers count */
    }

    pthread_mutex_unlock( &mutex_sched );

  }

  else if ( numworkers < workerscount ) {

    /* we need to destroy some workers */
    destroyworkers = workerscount - numworkers;

    pthread_cond_signal( &cond_wakeup_worker );
    pthread_mutex_unlock( &mutex_sched );

  }

  else {

    /* we don't need to do anything */
    pthread_mutex_unlock( &mutex_sched );

  }

  pthread_attr_destroy(&attr);

  // give the workers a chance to execute
  pthread_yield();

  return LUATHREAD_SCHED_OK;
}

/* return the number of active workers */
int sched_get_numworkers( void ) {

  int numworkers;

  pthread_mutex_lock( &mutex_sched );
  numworkers = workerscount;
  pthread_mutex_unlock( &mutex_sched );

  return numworkers;
}

/* set number of active factories (creates and destroys accordingly) */
int sched_set_numfactories( int numfactories ) {
#ifdef __CATALINA__
   int   i, j;
   char *stack;
   int   cog;
   if ((numfactories >= 1) && (numfactories <= MAX_FACTORIES)) {
      if (numfactories > factories) {
         for (i = factories; i < numfactories; i++) {
            proc_stall();
            stack = malloc(FACTORY_SIZE);
            for (j = 0; j < FACTORY_SIZE; j++) {
               stack[i] = 0;
            }
            proc_allow();
            if (stack != NULL) {
               if (pthread_createaffinity(stack, FACTORY_SIZE, &cog) == 0) {
                  factory[i].cog = cog;
                  factory[i].stack = (void *)stack;
                  factories++;
               }
               else {
                  proc_stall();
                  free(stack);
                  proc_allow();
                  break;
               }
            }
         }
      }
      else if (factories > numfactories) {
         /* remember the number of workers we have */
         int workers = sched_get_numworkers();
         /* set number of workers to zero */
         sched_set_numworkers(0);
         /* wait for all workers to terminate */
         while (workerscount > 0) {
            pthread_yield();
         }
         /* now we can close factories */
         for (i = numfactories; i < factories; i++) {
            _cogstop(factory[i].cog);
            proc_stall();
            free(factory[i].stack);
            proc_allow();
            factory[i].cog = 0;
            factory[i].stack = NULL;
         }
         factories = numfactories;
         /* now we can restart the workers */
         sched_set_numworkers(workers);
      }
   }
#endif
   return factories;
}

/* return the number of active factories */
int sched_get_numfactories( void ) {
   return factories;
}

/* set the factory of current worker */
int sched_set_factory( int newfactory ) {
#ifdef __CATALINA__
   // get our current factory
   int res;
   pthread_t self;
   int oldfactory = sched_get_factory();
   int newcog = factory[newfactory-1].cog;
   if (oldfactory != newfactory) {
      self = pthread_self();
      if (self == (void *)-1) {
        // main thread is not actually a pthread, so we cannot
        // use pthread_set_affinity - so do this instead!
        if ((res = _thread_affinity_change(_thread_id(), newcog)) != 0) {
            return newfactory;
         }
         else {
            return oldfactory;
         }
      }
      else {
         // this thread is a pthread
         if ((res = pthread_setaffinity(self, newcog)) == 0) {
            return newfactory;
         }
         else {
            return oldfactory;
         }
      }
   }
else
#endif
   return 1;
}

/* return the factory of the current worker */
int sched_get_factory( void ) {
#ifdef __CATALINA__
   int i;
   int cog;
   cog = _cogid();
   // find the factory with that cog
   for (i = 0; i < factories; i++) {
      if (factory[i].cog == cog) {
         return i + 1;
      }
   }
#endif
   return 1;
}

/* insert lua process in ready queue */
void sched_queue_proc( luathread *lp ) {
  pthread_mutex_lock( &mutex_sched );
  list_insert( &ready_lp_list, lp );  /* add process to ready queue */
  /* set process status ready */
  luathread_set_status( lp, LUATHREAD_STATUS_READY );
  pthread_cond_signal( &cond_wakeup_worker );  /* wake worker up */
  pthread_mutex_unlock( &mutex_sched );
}

/* join worker threads (called when Lua exits). not joining workers causes a
   race condition since lua_close unregisters dynamic libs with dlclose and
   thus libpthreads can be unloaded while there are workers that are still 
   alive. */
void sched_join_workers( void ) {

  lua_State *L = luaL_newstate();
  const char *wtb = "workerstbcopy";

  /* wait for all running lua processes to finish */
  sched_wait();

  /* initialize new state and create table to copy worker ids */
  lua_newtable( L );
  lua_setglobal( L, wtb );
  lua_getglobal( L, wtb );

  pthread_mutex_lock( &mutex_sched );

  /* determine remaining active worker threads and copy their ids */
  lua_getglobal( workerls, LUATHREAD_SCHED_WORKERS_TABLE );
  lua_pushnil( workerls );
  while ( lua_next( workerls, -2 ) != 0 ) {
    lua_pushlightuserdata( L, lua_touserdata( workerls, -2 ));
    lua_pushboolean( L, TRUE );
    lua_rawset( L, -3 );
    /* pop value, leave key for next iteration */
    lua_pop( workerls, 1 );
  }

  /* pop workers copy table name from stack */
  lua_pop( L, 1 );

  /* set all workers to be destroyed */
  destroyworkers = workerscount;

  /* wake workers up */
  pthread_cond_signal( &cond_wakeup_worker );
  pthread_mutex_unlock( &mutex_sched );

  /* join with worker threads (read ids from local table copy ) */
  lua_getglobal( L, wtb );
  lua_pushnil( L );
  while ( lua_next( L, -2 ) != 0 ) {
    PTHREAD_T worker = (PTHREAD_T) lua_touserdata( L, -2 );
#ifdef PTHREAD_T_IS_POINTER
    pthread_join(worker, NULL );
#else
    pthread_join(worker->p, NULL );
    proc_stall();
    free(worker);
    proc_allow();
#endif
    /* pop value, leave key for next iteration */
    lua_pop( L, 1 );
  }
  lua_pop( L, 1 );

  lua_close( workerls );
  lua_close( L );
}

/* wait until there are no more active lua processes and active workers. */
void sched_wait( void ) {

  /* wait until there are not more active lua processes */
  pthread_mutex_lock( &mutex_lp_count );
  if( lpcount != 0 ) {
    pthread_cond_wait( &cond_no_active_lp, &mutex_lp_count );
  }
  pthread_mutex_unlock( &mutex_lp_count );

  pthread_yield();

#if defined(__CATALINA__)
  /* in case there are no processes to yield to, do not monopolize locks */
  pthread_msleep(1);
#endif

}
