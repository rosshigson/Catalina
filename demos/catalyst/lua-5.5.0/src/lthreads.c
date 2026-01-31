/*
** luathread API
** See Copyright Notice in luathread.h
*/

#define LUA_LIB

#include "lprefix.h"

/* 
 * this is an extensively modified version of luaproc.c
 */

// avoid generating #error message when compiling for library inclusion!
#ifndef __CATALINA_libthreads
#define __CATALINA_libthreads
#endif

#include "pthread.h"
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#include "lthreads.h"
#include "lthrsch.h"

#ifdef __CATALINA__
#include <prop.h>
#include <cog.h>
#else
#define pthread_printf printf
#define pthread_yield sched_yield
#endif

#define FALSE 0
#define TRUE  !FALSE

#define SEPARATE_GLOBAL_STATE    0

#define LUATHREAD_CHANNELS_TABLE "channeltb"
#if SEPARATE_GLOBAL_STATE
#define LUATHREAD_GLOBALS_TABLE "globaltb"
#endif
#define LUATHREAD_RECYCLE_MAX 0

/* Version number of the "threads" module. By convention, and if possible, 
 * this will be the version of Catalina in which this version of the module 
 * first appears, in the form XYZ for X.Y.Z (e.g. 504 for 5.0.4). Otherwise
 * it will just be some number guaranteed to be larger than any previous 
 * number */
#define MODULE_VERSION_NUM 885


#if (LUA_VERSION_NUM == 501)

#define lua_pushglobaltable( L )    lua_pushvalue( L, LUA_GLOBALSINDEX )
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "threads", funcs );  }
#define isequal( L, a, b )          lua_equal( L, a, b )
#define requiref( L, modname, f, glob ) {\
  lua_pushcfunction( L, f ); /* push module load function */ \
  lua_pushstring( L, modname );  /* argument to module load function */ \
  lua_call( L, 1, 1 );  /* call 'f' to load module */ \
  /* register module in package.loaded table in case 'f' doesn't do so */ \
  lua_getfield( L, LUA_GLOBALSINDEX, LUA_LOADLIBNAME );\
  if ( lua_type( L, -1 ) == LUA_TTABLE ) {\
    lua_getfield( L, -1, "loaded" );\
    if ( lua_type( L, -1 ) == LUA_TTABLE ) {\
      lua_getfield( L, -1, modname );\
      if ( lua_type( L, -1 ) == LUA_TNIL ) {\
        lua_pushvalue( L, 1 );\
        lua_setfield( L, -3, modname );\
      }\
      lua_pop( L, 1 );\
    }\
    lua_pop( L, 1 );\
  }\
  lua_pop( L, 1 );\
  if ( glob ) { /* set global name? */ \
    lua_setglobal( L, modname );\
  } else {\
    lua_pop( L, 1 );\
  }\
}

#else

#define isequal( L, a, b )                 lua_compare( L, a, b, LUA_OPEQ )
#define requiref( L, modname, f, glob ) \
  { luaL_requiref( L, modname, f, glob ); lua_pop( L, 1 ); }

#endif

#if (LUA_VERSION_NUM >= 503)
#define dump( L, writer, data, strip )     lua_dump( L, writer, data, strip )
#define copynumber( Lto, Lfrom, i ) {\
  if ( lua_isinteger( Lfrom, i )) {\
    lua_pushinteger( Lto, lua_tonumber( Lfrom, i ));\
  } else {\
    lua_pushnumber( Lto, lua_tonumber( Lfrom, i ));\
  }\
}
#else
#define dump( L, writer, data, strip )     lua_dump( L, writer, data )
#define copynumber( Lto, Lfrom, i ) \
  lua_pushnumber( Lto, lua_tonumber( Lfrom, i ))
#endif

#if (LUA_VERSION_NUM >= 503)
/* this version of Lua has integers, so push an integer value */
#define pushint   lua_pushinteger
#else
/* this version of Lua does not have integers, so push a number */
#define pushint   lua_pushnumber
#endif

/***********
 * structs *
 ***********/

/* lua process */
struct stluathread {
  lua_State *lstate;
  int status;
  int args;
  channel *chan;
  luathread *next;
};

/* communication channel */
struct stchannel {
  list send;
  list recv;
  pthread_mutex_t mutex;      /* internal (private) mutex */
  pthread_mutex_t public;     /* public mutex - see threads_lock etc */
  pthread_cond_t can_be_used; /* internal (private) condition */
  pthread_cond_t condition;   /* public condition - see threads_wait_for,
                                 threads_signal, threads_broadcast */
};

/********************
 * global variables *
 *******************/

/* channel list mutex */
static pthread_mutex_t mutex_channel_list = PTHREAD_MUTEX_INITIALIZER;

/* recycle list mutex */
static pthread_mutex_t mutex_recycle_list = PTHREAD_MUTEX_INITIALIZER;

/* Threads configuration options */

#ifdef __CATALINA__
#define MAX_FACTORIES            ANY_COG /* see also luathreadsched.c */
#else
#define MAX_FACTORIES            1
#endif
#define MAX_GLOBAL_NAMELEN       127
#define DEFAULT_STACK_SIZE       4000 /* bytes */

#if SEPARATE_GLOBAL_STATE

/* use a new lua_State used to store shared globals */
static lua_State *gstate = NULL;

/* global state mutex */
static pthread_mutex_t mutex_global_state = PTHREAD_MUTEX_INITIALIZER;

#else

/* use the channel state to store shared globals */
#define gstate chanls
#define mutex_global_state mutex_channel_list

#endif


/* recycled lua process list */
static list recycle_list;

/* maximum lua processes to recycle */
static int recyclemax = LUATHREAD_RECYCLE_MAX;

/* default stack size for threads */
int stacksize = DEFAULT_STACK_SIZE;

/* lua_State used to store channel hash table */
static lua_State *chanls = NULL;

/* lua process used to wrap main state. allows main state to be queued in 
   channels when sending and receiving messages */
static luathread mainlp;

/* main state matched a send/recv operation conditional variable */
pthread_cond_t cond_mainls_sendrecv = PTHREAD_COND_INITIALIZER;

/* main state communication mutex */
static pthread_mutex_t mutex_mainls = PTHREAD_MUTEX_INITIALIZER;

/* memory optimization mutex */
static pthread_mutex_t mutex_memopt = PTHREAD_MUTEX_INITIALIZER;

/***********************
 * register prototypes *
 ***********************/

static void luathread_openlualibs( lua_State *L );

/* Luaproc originals */
static int threads_create_newproc( lua_State *L );
static int threads_wait( lua_State *L );
static int threads_send( lua_State *L );
static int threads_receive( lua_State *L );
static int threads_create_channel( lua_State *L );
static int threads_destroy_channel( lua_State *L );
static int threads_set_numworkers( lua_State *L );
static int threads_get_numworkers( lua_State *L );
static int threads_recycle_set( lua_State *L );

/* Threads additions */
static int threads_send_async( lua_State *L );
static int threads_receive_async( lua_State *L );
static int threads_print( lua_State *L );
static int threads_print_raw( lua_State *L );
static int threads_sleep( lua_State *L );
static int threads_msleep( lua_State *L );
static int threads_lock( lua_State *L );
static int threads_unlock( lua_State *L );
static int threads_trylock( lua_State *L );
static int threads_wait_for( lua_State *L );
static int threads_signal( lua_State *L );
static int threads_broadcast( lua_State *L );
static int threads_rendezvous( lua_State *L );
static int threads_shared( lua_State *L );
static int threads_update( lua_State *L );
static int threads_export( lua_State *L );
static int threads_sbrk( lua_State *L );
static int threads_stacksize( lua_State *L );
static int threads_factory( lua_State *L );
static int threads_version( lua_State *L );
static int threads_factories( lua_State *L );
static int threads_gc( lua_State *L );

LUAMOD_API int luaopen_threads( lua_State *L );
static int luathread_loadlib( lua_State *L ); 

LUAMOD_API int luaopen_propeller( lua_State *L );

/* luathread function registration array */
static const struct luaL_Reg luathread_funcs[] = {

  /*
   * original luaproc functions:
   */

  { "newproc",       threads_create_newproc },
  { "wait",          threads_wait },
  { "send",          threads_send },
  { "receive",       threads_receive },
  { "newchannel",    threads_create_channel },
  { "delchannel",    threads_destroy_channel },
  { "setnumworkers", threads_set_numworkers },
  { "getnumworkers", threads_get_numworkers },
  { "recycle",       threads_recycle_set },

  /*
   * new threads functions: 
   */

  { "lock",          threads_lock },
  { "trylock",       threads_trylock },
  { "unlock",        threads_unlock },
  { "wait_for",      threads_wait_for },
  { "signal",        threads_signal },
  { "broadcast",     threads_broadcast },
  { "rendezvous",    threads_rendezvous },
  { "shared",        threads_shared },
  { "update",        threads_update },
  { "export",        threads_export },
  { "send_async",    threads_send_async },
  { "receive_async", threads_receive_async },
  { "sleep",         threads_sleep },
  { "msleep",        threads_msleep },
  { "print",         threads_print },
  { "output",        threads_print_raw },
  { "sbrk",          threads_sbrk },
  { "stacksize",     threads_stacksize },
  { "factories",     threads_factories },
  { "factory",       threads_factory },
  { "version",       threads_version },
  { "gc",            threads_gc },

  /* 
   * synonyms:
   */

  { "new",           threads_create_newproc },
  { "workers",       threads_set_numworkers },
  { "channel",       threads_create_channel },
  { "mutex",         threads_create_channel },
  { "condition",     threads_create_channel },
  { "destroy",       threads_destroy_channel },
  { "put",           threads_send },
  { "get",           threads_receive },
  { "aput",          threads_send_async },
  { "aget",          threads_receive_async },

  { NULL, NULL }
};

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
/******************
 * list functions *
 ******************/

