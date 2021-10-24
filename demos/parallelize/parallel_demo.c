/*
 * This program defines one worker, which prints a simple test message. 
 * We then execute 10 of those in a "for" loop. When this program is 
 * "parallelized", we will execute up to 5 instances of the worker 
 * in parallel with the main program. 
 *
 * Note what this does to the output when we execute this program as a
 * parallel program, compared to when we execute it as a serial program!
 */

#ifndef ANY_COG
#ifdef __CATALINA_P2
#define ANY_COG 16
#else
#define ANY_COG 8
#endif
#endif

#ifndef __PARALLELIZED
#define __PARALLELIZED
#endif

#if defined(__CATALINA__) && !defined(CUSTOM_THREADS)
#include <catalina_threads.h>
#elif defined(LOCAL_THREADS)
#include "custom_threads.h"
#else
#include <custom_threads.h>
#endif

#ifndef _THREAD
#define _THREAD _thread
#endif

#ifndef _THREAD_YIELD
#define _THREAD_YIELD() _thread_yield()
#endif

#ifndef _THREAD_FUNCTION
#define _THREAD_FUNCTION(f) static int f(int argc, char *argv[])
#endif

#ifndef _THREADED_COG
#define _THREADED_COG(thread, stack, stack_size) _thread_cog(thread, stack+stack_size, 0, NULL)
#endif

#ifndef _THREAD_ON_COG
#define _THREAD_ON_COG(thread, stack, size, cog, argc, ticks)  _thread_on_cog(thread, stack, size, cog, argc, ticks) 
#endif

#ifndef _THREAD_SET_LOCK
#define _THREAD_SET_LOCK _thread_set_lock
#endif

#ifndef _THREAD_GET_LOCK
#define _THREAD_GET_LOCK _thread_get_lock
#endif

#ifndef _LOCKSET
#define _LOCKSET _lockset
#endif

#ifndef _LOCKCLR
#define _LOCKCLR _lockclr
#endif

#ifndef _LOCKNEW
#define _LOCKNEW _locknew
#endif

#ifndef _COGSTOP
#define _COGSTOP _cogstop
#endif

// structure to hold worker data
struct _worker_struct {
   long    *stack;
   void    *worker;
   struct _worker_struct *next;
};

typedef struct _worker_struct WORKER;

// structure to hold factory data
struct _factory_struct {
   int     cogs[ANY_COG];
   int     cog_count;
   int     last_used;
   long   *stack[ANY_COG];
   WORKER *workers;
};

typedef struct _factory_struct FACTORY;

static void _create_factory(FACTORY *factory, long *fs, _THREAD foreman, int num_cogs, int stack_size, int lock) {
   int i;

   for (i = 0; i < ANY_COG; i++) {
      factory->cogs[i] = -1;
      factory->stack[i] = NULL;
   }
   factory->last_used = 0;
   factory->cog_count = 0;
   factory->workers   = NULL;
   // start the multi-threading kernels
   for (i = 0; i < num_cogs; i++) {
      factory->stack[i] = &fs[stack_size*i];
      factory->cogs[i] = _THREADED_COG(foreman, &fs[stack_size*(i)], stack_size);
      if (factory->cogs[i] >= 0) {
         factory->cog_count++;
         factory->last_used = i;
      }
   }
}

static void _create_worker(FACTORY *factory, _THREAD worker, WORKER *fw, long *ws, int stack_size, int ticks, int argc) {
   void   *w = NULL;

   if (factory != NULL) {
      if (factory->cog_count > 0) {
         fw->stack = ws;
         fw->next = factory->workers;
         factory->workers = fw;
         while (factory->cogs[factory->last_used] < 0) {
            factory->last_used = (factory->last_used + 1)%ANY_COG;
         }
#if defined (__CATALINA__) && !defined(CUSTOM_THREADS)
         w = _thread_start(worker, ws + stack_size, argc, NULL);
         fw->worker = w;
         if (w != NULL) {
            if (ticks > 0) {
               _thread_ticks(w, ticks);
            }
            _thread_affinity_change(w, factory->cogs[factory->last_used]);
         }
#else
         fw->worker = _THREAD_ON_COG(worker,
                                     ws,
                                     stack_size,
                                     factory->cogs[factory->last_used],
                                     argc,
                                     ticks);
#endif
         factory->last_used = (factory->last_used + 1)%ANY_COG;
         // give the affinity change an opportunity to be processed ...
         _THREAD_YIELD();
      }
   }
}

#line 11 "custom_demo.c"
_THREAD_FUNCTION(_foreman);

#line 11 "custom_demo.c"
static FACTORY *_factory__factory;

#line 11 "custom_demo.c"
static long    *_f_stack__factory;

#ifndef __CUSTOM_LOCK
#ifndef _KERNEL_LOCK_DEFINED
#define _KERNEL_LOCK_DEFINED
static int _kernel_lock = -1;
#endif
#endif

#ifndef _FOREMAN_DEFINED
#define _FOREMAN_DEFINED
// the foreman runs when no other threads are running
_THREAD_FUNCTION(_foreman) {
   #line 11 "custom_demo.c"
   _THREAD_SET_LOCK(_kernel_lock);
   while (1) {
      _THREAD_YIELD();
   }
   return 0;
}
#endif

void _start_worker__worker();