/* insert a lua process in a (fifo) list */
void list_insert( list *l, luathread *lp ) {
  if ( l->head == NULL ) {
    l->head = lp;
  } else {
    l->tail->next = lp;
  }
  l->tail = lp;
  lp->next = NULL;
  l->nodes++;
}

/* remove and return the first lua process in a (fifo) list */
luathread *list_remove( list *l ) {
  if ( l->head != NULL ) {
    luathread *lp = l->head;
    l->head = lp->next;
    l->nodes--;
    return lp;
  } else {
    return NULL; /* if list is empty, return NULL */
  }
}

/* return a list's node count */
int list_count( list *l ) {
  return l->nodes;
}

/* initialize an empty list */
void list_init( list *l ) {
  l->head = NULL;
  l->tail = NULL;
  l->nodes = 0;
}

/*********************
 * channel functions *
 *********************/

/* create a new channel and insert it into channels table */
static channel *channel_create( const char *cname ) {

  channel *chan;

  /* get exclusive access to channels list */
  pthread_mutex_lock( &mutex_channel_list );

  /* create new channel and register its name */
  lua_getglobal( chanls, LUATHREAD_CHANNELS_TABLE );
  chan = (channel *)lua_newuserdata( chanls, sizeof( struct stchannel ));
  lua_setfield( chanls, -2, cname );
  lua_pop( chanls, 1 );  /* remove channel table from stack */

  /* initialize channel struct */
  list_init( &chan->send );
  list_init( &chan->recv );
  pthread_mutex_init( &chan->mutex, NULL );
  pthread_mutex_init( &chan->public, NULL );
  pthread_cond_init( &chan->can_be_used, NULL );
  pthread_cond_init( &chan->condition, NULL );

  /* release exclusive access to channels list */
  pthread_mutex_unlock( &mutex_channel_list );

  return chan;
}

/*
   return a channel (if not found, return null).
   caller function MUST lock 'mutex_channel_list' before calling this function.
 */
static channel *channel_unlocked_get( const char *chname ) {

  channel *chan;

  lua_getglobal( chanls, LUATHREAD_CHANNELS_TABLE );
  lua_getfield( chanls, -1, chname );
  chan = (channel *)lua_touserdata( chanls, -1 );
  lua_pop( chanls, 2 );  /* pop userdata and channel */

  return chan;
}

/*
   return a channel (if not found, return null) with its (mutex) lock set.
   caller function should unlock channel's (mutex) lock after calling this
   function. If ensure_usable is set, the channel must also be usable.
 */
static channel *channel_locked_get( const char *chname, int ensure_usable ) {

  channel *chan;
  int res;

  /* get exclusive access to channels list */
  pthread_mutex_lock( &mutex_channel_list );

  if (ensure_usable) {  
     /*
        try to get channel and lock it; if lock fails, release external
        lock ('mutex_channel_list') to try again when signaled -- this avoids
        keeping the external lock busy for too long. during the release,
        the channel may be destroyed, so it must try to get it again.
     */

     while ((( chan = channel_unlocked_get( chname )) != NULL ) &&
           ( pthread_mutex_trylock( &chan->mutex ) != 0 )) {
       pthread_cond_wait( &chan->can_be_used, &mutex_channel_list );
       pthread_mutex_unlock( &mutex_channel_list );
       pthread_yield();
       pthread_mutex_lock( &mutex_channel_list );
     }
  }
  else {
     /* return channel if it exists and we lock it */
     while ((( chan = channel_unlocked_get( chname )) != NULL ) &&
           ( pthread_mutex_trylock( &chan->mutex ) != 0 )) {
       pthread_mutex_unlock( &mutex_channel_list );
       pthread_yield();
       pthread_mutex_lock( &mutex_channel_list );
     }
  }
 

  /* release exclusive access to channels list */
  pthread_mutex_unlock( &mutex_channel_list );

  return chan;
}

/********************************
 * exported auxiliary functions *
 ********************************/

/* unlock access to a channel and signal it can be used */
void luathread_unlock_channel( channel *chan ) {

  /* get exclusive access to channels list */
  pthread_mutex_lock( &mutex_channel_list );
  /* release exclusive access to operate on a particular channel */
  pthread_mutex_unlock( &chan->mutex );
  /* signal that a particular channel can be used */
  pthread_cond_signal( &chan->can_be_used );
  /* release exclusive access to channels list */
  pthread_mutex_unlock( &mutex_channel_list );

}

/* insert lua process in recycle list */
void luathread_recycle_insert( luathread *lp ) {

  /* get exclusive access to recycled lua processes list */
  pthread_mutex_lock( &mutex_recycle_list );

  /* is recycle list full? */
  if ( list_count( &recycle_list ) >= recyclemax ) {
    /* destroy state */
    lua_close(lp->lstate);
  } else {
    /* empty stack and do garbage collection before recycling */
    lua_settop(lp->lstate, 0);
    lua_gc(lp->lstate, LUA_GCCOLLECT);
    /* insert lua process in recycle list */
    list_insert( &recycle_list, lp );
  }

  /* release exclusive access to recycled lua processes list */
  pthread_mutex_unlock( &mutex_recycle_list );

  /* yield to give workers a chance to execute */
  //pthread_yield();
}

/* queue a lua process that tried to send a message */
void luathread_queue_sender( luathread *lp ) {
  list_insert( &lp->chan->send, lp );
}

/* queue a lua process that tried to receive a message */
void luathread_queue_receiver( luathread *lp ) {
  list_insert( &lp->chan->recv, lp );
}

/********************************
 * internal auxiliary functions *
 ********************************/
static void luathread_loadbuffer( lua_State *parent, luathread *lp,
                                const char *code, size_t len ) {

  /* load lua process' lua code */
  int ret = luaL_loadbuffer( lp->lstate, code, len, code );

  /* in case of errors, close lua_State and push error to parent */
  if ( ret != 0 ) {
    lua_pushstring( parent, lua_tostring( lp->lstate, -1 ));
    lua_close( lp->lstate );
    luaL_error( parent, lua_tostring( parent, -1 ));
  }
}

/* copies values between lua states' stacks */
static int luathread_copyvalues( lua_State *Lfrom, lua_State *Lto ) {

  int i;
  int n = lua_gettop( Lfrom );
  const char *str;
  size_t len;

  /* ensure there is space in the receiver's stack */
  if ( lua_checkstack( Lto, n ) == 0 ) {
    lua_pushnil( Lto );
    lua_pushstring( Lto, "not enough space in the stack" );
    lua_pushnil( Lfrom );
    lua_pushstring( Lfrom, "not enough space in the receiver's stack" );
    return FALSE;
  }

  /* test each value's type and, if it's supported, copy value */
  for ( i = 2; i <= n; i++ ) {
    switch ( lua_type( Lfrom, i )) {
      case LUA_TBOOLEAN:
        lua_pushboolean( Lto, lua_toboolean( Lfrom, i ));
        break;
      case LUA_TNUMBER:
        copynumber( Lto, Lfrom, i );
        break;
      case LUA_TSTRING: {
        str = lua_tolstring( Lfrom, i, &len );
        lua_pushlstring( Lto, str, len );
        break;
      }
      case LUA_TNIL:
        lua_pushnil( Lto );
        break;
      case LUA_TTABLE:
        lua_newtable(Lto);
        lua_pushnil(Lfrom);  /* first key */
        while (lua_next(Lfrom, -2) != 0) {
          /* uses 'key' (at index -2) and 'value' (at index -1) */
          if (lua_type(Lfrom, -2) == LUA_TSTRING) {
             lua_pushstring(Lto, lua_tostring(Lfrom, -2));
             switch (lua_type(Lfrom, -1)) {
                case LUA_TBOOLEAN:
                   lua_pushboolean(Lto, lua_toboolean(Lfrom, -1));
                   lua_settable(Lto, -3);
                   break;
                case LUA_TNUMBER:
                   copynumber(Lto, Lfrom, -1);
                   lua_settable(Lto, -3);
                   break;
                case LUA_TSTRING:
                   lua_pushstring(Lto, lua_tostring(Lfrom, -1));
                   lua_settable(Lto, -3);
                   break;
                case LUA_TNIL:
                   lua_pushnil(Lto);
                   lua_settable(Lto, -3);
                   break;
                default:
                   /* cannot move other things, or recursively move tables */
                   lua_pop(Lto, 1);
                   break;
             }
          }
          /* remove 'value'; keep 'key' for next iteration */
          lua_pop(Lfrom, 1);
        }
        break;
      default: /* value type not supported:function, userdata, etc. */
        lua_settop( Lto, 1 );
        lua_pushnil( Lto );
        lua_pushfstring( Lto, "failed to receive value of unsupported type "
                                "'%s'", luaL_typename( Lfrom, i ));
        lua_pushnil( Lfrom );
        lua_pushfstring( Lfrom, "failed to send value of unsupported type "
                                "'%s'", luaL_typename( Lfrom, i ));
        return FALSE;
    }
  }
  return TRUE;
}

/* return the lua process associated with a given lua state */
static luathread *luathread_getself( lua_State *L ) {

  luathread *lp;

  lua_getfield( L, LUA_REGISTRYINDEX, "LUATHREAD_LP_UDATA" );
  lp = (luathread *)lua_touserdata( L, -1 );
  lua_pop( L, 1 );

  return lp;
}

#define FINALIZE_LP 0 /* set to 1 to enable finalizer (to debug gc) */

#if FINALIZE_LP
/* finalize luathread - called by gc just before collection */
static int luathread_lp_finalizer( lua_State *L ) {
  luathread *lp = (luathread *)lua_touserdata(L, 1);
  pthread_printf("FINALIZED %X\n", (unsigned long) lp);
  return 0;
}
#endif

/* create new lua process */
static luathread *luathread_new( lua_State *L ) {

  luathread *lp;
  lua_State *lpst;

  lpst = luaL_newstate();  /* create new lua state */

  /* store the lua process in its own lua state */
  lp = (luathread *)lua_newuserdata( lpst, sizeof( struct stluathread ));

#if FINALIZE_LP
  pthread_printf("ALLOCATED %X\n", (unsigned long)lp);
#endif

  lua_setfield( lpst, LUA_REGISTRYINDEX, "LUATHREAD_LP_UDATA" );

#if FINALIZE_LP
  luaL_newmetatable( lpst, "LUATHREAD_LP_FINALIZER_MT" );
  lua_pushcfunction( lpst, luathread_lp_finalizer );
  lua_setfield(lpst, -2, "__gc");
  lua_pop( lpst, 1 );

  lua_getfield( lpst, LUA_REGISTRYINDEX, "LUATHREAD_LP_UDATA" );
  lua_getfield( lpst, LUA_REGISTRYINDEX, "LUATHREAD_LP_FINALIZER_MT" );
  lua_setmetatable( lpst, -2 );
  lua_pop( lpst, 1 );
#endif

  luathread_openlualibs( lpst );  /* load standard libraries and luathread */
  /* register our own functions */
  requiref( lpst, "threads", luathread_loadlib, TRUE );
  requiref( lpst, "propeller", luaopen_propeller, TRUE );
#if (LUA_VERSION_NUM >= 502)
  requiref( lpst, "coroutine", luaopen_coroutine, TRUE );
#endif
  lp->lstate = lpst;  /* insert created lua state into lua process struct */

  return lp;
}

/* join schedule workers (called before exiting Lua) */
static int luathread_join_workers( lua_State *L ) {
  sched_join_workers();
  lua_close( chanls );
#if SEPARATE_GLOBAL_STATE
  lua_close( gstate );
#endif
  return 0;
}

/* simple writer - buffer will initially be allocated to at least
** MIN_ALLOC_SIZE bytes, and re-allocated as needed. Note the buffer is 
** only freed by an gc() call with 2 as the parameter, so MIN_ALLOC_SIZE 
** should be kept as small as practical.
*/
#define MIN_ALLOC_SIZE 100
static char *codebuff = NULL;
static int buffsize = 0;
static int usedsize = 0;

/* calls to the writer must be protected by the optimization mutex */
static int writer (lua_State *L, const void *b, size_t size, void *ud) {
  int i;
  if (buffsize == 0) {
    /* no buffer allocated - allocate one */
    codebuff = malloc(size + MIN_ALLOC_SIZE);
    if (codebuff != NULL) {
       buffsize = size + MIN_ALLOC_SIZE;
       //printf("buffize = %d\n", buffsize);
    }
    else {
       printf("CANNOT ALLOCATE CODE BUFFER\n");      
       return 1;
    }
  }
  else if (usedsize + size + 1 >= buffsize) {
    /* buffer not large enough - reallocate it */
    codebuff = realloc(codebuff, usedsize + size + MIN_ALLOC_SIZE);
    if (codebuff != NULL) {
       buffsize = usedsize + size + MIN_ALLOC_SIZE;
       //printf("buffize = %d\n", buffsize);
    }
    else {
       printf("CANNOT REALLOCATE CODE BUFFER\n");      
       return 1;
    }
  }
  for (i = 0; i < size; i++) {
    //printf("[%2x] ", *((char *)b+i));
    codebuff[usedsize] = *((char *)b+i);
    usedsize++;
  }
  //printf("\n");
  for (i = usedsize; i < buffsize; i++) {
     codebuff[i] = '\0';
  }
  return 0;
}


/* return the current value of the C system break (i.e. sbrk) 
** Also, if the parameter is true, free the writer codebuff
** (which is not freed anywhere else) and also defragment 
** the heap
*/
static int threads_sbrk( lua_State *L ) {
  register lua_Integer s;
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     if (lua_toboolean(L, 1)) { /* defragment flag */
       /* get exclusive access to memory optimization */
       pthread_mutex_lock( &mutex_memopt );
       /* defragment the heap */
       proc_stall();
       malloc_defragment();
       proc_allow();
       /* release exclusive access to memory optimization */
       pthread_mutex_unlock( &mutex_memopt );
     }
  }
  /* return the current sbrk value */
  proc_stall();
  s = sbrk(0);
  proc_allow();
  pushint( L, s);
#else
  pushint( L, 0);
#endif
  return 1;
}

/*
 * perform a garbage collection, and return the sbrk value, 
 * and (if there is a parameter), also:
 *    if parameter is 0, return the sbrk value
 *    if parameter is 1, do a heap defragmentation and return sbrk value
 *    if parameter is 2, free the code buffer (if unused)
 */
static int threads_gc( lua_State *L ) {
  register lua_Integer s = 0;
#ifdef __CATALINA__
  //pthread_printf("gc!!!\n");
  /* get exclusive access to memory optimization */
  pthread_mutex_lock( &mutex_memopt );
  /* always perform a garbage collection */
  lua_gc(L, LUA_GCCOLLECT);
  if (lua_gettop(L) > 0) {
     /* validate optimize level is a number */
     register lua_Integer optimize = luaL_checkinteger( L, 1 );
     if (optimize == 0) {
        proc_stall();
        s = sbrk(0);
        proc_allow();
     }
     if (optimize == 1) {
        /* defragment the heap */
        proc_stall();
        malloc_defragment();
        s = sbrk(0);
        proc_allow();
     }
     if (optimize == 2) {
        /* free the code buffer if unused */
        if ((codebuff != NULL) && (usedsize == 0)) {
           /* the code buffer is not in use */
           proc_stall();
           free(codebuff);
           codebuff = NULL;
           usedsize = 0;
           buffsize = 0;
           proc_allow();
        }
     }
  }
  /* release exclusive access to memory optimization */
  pthread_mutex_unlock( &mutex_memopt );
  /* return 0, or the current sbrk value */
  pushint( L, s);
  //pthread_printf("gc done!!!\n");
#else
  pushint( L, 0);
#endif
  return 1;
}

/* calls to func_dump must be protected by the optimization mutex */
static int func_dump (lua_State *L) {
  int strip = 0;//lua_toboolean(L, 2);
  usedsize = 0;
  luaL_checktype(L, 1, LUA_TFUNCTION);
  //lua_settop(L, 1);  /* ensure function is on the top of the stack */
  if (dump(L, writer, NULL, strip) != 0) {
     return luaL_error(L, "unable to dump given function");
  }
  return 1;
}

/* copies upvalues between lua states' stacks */
static int luathread_copyupvalues( lua_State *Lfrom, lua_State *Lto, 
                                 int funcindex ) {

  int i = 1;
  const char *str;
  size_t len;
  const char *name;

  /* test the type of each upvalue and, if it's supported, copy it */
  while ( (name = lua_getupvalue( Lfrom, funcindex, i )) != NULL ) {
    switch ( lua_type( Lfrom, -1 )) {
      case LUA_TBOOLEAN:
        lua_pushboolean( Lto, lua_toboolean( Lfrom, -1 ));
        break;
      case LUA_TNUMBER:
        copynumber( Lto, Lfrom, -1 );
        break;
      case LUA_TSTRING: {
        str = lua_tolstring( Lfrom, -1, &len );
        lua_pushlstring( Lto, str, len );
        break;
      }
      case LUA_TNIL:
        lua_pushnil( Lto );
        break;
      /* if upvalue is a table, check whether it is the global environment
         (_ENV) from the source state Lfrom. in case so, push in the stack of
         the destination state Lto its own global environment to be set as the
         corresponding upvalue; otherwise, treat it as a regular non-supported
         upvalue type. */
      case LUA_TTABLE:
        lua_pushglobaltable( Lfrom );
        if ( isequal( Lfrom, -1, -2 )) {
          lua_pop( Lfrom, 1 );
          lua_pushglobaltable( Lto );
          break;
        }
        lua_pop( Lfrom, 1 );
        /* FALLTHROUGH */
      default: /* value type not supported: table, function, userdata, etc. */
        lua_pushnil( Lfrom );
        lua_pushfstring( Lfrom, "failed to copy upvalue of unsupported type "
                                "'%s'", luaL_typename( Lfrom, -2 ));
        return FALSE;
    }
    lua_pop( Lfrom, 1 );
    if ( (name = lua_setupvalue( Lto, 1, i )) == NULL ) {
      lua_pushnil( Lfrom );
      lua_pushstring( Lfrom, "failed to set upvalue" );
      return FALSE;
    }
    i++;
  }
  return TRUE;
}