#line 11 "custom_demo.c"
void _start_factory__factory() {
#ifndef __PARALLELIZE_DYNAMIC
   static FACTORY my_factory;
   #line 11 "custom_demo.c"
   static long    my_f_stack[(ANY_COG)*(200)];
#endif

   #line 11 "custom_demo.c"
   if (_kernel_lock <= 0) {
      // assign a lock to avoid context switch contention 
   #line 11 "custom_demo.c"
      _kernel_lock = _LOCKNEW();
      _THREAD_SET_LOCK(_kernel_lock);
   }
#ifdef __PARALLELIZE_DYNAMIC
   _factory__factory = (void *)malloc(sizeof(FACTORY));
   #line 11 "custom_demo.c"
   _f_stack__factory = (void *)malloc((ANY_COG)*(200)*4);
   if (_factory__factory == NULL) {
       exit(1);
   }
   if (_f_stack__factory == NULL) {
       exit(1);
   }
#else
   _factory__factory = &my_factory;
   _f_stack__factory = my_f_stack;
#endif
   #line 11 "custom_demo.c"
   _create_factory(_factory__factory, _f_stack__factory, _foreman, ANY_COG, 200, _kernel_lock);
   _start_worker__worker();
}

#line 11 "custom_demo.c"
void _stop_factory__factory() {
   int i;
   int cog;
   int lock;
   long *fs;
   void *w;
   WORKER *fw;

   lock = _THREAD_GET_LOCK();
   if (lock >= 0) {
      // loop till we get the global thread lock
      do { _THREAD_YIELD(); } while (!_LOCKSET(lock));

   }
   // stop the multi-threading kernels
   for (i = 0; i < ANY_COG; i++) {
      if ((cog = _factory__factory->cogs[i]) >= 0) {
          _COGSTOP(cog);
      }
   }
#ifdef __PARALLELIZE_DYNAMIC
   // free the factory workers structure and stacks
   while (_factory__factory->workers != NULL) {
      fw = _factory__factory->workers;
      fs = fw->stack;
      _factory__factory->workers = fw->next;
      free(fw);
      free(fs);
   }
   if (_factory__factory != NULL) {
      free(_factory__factory);
   }
   if (_f_stack__factory != NULL) {
      free(_f_stack__factory);
   }
#endif
   _factory__factory = NULL;
   _f_stack__factory = NULL;
   _LOCKCLR(lock);

}
// structure to hold input and output variables for _worker
#line 11 "custom_demo.c"
struct __worker_parameters {
   #line 11 "custom_demo.c"
   int i;
   int _status;
};

// parameters for _worker
#line 11 "custom_demo.c"
static struct __worker_parameters __worker_param[5];

// code for _worker thread
#line 11 "custom_demo.c"
_THREAD_FUNCTION(__worker) {
#ifdef _GET_ID_FUNCTION
   int id = _GET_ID_FUNCTION("_worker");
#else
   int id = (int)argc;
#endif
   int i;
   while (1) {
      while ((__worker_param[id]._status) == 0) {
         _THREAD_YIELD();
      }
      #line 11 "custom_demo.c"
      i = __worker_param[id].i;
      // begin thread code segment
      #line 22 "custom_demo.c"
             printf("a simple test %d ", i);
      // end thread code segment
      __worker_param[id]._status = 0;
   }
   return 0;
}

// _next__worker - move to the next worker
#line 11 "custom_demo.c"
#if ((5) > 1) 
#line 11 "custom_demo.c"
#define _next__worker(j) (j = (j + 1)%(5))
#else
#define _next__worker(j) 
#endif

// _await_all__worker - wait for all worker threads to complete
#line 11 "custom_demo.c"
void _await_all__worker(void) {
   int i = 0;
   while (1) {
      if (__worker_param[i]._status != 0) {
         _THREAD_YIELD();
      }
      else {
         _next__worker(i);
         if (i == 0) {
            break;
         }
      }
   }
}

#line 11 "custom_demo.c"
void _start_worker__worker(void) {
#ifdef __PARALLELIZE_DYNAMIC
   WORKER *my_worker;
   long   *my_w_stack;
#else
   #line 11 "custom_demo.c"
   static WORKER my_worker[5];
   #line 11 "custom_demo.c"
   static long   my_w_stack[(5)*(200)];
#endif
   int i;
   if (_factory__factory == NULL) {
       exit(1);
   }

   // create worker threads in the factory
   #line 11 "custom_demo.c"
   for (i = 0; i < (5); i++) {
#ifdef __PARALLELIZE_DYNAMIC
      my_worker  = (void *)malloc(sizeof(WORKER));
      if (my_worker == NULL) {
          exit(1);
      }
      #line 11 "custom_demo.c"
      my_w_stack = (void *)malloc((200)*4);
      if (my_w_stack == NULL) {
          exit(1);
      }
      #line 11 "custom_demo.c"
      _create_worker(_factory__factory, &__worker, my_worker, my_w_stack, 200, 100, i);
#else
      #line 11 "custom_demo.c"
      _create_worker(_factory__factory, &__worker, &my_worker[i], &my_w_stack[i*(200)], 200, 100, i);
#endif
   }
}

#line 12 "custom_demo.c"

void main() {
    int i;

    waitcnt(_CLKFREQ + CNT);
    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {

   {
      int __worker_id = 0;
      // factory is not explicitly started
      if (_factory__factory == NULL) {
         _start_factory__factory();
      }
      // find a free worker, waiting as necessary
      while (__worker_param[__worker_id]._status != 0) {
         _next__worker(__worker_id);
         if (__worker_id == 0) {
            _THREAD_YIELD();
         }
      }
      // found a free thread, so give it some work
      #line 21 "custom_demo.c"
      __worker_param[__worker_id].i = i;
      __worker_param[__worker_id]._status = 1;
      _next__worker(__worker_id);
   }

#line 23 "custom_demo.c"
#line 24 "custom_demo.c"

    }

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