/*********************
 * library functions *
 *********************/

/* set maximum number of lua processes in the recycle list */
static int threads_recycle_set( lua_State *L ) {

  register luathread *lp;

  /* validate parameter is a non negative number */
  lua_Integer max = luaL_checkinteger( L, 1 );
  luaL_argcheck( L, max >= 0, 1, "recycle limit must be zero or positive" );

  /* get exclusive access to recycled lua processes list */
  pthread_mutex_lock( &mutex_recycle_list );

  recyclemax = max;  /* set maximum number */

  /* remove extra nodes and destroy each lua processes */
  while ( list_count( &recycle_list ) > recyclemax ) {
    lp = list_remove( &recycle_list );
    lua_close( lp->lstate );
  }
  /* release exclusive access to recycled lua processes list */
  pthread_mutex_unlock( &mutex_recycle_list );

  /* yield to give workers a chance to execute */
  pthread_yield();

  return 0;
}

/* with no parameters, wait until there are no more active lua processes
 * with a parameter, wait for the public condition associated with the 
 * specified channel */
static int threads_wait( lua_State *L ) {
   register int nargs;

   /* get number of arguments passed to function */
   nargs = lua_gettop( L );

   if (nargs > 0) { /* wait for condition */
      return threads_wait_for(L);
   }
   else {
      sched_wait();
#ifdef __CATALINA__XXX
      /* defgragment the C heap */
      proc_stall();
      malloc_defragment();
      proc_allow();
#endif
     return 0;
  }
}

/* set number of workers (creates or destroys accordingly) */
static int threads_set_numworkers( lua_State *L ) {

  if (lua_gettop(L) > 0) {
     /* validate parameter is a positive number */
     register lua_Integer numworkers = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, numworkers >= 0, 1, "number of workers must be zero or positive" );

     /* set number of threads; signal error on failure */
     if (sched_set_numworkers(numworkers) == LUATHREAD_SCHED_PTHREAD_ERROR ) {
         luaL_error( L, "failed to create worker" );
     } 
#ifdef __CATALINA__XXX
      /* defgragment the C heap */
      proc_stall();
      malloc_defragment();
      proc_allow();
#endif
    pthread_yield();
  }
  /* return number of active workers (which may not yet be the number set!) */
  pushint( L, sched_get_numworkers( ));
  return 1;
}

/* return the number of active workers */
static int threads_get_numworkers( lua_State *L ) {
  pushint( L, sched_get_numworkers( ));
  return 1;
}

/* create and schedule a new lua process */
static int threads_create_newproc( lua_State *L ) {

  size_t len;
  register luathread *lp;
  register const char *code;
  register int d;
  register int lt = lua_type( L, 1 );
  register int top;
  register int i;

  /* get exclusive access to memory optimization */
  pthread_mutex_lock( &mutex_memopt );

  top = lua_gettop(L);
  /* check function argument type - must be function or string; in case it is
     a function, dump it into a binary string */
  if ( lt == LUA_TFUNCTION ) {
    d = func_dump( L );
    if ( d != 1 ) {
      lua_pushnil( L );
      lua_pushfstring( L, "error dumping function to binary string" );
      /* release exclusive access to memory optimization */
      pthread_mutex_unlock( &mutex_memopt );
      return 2;
    }
  }
  else if ( lt != LUA_TSTRING ) {
    lua_pushnil( L );
    lua_pushfstring( L, "cannot use '%s' to create a new process",
                     luaL_typename( L, 1 ));
    /* release exclusive access to memory optimization */
    pthread_mutex_unlock( &mutex_memopt );
    return 2;
  }

  /* get exclusive access to recycled lua processes list */
  pthread_mutex_lock( &mutex_recycle_list );

  /* check if a lua process can be recycled */
  if ( recyclemax > 0 ) {
    lp = list_remove( &recycle_list );
    /* otherwise create a new lua process */
    if ( lp == NULL ) {
      lp = luathread_new( L );
    }
    else {
      lua_settop(lp->lstate, 0);
    }
  } else {
    lp = luathread_new( L );
  }

  /* init lua process */
  lp->status = LUATHREAD_STATUS_IDLE;
  lp->args   = 0;
  lp->chan   = NULL;
  lp->next   = NULL;

   /* release exclusive access to recycled lua processes list */
   pthread_mutex_unlock( &mutex_recycle_list );

   /* if lua process is being created from a function, copy its upvalues and
     remove dumped binary string from stack */
   if ( lt == LUA_TFUNCTION ) {

     /* load code to new lua process */
     luathread_loadbuffer( L, lp, codebuff, usedsize );
     usedsize = 0; /* code buffer is now unused */

     /* copy upvalues from old process to new process */
     if ( luathread_copyupvalues( L, lp->lstate, top ) == FALSE ) {

        luathread_recycle_insert( lp ); 

        /* release exclusive access to memory optimization */
        pthread_mutex_unlock( &mutex_memopt );
        return 2;
     }
  }
  else {
     /* get pointer to code string */
     code = lua_tolstring( L, top, &len );
     /* load code to new lua process */
     luathread_loadbuffer( L, lp, code, len );
  }

  sched_inc_lpcount();   /* increase active lua process count */
  sched_queue_proc( lp );  /* schedule lua process for execution */
  lua_pushboolean( L, TRUE );

  /* release exclusive access to memory optimization */
  pthread_mutex_unlock( &mutex_memopt );
  return 1;
}

/* send a message to a lua process */
static int threads_send( lua_State *L ) {

  register int ret;
  register channel *chan;
  register luathread *dstlp, *self;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 1 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }


  /* remove first lua process, if any, from channel's receive list */
  dstlp = list_remove( &chan->recv );
  
  if ( dstlp != NULL ) { /* found a receiver? */
    /* try to move values between lua states' stacks */
    ret = luathread_copyvalues( L, dstlp->lstate );
    /* -1 because channel name is on the stack */
    dstlp->args = lua_gettop( dstlp->lstate ) - 1; 
    if ( dstlp->lstate == mainlp.lstate ) {
      /* if sending process is the parent (main) Lua state, unblock it */
      pthread_mutex_lock( &mutex_mainls );
      pthread_cond_signal( &cond_mainls_sendrecv );
      pthread_mutex_unlock( &mutex_mainls );
    } else {
      /* schedule receiving lua process for execution */
      sched_queue_proc( dstlp );
    }
    /* unlock channel access */
    luathread_unlock_channel( chan );
    if ( ret == TRUE ) { /* was send successful? */
      lua_settop(L, 0);
      lua_pushboolean( L, TRUE );
      return 1;
    } else { /* nil and error msg already in stack */
      return 2;
    }

  } else { 
    if ( L == mainlp.lstate ) {
      /* sending process is the parent (main) Lua state - block it */
      mainlp.chan = chan;
      luathread_queue_sender( &mainlp );
      luathread_unlock_channel( chan );
      pthread_mutex_lock( &mutex_mainls );
      pthread_cond_wait( &cond_mainls_sendrecv, &mutex_mainls );
      pthread_mutex_unlock( &mutex_mainls );
      return mainlp.args;
    } else {
      /* sending process is a standard luathread - set status, block and yield */
      self = luathread_getself( L );
      if ( self != NULL ) {
        self->status = LUATHREAD_STATUS_BLOCKED_SEND;
        self->chan   = chan;
      }
      /* yield. channel will be unlocked by the scheduler */
      return lua_yield( L, lua_gettop( L ));
    }
  }
}

/* send a message to a lua process asynchronously */
static int threads_send_async( lua_State *L ) {

  register int ret;
  register channel *chan;
  register luathread *dstlp;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 1 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }

  /* remove first lua process, if any, from channel's receive list */
  dstlp = list_remove( &chan->recv );
  
  if ( dstlp != NULL ) { /* found a receiver? */
    /* try to move values between lua states' stacks */
    ret = luathread_copyvalues( L, dstlp->lstate );
    /* -1 because channel name is on the stack */
    dstlp->args = lua_gettop( dstlp->lstate ) - 1; 
    if ( dstlp->lstate == mainlp.lstate ) {
      /* if sending process is the parent (main) Lua state, unblock it */
      pthread_mutex_lock( &mutex_mainls );
      pthread_cond_signal( &cond_mainls_sendrecv );
      pthread_mutex_unlock( &mutex_mainls );
    } else {
      /* schedule receiving lua process for execution */
      sched_queue_proc( dstlp );
    }
    /* unlock channel access */
    luathread_unlock_channel( chan );
    if ( ret == TRUE ) { /* was send successful? */
      lua_settop(L, 0);
      lua_pushboolean( L, TRUE );
      return 1;
    } else { /* nil and error msg already in stack */
      return 2;
    }

  } else { 
    /* unlock channel access */
    luathread_unlock_channel( chan );
    /* return an error (but not a fatal error!) */
    lua_pushnil( L );
    lua_pushfstring( L, "no receivers waiting on channel '%s'", chname );
    return 2;
  }
}

/* lock the public mutex associated with a channel */
static int threads_lock( lua_State *L ) {

  channel *chan;
  const char *chname = luaL_checkstring( L, 1 );
  int res;

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  while (( chan != NULL ) &&
        ( (res = pthread_mutex_trylock( &chan->public )) != 0 )) {
    pthread_mutex_unlock( &chan->mutex );
    pthread_yield();
    chan = channel_locked_get( chname, 0 );
  }
  if (chan == NULL) {
     lua_pushboolean( L, FALSE );
     return 1;
  }
  else {
     pthread_mutex_unlock( &chan->mutex );
     lua_pushboolean( L, TRUE );
     return 1;
  }
}

/* try to lock the public mutex associated with a channel */
static int threads_trylock( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  if (pthread_mutex_trylock( &chan->public ) == 0 ) {
     pthread_mutex_unlock( &chan->mutex );
     lua_pushboolean( L, TRUE );
  }
  else {
     pthread_mutex_unlock( &chan->mutex );
     lua_pushboolean( L, FALSE );
  }
  return 1;
}

/* unlock the public mutex associated with a channel */
static int threads_unlock( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  if (pthread_mutex_unlock( &chan->public ) == 0) {
     pthread_mutex_unlock( &chan->mutex );
     lua_pushboolean( L, TRUE );
  }
  else {
     pthread_mutex_unlock( &chan->mutex );
     lua_pushboolean( L, FALSE );
  }
  return 1;
}

/* wait for the public condition associated with a channel */
static int threads_wait_for( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );
  register int nargs;

  /* get number of arguments passed to function */
  nargs = lua_gettop( L );

  if (nargs != 1) {
    lua_pushnil(L);
    lua_pushfstring(L, "wait_for: incorrect number of arguments");
    return 2;
  }

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  pthread_mutex_unlock( &chan->mutex );
  pthread_cond_wait( &chan->condition, &chan->public );
  lua_pushboolean( L, TRUE );
  return 1;
}

/* signal the public condition associated with a channel */
static int threads_signal( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  pthread_cond_signal( &chan->condition );

  pthread_mutex_unlock( &chan->mutex );
  pthread_yield();
  lua_pushboolean( L, TRUE );
  return 1;
}

/* broadcast the public condition associated with a channel */
static int threads_broadcast( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  pthread_cond_broadcast( &chan->condition );
  pthread_mutex_unlock( &chan->mutex );
  pthread_yield();
  lua_pushboolean( L, TRUE );
  return 1;
}

/* rendezvous using the condition and mutex associated with a channel */
static int threads_rendezvous( lua_State *L ) {

  register int res;
  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  //pthread_printf("rendezvous %s\n", chname);
  chan = channel_locked_get( chname, 0 );
  /* if channel is not found, return an error to lua */
  if ( chan == NULL ) {
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
/*
   A Rendezvous implements the following logic in a single call:

     lock(condition)
     broadcast(condition)
     wait_for(condition)
     unlock(condition)
     broadcast(condition)

   The result is that if one thread calls a rendezvous on a channel, it will 
   be suspended until another thread calls the same rendezvous - then BOTH 
   threads will proceed. The important feature of a rendezvous is that it 
   does not matter in which order the threads call it.

*/

  /* lock the condition mutex */

  while (( chan != NULL ) &&
        ( (res = pthread_mutex_trylock( &chan->public )) != 0 )) {
    pthread_mutex_unlock( &chan->mutex );
    pthread_yield();
    chan = channel_locked_get( chname, 0 );
  }
  if (chan == NULL) {
     lua_pushboolean( L, FALSE );
     return 1;
  }

  /* broadcast the condition */

  pthread_cond_broadcast( &chan->condition );
  pthread_yield();

  /* wait for the condition */

  pthread_mutex_unlock( &chan->mutex );
  pthread_cond_wait( &chan->condition, &chan->public );

  /* unlock the condition mutex */

  /* lock the channel mutex again */
  chan = channel_locked_get( chname, 0 );
  /* if channel is not found this time it has been destroyed, 
   * so return an error to lua */
  if ( chan == NULL ) {
    /* unlock the condition mutex before returning */
    pthread_mutex_unlock( &chan->public );
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }
  else {
    /* unlock the condition mutex */
    pthread_mutex_unlock( &chan->public );
  }

  /* broadcast the condition */

  pthread_cond_broadcast( &chan->condition );
  pthread_yield();

  pthread_mutex_unlock( &chan->mutex );
  pthread_yield();

  //pthread_printf("rendezvous %s complete\n", chname);
  /* and return TRUE */
  lua_pushboolean( L, TRUE );
  return 1;
}


/* stackDump - handy debugging function */
/*
static void stackDump (lua_State *L) {
   int i;
   int top = lua_gettop(L); // depth of the stack 
   for (i = 1; i <= top; i++) { // repeat for each level 
      int t = lua_type(L, i);
      switch (t) {
         case LUA_TSTRING: { // strings 
            pthread_printf("'%s'", lua_tostring(L, i));
            break;
         }
         case LUA_TBOOLEAN: { // Booleans 
            pthread_printf(lua_toboolean(L, i) ? "true" : "false");
            break;
         }
         case LUA_TNUMBER: { // numbers 
            pthread_printf("%g", lua_tonumber(L, i));
            break;
         }
         default: { // other values 
            pthread_printf("%s", lua_typename(L, t));
            break;
         }
      }
      pthread_printf(" "); // put a separator 
   }
   pthread_printf("\n"); // end the listing 
}
*/

static int simple_type(int t) {
   return ((t == LUA_TNIL) 
        || (t == LUA_TNUMBER) 
        || (t == LUA_TBOOLEAN) 
        || (t == LUA_TSTRING));
}

/* move (not copy!) ALL values between lua states' stacks
 *
 * Simple values (nil, string, number, boolean) are just moved stack to stack.
 * For tables, the Lfrom stack contains the source table, and the Lto stack 
 * must already contain a suitable table - a key, value pair is created in the 
 * destination table for every simple key, value pair in the source table -
 * non-simple values are not moved.
 *
 */
static int luathread_movevalues(lua_State *Lfrom, lua_State *Lto) {

  int i;
  int n = lua_gettop(Lfrom);
  const char *str;
  size_t len;

  /* ensure there is space in the receiver's stack */
  if (lua_checkstack(Lto, n) == 0) {
    return FALSE;
  }

  /* test each value's type and, if it's supported, copy value */
  for (i = 1; i <= n; i++) {
    switch (lua_type(Lfrom, i)) {
      case LUA_TBOOLEAN:
        lua_pushboolean(Lto, lua_toboolean(Lfrom, i));
        break;
      case LUA_TNUMBER:
        copynumber(Lto, Lfrom, i);
        break;
      case LUA_TSTRING:
        str = lua_tolstring(Lfrom, i, &len);
        lua_pushlstring(Lto, str, len);
        break;
      case LUA_TNIL:
        lua_pushnil(Lto);
        break;
      case LUA_TTABLE:
        lua_pushnil(Lfrom);  /* first key */
        while (lua_next(Lfrom, -2) != 0) {
          /* uses 'key' (at index -2) and 'value' (at index -1) */
          if (lua_type(Lfrom, -2) == LUA_TSTRING) {
             lua_pushstring(Lto, lua_tostring(Lfrom, -2));
             switch (lua_type(Lfrom, -1)) {
                case LUA_TBOOLEAN:
                   lua_pushboolean(Lto, lua_toboolean(Lfrom, -1));
                   lua_settable(Lto, -3);
                   break;
                case LUA_TNUMBER:
                   copynumber(Lto, Lfrom, -1);
                   lua_settable(Lto, -3);
                   break;
                case LUA_TSTRING:
                   lua_pushstring(Lto, lua_tostring(Lfrom, -1));
                   lua_settable(Lto, -3);
                   break;
                case LUA_TNIL:
                   lua_pushnil(Lto);
                   lua_settable(Lto, -3);
                   break;
                default:
                   /* cannot move other things, or recursively move tables */
                   lua_pop(Lto, 1);
                   break;
             }
          }
          /* remove 'value'; keep 'key' for next iteration */
          lua_pop(Lfrom, 1);
        }
        break;
      default: 
        /* value type not supported: function, userdata, etc. */
        return FALSE;
    }
  }
  /* remove values from original stack */
  lua_pop(Lfrom, n);
  return TRUE;
}

/* fetch a field from the shared global state */
static int threads_shared(lua_State *L) {

  const char *globalname = luaL_checkstring(L, 1);
  char tmpname[MAX_GLOBAL_NAMELEN+1];
  char *tmpptr; 
  char *nxtptr;
  int nargs; 
  int ret;

  /* get number of arguments passed to function */
  nargs = lua_gettop(L);
  if (nargs != 1) {
    lua_pushnil(L);
    lua_pushfstring(L, "shared: incorrect number of arguments");
    return 2;
  }

  if (globalname == NULL) {
    lua_pushnil(L);
    lua_pushstring(L, "shared: key must be a string");
    return 2;
  }

  /* get exclusive access to global state */
  pthread_mutex_lock(&mutex_global_state);

  /* we no longer need the global name on the stack */
  lua_pop(L, 1);

  if (strchr(globalname,'.') == NULL) {
     /* no fields specified - get the global from the global state */
     lua_getglobal(gstate, globalname);
     if (lua_istable(gstate, -1)) {
        /* create a new table for the key, value pairs */
        lua_newtable(L);
     }
     /* move the values to our stack */
     ret = luathread_movevalues(gstate, L);
     if (ret == TRUE) {

        /* release exclusive access to global state */
        pthread_mutex_unlock(&mutex_global_state);

        return 1;
     }
   }
  else {
     /* iteratively decode the name before fetching the value,
      * from the global state
      */
     strncpy(tmpname, globalname, MAX_GLOBAL_NAMELEN);
     tmpname[MAX_GLOBAL_NAMELEN]= '\0';
     tmpptr = strtok(tmpname, ".");
     lua_getglobal(gstate, tmpptr);
     if ((lua_gettop(gstate) == 0) || !lua_istable(gstate, -1)) {
        lua_pushnil(L);
        return 1;
     }
     tmpptr = strtok(NULL, ".");
     nxtptr = strtok(NULL, ".");
     while (nxtptr != NULL) {
        lua_pushstring(gstate, tmpptr);
        lua_gettable(gstate, -2);
        if (!lua_istable(gstate, -1)) {
           /* we no longer need the table or the value */
           lua_pop(gstate, 2);
           lua_pushnil(L);
           lua_pushfstring(L, "shared: key %s does not exist\n", tmpptr);
           return 2;
        }
        /* no longer need the previous table  */
        lua_remove(gstate, -2);
        tmpptr = nxtptr;
        nxtptr = strtok(NULL, ".");
     }
     /* get the final key value */
     lua_getfield(gstate, -1, tmpptr);
     /* we don't need the table any more (and copying it would fail)
      * so delete it before moving the value back to our stack
      */
     lua_remove(gstate, -2);
     if (lua_istable(gstate, -1)) {
        /* create a new table for the key, value pairs */
        lua_newtable(L);
     }
     ret = luathread_movevalues(gstate, L);
     if (ret == TRUE) {

        /* release exclusive access to global state */
        pthread_mutex_unlock(&mutex_global_state);

        return 1;
     }
  }
  /* something went wrong with one of the moves! */
  lua_pushnil(L);
  lua_pushstring(L, "shared: not enough stack or unsupported type\n");

  /* release exclusive access to global state */
  pthread_mutex_unlock(&mutex_global_state);

  return 2;
}

/* export a table or variable into the shared global state */
static int threads_export(lua_State *L) {

  const char *globalname = luaL_checkstring(L, 1);
  char tmpname[MAX_GLOBAL_NAMELEN+1];
  char *tmpptr; 
  char *nxtptr; 
  int nargs;
  int ret;

  /* get number of arguments passed to function */
  nargs = lua_gettop(L);
  if (nargs != 1) {
    lua_pushnil(L);
    lua_pushfstring(L, "export: incorrect number of arguments");
    return 2;
  }

  if (globalname == NULL) {
    lua_pushnil(L);
    lua_pushfstring(L, "export: key must be a string");
    return 2;
  }

  /* get exclusive access to global state */
  pthread_mutex_lock(&mutex_global_state);

  /* we no longer need the global name on the stack */
  lua_pop(L, 1);

  if (strchr(globalname,'.') == NULL) {
     /* no field specified - get the global value onto our stack */
     lua_getglobal(L, globalname);
     /* if the source is a table, we must check if the table already
      * exists in the global state - load it on to the global stack
      * if it does, or create a new table if it does not
      */
     if ((lua_gettop(L) > 0) && (lua_istable(L, -1))) {
        lua_getglobal(gstate, globalname);
        if ((lua_gettop(gstate) == 0) || !lua_istable(gstate, -1)) {
           /* table doesn't exist in the global state, or the
            * global exists but is it not a table
            */
           lua_pop(gstate, 1);
           lua_newtable(gstate);
        }
     }
     /* move the value to the global state stack */
     ret = luathread_movevalues(L, gstate);
     if (ret == TRUE) { 
        /* we need to do the update from the global state */
        lua_setglobal(gstate, globalname);

        /* release exclusive access to global state */
        pthread_mutex_unlock(&mutex_global_state);

        return 0;
     }
  }
  else {
     /* iteratively decode the name before exporting the value,
      * which we need to save in the global state - so we
      * iterate on both stacks simultaneously to get where
      * we need to be
      */
     strncpy(tmpname, globalname, MAX_GLOBAL_NAMELEN);
     tmpname[MAX_GLOBAL_NAMELEN]= '\0';
     tmpptr = strtok(tmpname, ".");
     lua_getglobal(L, tmpptr);
     if ((lua_gettop(L) == 0) || !lua_istable(L, -1)) {
        lua_pushnil(L);
        lua_pushfstring(L, "export: key %s does not exist\n", tmpptr);
        return 2;
     }
     lua_getglobal(gstate, tmpptr);
     if (!lua_istable(gstate, -1)) {
        /* pop the nil value */
        lua_pop(gstate, 1);
        /* table doesn't exist, so create a new one */
        lua_newtable(gstate);
        lua_setglobal(gstate, tmpptr);
        lua_getglobal(gstate, tmpptr);
     }
     tmpptr = strtok(NULL, ".");
     nxtptr = strtok(NULL, ".");
     while (nxtptr != NULL) {
        lua_pushstring(L, tmpptr);
        lua_gettable(L, -2);
        if (!lua_istable(L, -1)) {
           lua_pushnil(L);
           lua_pushfstring(L, "export: key %s does not exist\n", tmpptr);
           return 2;
        }
        lua_pushstring(gstate, tmpptr);
        lua_gettable(gstate, -2);
        if (!lua_istable(gstate, -1)) {
           /* pop the non-table value */
           lua_pop(gstate, 1);
           /* table doesn't exist, so create a new one */
           lua_newtable(gstate);
           lua_setfield(gstate, -2, tmpptr);
           lua_pushstring(gstate, tmpptr);
           lua_gettable(gstate, -2);
        }
        /* no longer need the previous tables (on either stack) */
        lua_remove(L, -2);
        lua_remove(gstate, -2);
        tmpptr = nxtptr;
        nxtptr = strtok(NULL, ".");
     }
     lua_pushstring(L, tmpptr);
     lua_gettable(L, -2);
     /* we don't need the table any more (and copying it would fail)
      * so delete it before moving the value to the global state stack
      */
     lua_remove(L, -2);
     if (lua_istable(L, -1)) {
        lua_pushstring(gstate, tmpptr);
        lua_gettable(gstate, -2);
        if (!lua_istable(gstate, -1)) {
           /* pop the non-table value */
           lua_pop(gstate, 1);
           /* table doesn't exist, so create a new one */
           lua_newtable(gstate);
           lua_setfield(gstate, -2, tmpptr);
           lua_pushstring(gstate, tmpptr);
           lua_gettable(gstate, -2);
        }
     }
     /* now move the value to the global state stack */
     ret = luathread_movevalues(L, gstate);
     lua_setfield(gstate, -2, tmpptr);
     /* pop the table */
     lua_pop(gstate, 1);

     /* release exclusive access to global state */
     pthread_mutex_unlock(&mutex_global_state);

     return 0;
  }
  /* something went wrong with one of the moves! */
  lua_pushnil(L);
  lua_pushstring(L, "export: not enough stack or unsupported type\n");

  /* release exclusive access to global state */
  pthread_mutex_unlock(&mutex_global_state);

  return 2;


}

/* update a field in the shared global state */
static int threads_update(lua_State *L) {

  const char *globalname = luaL_checkstring(L, 1);
  char tmpname[MAX_GLOBAL_NAMELEN+1];
  char *tmpptr; 
  char *nxtptr; 
  int ret;
  int nargs;

  /* get number of arguments passed to function */
  nargs = lua_gettop(L);
  if (nargs != 2) {
    lua_pushnil(L);
    lua_pushfstring(L, "update: incorrect number of arguments");
    return 2;
  }

  if (!simple_type(lua_type(L, -1))) {
    lua_pushnil(L);
    lua_pushfstring(L, "update: value must be a simple type");
    return 2;
  }

  if (globalname == NULL) {
    lua_pushnil(L);
    lua_pushfstring(L, "update: key must be a string");
    return 2;
  }

  /* get exclusive access to global state */
  pthread_mutex_lock(&mutex_global_state);

  /* we no longer need the global name on the stack */
  lua_remove(L, -2);

  if (strchr(globalname,'.') == NULL) {
     /* move the new value to the global state stack */
     ret = luathread_movevalues(L, gstate);
     if (ret == TRUE) { 
        /* update the value in the global state */
        lua_setglobal(gstate, globalname);

        /* release exclusive access to global state */
        pthread_mutex_unlock(&mutex_global_state);

        return 0;
     }
  }
  else {
     /* iteratively decode the name before updating the value,
      * which we need to do from the global state
      */
     strncpy(tmpname, globalname, MAX_GLOBAL_NAMELEN);
     tmpname[MAX_GLOBAL_NAMELEN]= '\0';
     tmpptr = strtok(tmpname, ".");
     lua_getglobal(gstate, tmpptr);
     if (!lua_istable(gstate, -1)) {
        /* pop the nil value */
        lua_pop(gstate, 1);
        /* table doesn't exist, so create a new one */
        lua_newtable(gstate);
        lua_setglobal(gstate, tmpptr);
        lua_getglobal(gstate, tmpptr);
     }
     tmpptr = strtok(NULL, ".");
     nxtptr = strtok(NULL, ".");
     while (nxtptr != NULL) {
        lua_pushstring(gstate, tmpptr);
        lua_gettable(gstate, -2);
        if (!lua_istable(gstate, -1)) {
           /* pop the nil value */
           lua_pop(gstate, 1);
           /* table doesn't exist, so create a new one */
           lua_pushstring(gstate, tmpptr);
           lua_newtable(gstate);
           lua_settable(gstate, -3);
           lua_pushstring(gstate, tmpptr);
           lua_gettable(gstate, -2);
        }
        /* no longer need the previous table  */
        lua_remove(gstate, -2);
        tmpptr = nxtptr;
        nxtptr = strtok(NULL, ".");
     }
     /* push the final key name */
     lua_pushstring(gstate, tmpptr);
     /* move the value to the global state stack */
     ret = luathread_movevalues(L, gstate);
     /* set the value for the key */
     lua_settable(gstate, -3);
     /* pop the table */
     lua_pop(gstate, 1);

     /* release exclusive access to global state */
     pthread_mutex_unlock(&mutex_global_state);

     return 0;
  }
  /* something went wrong with one of the moves! */
  lua_pushnil(L);
  lua_pushstring(L, "update: not enough stack or unsupported type\n");

  /* release exclusive access to global state */
  pthread_mutex_unlock(&mutex_global_state);

  return 2;
}

/* receive a message from a lua process asynchronously - 
 * equivalent to receive with the async parameter */
static int threads_receive_async( lua_State *L ) {

  if ((lua_gettop(L) == 2) && lua_toboolean( L, 2 )) {
     return threads_receive(L);
  }
  else {
     lua_pushboolean(L, TRUE );
     return threads_receive(L);
  }
}

/* receive a message from a lua process */
static int threads_receive( lua_State *L ) {

  register int ret, nargs, async;
  register channel *chan;
  register luathread *srclp, *self;
  register const char *chname = luaL_checkstring( L, 1 );

  /* get number of arguments passed to function */
  nargs = lua_gettop( L );

  if ( lua_toboolean( L, 2 )) { /* asynchronous receive */
     async = 1;
  }
  else {
     async = 0;
  }
  chan = channel_locked_get( chname, !async );
  /* if channel is not found, return an error to Lua */
  if ( chan == NULL ) {
    if (async) {
      /* return an error (but not a fatal one) */
      lua_pushnil( L );
      lua_pushfstring( L, "no senders waiting on channel '%s'", chname );
      return 2;
    }
    else {
      /* return an error */
      lua_pushnil( L );
      lua_pushfstring( L, "receiver: channel '%s' does not exist", chname );
      return 2;
    }
  }

  /* remove first lua process, if any, from channels' send list */
  srclp = list_remove( &chan->send );

  if ( srclp != NULL ) {  /* found a sender? */
    /* try to move values between lua states' stacks */
    ret = luathread_copyvalues( srclp->lstate, L );
    if ( ret == TRUE ) { /* was receive successful? */
      lua_pushboolean( srclp->lstate, TRUE );
      srclp->args = 1;
    } else {  /* nil and error_msg already in stack */
      srclp->args = 2;
    }
    if ( srclp->lstate == mainlp.lstate ) {
      /* if sending process is the parent (main) Lua state, unblock it */
      pthread_mutex_lock( &mutex_mainls );
      pthread_cond_signal( &cond_mainls_sendrecv );
      pthread_mutex_unlock( &mutex_mainls );
    } else {
      /* otherwise, schedule process for execution */
      sched_queue_proc( srclp );
    }
    /* unlock channel access */
    luathread_unlock_channel( chan );
    /* disconsider channel name, async flag and any other args passed 
       to the receive function when returning its results */
    return lua_gettop( L ) - nargs; 

  } else {  /* otherwise test if receive was synchronous or asynchronous */
    if (async) { /* asynchronous receive */
      /* unlock channel access */
      luathread_unlock_channel( chan );
      /* return an error (but not a fatal error!) */
      lua_pushnil( L );
      lua_pushfstring( L, "no senders waiting on channel '%s'", chname );
      return 2;
    } else { /* synchronous receive */
      if ( L == mainlp.lstate ) {
        /*  receiving process is the parent (main) Lua state - block it */
        mainlp.chan = chan;
        luathread_queue_receiver( &mainlp );
        luathread_unlock_channel( chan );
        pthread_mutex_lock( &mutex_mainls );
        pthread_cond_wait( &cond_mainls_sendrecv, &mutex_mainls );
        pthread_mutex_unlock( &mutex_mainls );
        return mainlp.args;
      } else {
        /* receiving process is a standard luathread - set status, block and 
           yield */
        self = luathread_getself( L );
        if ( self != NULL ) {
          self->status = LUATHREAD_STATUS_BLOCKED_RECV;
          self->chan   = chan;
        }
        /* yield. channel will be unlocked by the scheduler */
        return lua_yield( L, lua_gettop( L ));
      }
    }
  }
}

/* create a new channel */
static int threads_create_channel( lua_State *L ) {

  register channel *chan;
  register const char *chname = luaL_checkstring( L, 1 );

  /* get exclusive access to channels list */
  pthread_mutex_lock( &mutex_channel_list );

  /* get channel and if it exists then return an error */
  if (( chan = channel_unlocked_get( chname )) != NULL ) {
    /* release exclusive access to channels list */
    pthread_mutex_unlock( &mutex_channel_list );
    /* return an error to lua */
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' already exists", chname );
    return 2;
  } else {  /* create channel */
    /* release exclusive access to channels list */
    pthread_mutex_unlock( &mutex_channel_list );
    channel_create( chname );
    lua_pushboolean( L, TRUE );
    return 1;
  }
}

/* destroy a channel */
static int threads_destroy_channel( lua_State *L ) {

  register channel *chan;
  register list *blockedlp;
  register luathread *lp;
  register const char *chname = luaL_checkstring( L,  1 );

  /* get exclusive access to channels list */
  pthread_mutex_lock( &mutex_channel_list );

  /* get channel and if it exists then lock it, or return an error */
  if (( chan = channel_unlocked_get( chname )) != NULL ) {
     /* get channel lock if we can, but still delete it if we cannot */
     pthread_mutex_trylock( &chan->mutex );
  }

  if ( chan == NULL ) {  /* found channel? */
    /* release exclusive access to channels list */
    pthread_mutex_unlock( &mutex_channel_list );
    /* return an error to lua */
    lua_pushnil( L );
    lua_pushfstring( L, "channel '%s' does not exist", chname );
    return 2;
  }

  /* remove channel from table */
  lua_getglobal( chanls, LUATHREAD_CHANNELS_TABLE );
  lua_pushnil( chanls );
  lua_setfield( chanls, -2, chname );
  lua_pop( chanls, 1 );

  /*
     wake up workers waiting on the channel condition
   */
  pthread_cond_broadcast( &chan->condition );

  /*
     wake up workers there are waiting to use the channel.
     they will not find the channel, since it was removed,
     and will not get this condition anymore.
   */
  pthread_cond_broadcast( &chan->can_be_used );

  /*
     dequeue lua processes waiting on the channel, return an error message
     to each of them indicating channel was destroyed and schedule them
     for execution (unblock them).
   */
  blockedlp = NULL;
  if ( chan->send.head != NULL ) {
    lua_pushfstring( L, "channel '%s' destroyed while waiting for receiver", 
                     chname );
    blockedlp = &chan->send;
  }
  if (blockedlp != NULL) {
    while (( lp = list_remove( blockedlp )) != NULL ) {
      /* return an error to each process */
      lua_pushnil( lp->lstate );
      lua_pushstring( lp->lstate, lua_tostring( L, -1 ));
      lp->args = 2;
      sched_queue_proc( lp ); /* schedule process for execution */
    }
    lua_pop(L, 1); /* remove message */
  }

  blockedlp = NULL;
  if ( chan->recv.head != NULL ) {
    lua_pushfstring( L, "channel '%s' destroyed while waiting for sender", 
                     chname );
    blockedlp = &chan->recv;
  }
  if (blockedlp != NULL) {
    while (( lp = list_remove( blockedlp )) != NULL ) {
      /* return an error to each process */
      lua_pushnil( lp->lstate );
      lua_pushstring( lp->lstate, lua_tostring( L, -1 ));
      lp->args = 2;
      sched_queue_proc( lp ); /* schedule process for execution */
    }
    lua_pop(L, 1); /* remove message */
  }

  pthread_mutex_unlock( &mutex_channel_list );

  /* unlock channel mutex and destroy both mutex and condition */
  pthread_mutex_unlock( &chan->public );
  pthread_cond_destroy( &chan->condition );
  pthread_mutex_destroy( &chan->public );
  pthread_mutex_unlock( &chan->mutex );
  pthread_cond_destroy( &chan->can_be_used );
  pthread_mutex_destroy( &chan->mutex );

  lua_pushboolean( L, TRUE );
  return 1;
}

/* set/get the worker stack size (only affacts new workers) */
static int threads_stacksize( lua_State *L ) {
   if (lua_gettop(L) > 0) {
      register lua_Integer newsize = luaL_checkinteger( L, 1 );
      luaL_argcheck( L, newsize > 0, 1, "stacksize must be positive" );
      stacksize = newsize;
   } 
   pushint(L, stacksize);
   return 1;
}

/* set/get the number of factories */
static int threads_factories( lua_State *L ) {
  register lua_Integer factories;
  if (lua_gettop(L) > 0) {
     factories = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, ((factories > 0)), 1, "invalid factory" );
     if (factories > MAX_FACTORIES) {
       factories = MAX_FACTORIES;
     }
     factories = sched_set_numfactories(factories);
  }
  else {
     factories = sched_get_numfactories();
  }
  pushint(L, factories);
  return 1;
}

/* set/get the factory of a worker thread */
static int threads_factory( lua_State *L ) {
  register lua_Integer factory;
  if (lua_gettop(L) > 0) {
     factory = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, ((factory > 0)), 1, "invalid factory" );
     if (factory > MAX_FACTORIES) {
       factory = MAX_FACTORIES;
     }
     factory = sched_set_factory(factory);
  }
  else {
     factory = sched_get_factory();
  }
  pushint(L, factory);
  return 1;
}

/* get a version number - default is the LUA_VERSION_NUM */
static int threads_version( lua_State *L ) {
   if (lua_gettop(L) > 0) {
     register const char *str = luaL_checkstring( L, 1 );
     if (strcmp(str, "lua") == 0) {
       pushint(L, LUA_VERSION_NUM);
     }
     else if (strcmp(str, "hardware") == 0) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
       pushint( L, 2); // Propeller 2
#else
       pushint( L, 1); // Propeller 1
#endif
#else
       pushint( L, 0); // not a Propeller
#endif
     }
     else {
        pushint(L, MODULE_VERSION_NUM);
     }
   }
   else {
      pushint(L, LUA_VERSION_NUM);
   }
   return 1;
}

#ifndef __CATALINA__
int pthread_sleep(int msecs);
int pthread_msleep(int msecs);
#endif

/* sleep for a specified number of seconds. If zero, just yield */
static int threads_sleep( lua_State *L ) {
  if (lua_gettop(L) > 0) {
     /* validate parameter is a positive number */
     register lua_Integer secs = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, secs >= 0, 1, "secs must be zero or positive" );
     if (secs > 0) {
       pthread_sleep(secs);
     }
     else {
       pthread_yield();
     }
  }
  else {
    pthread_yield();
  }
  return 0;
}

/* sleep for a specified number of microseconds. If zero, just yield */
static int threads_msleep( lua_State *L ) {
  if (lua_gettop(L) > 0) {
     /* validate parameter is a positive number */
     register lua_Integer msecs = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, msecs >= 0, 1, "msecs must be zero or positive" );
     if (msecs > 0) {
       pthread_msleep(msecs);
     }
     else {
       pthread_yield();
     }
  }
  else {
    pthread_yield();
  }
  return 0;
}
#ifndef __CATALINA__

int pthread_sleep(int secs) {
  struct timespec ts = {secs, 0 };
  return nanosleep(&ts, NULL);
}

int pthread_msleep(int msecs) {
  struct timespec ts;
  ts.tv_sec  = msecs/1000;
  ts.tv_nsec = (msecs%1000)*1000;
  return nanosleep(&ts, NULL);
}
#endif

/* print a message, uncorrupted by multi-threading if it is a 
 * single argument, otherwise as ungarbled as possible */
static int threads_print( lua_State *L ) {
 int n=lua_gettop(L);
 int i;
 if (n == 1) {
   /* print argument using a single pthread_printf */
   if (lua_isstring(L, 1))
     pthread_printf("%s\n", lua_tostring(L,n));
   else if (lua_isnil(L,n))
     pthread_printf("nil\n");
   else if (lua_isboolean(L,n))
     pthread_printf(lua_toboolean(L,n) ? "true\n" : "false\n");
   else
     pthread_printf("%s:%lX\n",luaL_typename(L,n),(unsigned long)lua_topointer(L,n));
 }
 else {
   for (i=1; i<=n; i++) {
     /* print each argument using pthread_printf, separated by '\t' and
      * followed by '\n' (but note this is NOT guaranteed not to be 
      * interleaved with other print statements from other threads!)
      */
     if (i>1) pthread_printf("\t");
     if (lua_isstring(L,i))
       pthread_printf(lua_tostring(L,i));
     else if (lua_isnil(L,i))
       pthread_printf("nil");
     else if (lua_isboolean(L,i))
       pthread_printf(lua_toboolean(L,i) ? "true" : "false");
     else
       pthread_printf("%s:%X",luaL_typename(L,i),(unsigned int)lua_topointer(L,i));
   }
   pthread_printf("\n");
 }
 return 0;

}

/* print arguments unformatted - not guaranteed to be thread-safe! */
static int threads_print_raw( lua_State *L ) {
 int n=lua_gettop(L);
 int i;

 for (i=1; i<=n; i++) {
   if (lua_isstring(L,i))
     pthread_printf(lua_tostring(L,i));
   else if (lua_isnil(L,i))
     pthread_printf("nil");
   else if (lua_isboolean(L,i))
     pthread_printf(lua_toboolean(L,i) ? "true" : "false");
   else
     pthread_printf("%s:%X",luaL_typename(L,i),(unsigned int)lua_topointer(L,i));
 }
 return 0;

}

/***********************
 * get'ers and set'ers *
 ***********************/

/* return the channel where a lua process is blocked at */
channel *luathread_get_channel( luathread *lp ) {
  return lp->chan;
}

/* return a lua process' status */
int luathread_get_status( luathread *lp ) {
  return lp->status;
}

/* set lua a process' status */
void luathread_set_status( luathread *lp, int status ) {
  lp->status = status;
}

/* return a lua process' state */
lua_State *luathread_get_state( luathread *lp ) {
  return lp->lstate;
}

/* return the number of arguments expected by a lua process */
int luathread_get_numargs( luathread *lp ) {
  return lp->args;
}

/* set the number of arguments expected by a lua process */
void luathread_set_numargs( luathread *lp, int n ) {
  lp->args = n;
}

/**********************************
 * register structs and functions *
 **********************************/

static void luathread_reglualib( lua_State *L, const char *name, 
                               lua_CFunction f ) {
  lua_getglobal( L, "package" );
  lua_getfield( L, -1, "preload" );
  lua_pushcfunction( L, f );
  lua_setfield( L, -2, name );
  lua_pop( L, 2 );
}

static void luathread_openlualibs( lua_State *L ) {
  requiref( L, "_G", luaopen_base, FALSE );
  requiref( L, "package", luaopen_package, TRUE );
  luathread_reglualib( L, "io", luaopen_io );
  luathread_reglualib( L, "os", luaopen_os );
  luathread_reglualib( L, "table", luaopen_table );
  luathread_reglualib( L, "string", luaopen_string );
  luathread_reglualib( L, "math", luaopen_math );
  luathread_reglualib( L, "debug", luaopen_debug );
#if (LUA_VERSION_NUM == 502)
  luathread_reglualib( L, "bit32", luaopen_bit32 );
#endif
#if (LUA_VERSION_NUM >= 502)
  luathread_reglualib( L, "coroutine", luaopen_coroutine );
#endif
#if (LUA_VERSION_NUM >= 503)
  luathread_reglualib( L, "utf8", luaopen_utf8 );
#endif
  luathread_reglualib( L, "propeller", luaopen_propeller );

}

LUAMOD_API int luaopen_threads( lua_State *L ) {

   /* register luathread functions */
   luaL_newlib( L, luathread_funcs );

#ifdef __CATALINA__
   /* initialize pthreads locks */
   _pthread_init_lock_pool(NULL);
#endif

  /* wrap main state inside a lua process */
  mainlp.lstate = L;
  mainlp.status = LUATHREAD_STATUS_IDLE;
  mainlp.args   = 0;
  mainlp.chan   = NULL;
  mainlp.next   = NULL;
  /* initialize recycle list */
  list_init( &recycle_list );
  /* initialize channels table and lua_State used to store it */
  chanls = luaL_newstate();
  lua_newtable( chanls );
  lua_setglobal( chanls, LUATHREAD_CHANNELS_TABLE );
#if SEPARATE_GLOBAL_STATE
  /* initialize shared global state and the lua_State used to store it */
  gstate = luaL_newstate();
  lua_newtable( gstate );
  lua_setglobal( gstate, LUATHREAD_GLOBALS_TABLE );
#endif
  requiref( gstate, "_G", luaopen_base, TRUE );
 /* create finalizer to join workers when Lua exits */
  lua_newuserdata( L, 0 );
  lua_setfield( L, LUA_REGISTRYINDEX, "LUATHREAD_FINALIZER_UDATA" );
  luaL_newmetatable( L, "LUATHREAD_FINALIZER_MT" );
  lua_pushliteral( L, "__gc" );
  lua_pushcfunction( L, luathread_join_workers );
  lua_rawset( L, -3 );
  lua_pop( L, 1 );

  lua_getfield( L, LUA_REGISTRYINDEX, "LUATHREAD_FINALIZER_UDATA" );
  lua_getfield( L, LUA_REGISTRYINDEX, "LUATHREAD_FINALIZER_MT" );
  lua_setmetatable( L, -2 );
  lua_pop( L, 1 );
  /* initialize scheduler */
  if ( sched_init() == LUATHREAD_SCHED_PTHREAD_ERROR ) {
    luaL_error( L, "failed to create worker" );
  }

  return 1;
}

static int luathread_loadlib( lua_State *L ) {

  /* register luathread functions */
  luaL_newlib( L, luathread_funcs );

  return 1;
}
