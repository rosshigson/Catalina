/*
 * thread_p1.c : run a threaded secondary program at a reserved Hub address.
 *             
 * Compile this program with catapult. For example:
 *
 *    catapult thread_p1.c
 *
 * See the document 'Getting Started with Catapult' for details.
 * 
 * NOTE: This file is configured for a Propeller 1 C3 board and 
 *       a serial HMI using catapult pragmas. The primary program 
 *       is an XMM program, so must be loaded and executed using the
 *       xmm loader, built with the 'build_utilities' script, and
 *       specifying a C3 and a 1k cache size.
 *                   
 */

#pragma catapult common options(-C C3 -C TTY -C NO_ARGS -lc -lmc)

// any common includes or types here ...

#include "catapult.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <prop.h>

typedef struct func_1 {
   int a;
   int b;
   int c;
} func_1_t;

typedef struct func_2 {
   float a;
   float b;
   float c;
} func_2_t;

#pragma catapult secondary func_1 mode(CMM) address(0x6274) stack(1200)

// any includes or functions required by secondary here ...

void func_1(func_1_t *s) {
   t_printf("func_1 running on cog %d\n", _cogid());
   t_printf("a = %d, b = %d\n", s->a, s->b);
   s->c  = (s->a + s->b);
}
 
#pragma catapult secondary func_2 mode(LMM) address(0x4924) stack(2400) options(-lthreads)

// any includes or functions required by secondary here ...

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thutil.h>

/*
 * define how many threads we want:
 */
#define THREAD_COUNT 5
/*
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the smallest possible stack size has to
 * be established by trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 55)

/*
 * define the number of thread locks we need:
 */
#define NUM_LOCKS 1

/*
 * define some global variables that all threads will share:
 */
static int ping;

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

/*
 * a lock allocated from the pool - required to protect the thread HMI
 * plugin functions.
 */
static int lock;

/*
 * function : this function can be executed as a thread.
 */
int function(int me, char *not_used[]) {

   while (1) {
      if (ping == me) {
         // print our id
         _thread_printf(pool, lock, "%d ", (unsigned)me);
         ping = 0;
      }
      else {
         // nothing to do, so yield
         _thread_yield();
      }
   }
   return 0;
}

/*
 * func_2 : start up to THREAD_COUNT threads, then ping each one in turn
 */
void func_2(func_2_t *s) {

   int i = 0;
   void *thread_id;

   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   t_printf("func_2 running on cog %d\n", _cogid());

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // initialize a pool of thread locks (we need only 1 lock)
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to avoid HMI plugin contention (not 
   // really necessary in this example, but good practice!).
   lock = _thread_locknew(pool);

   _thread_printf(pool, lock, "Press a key to start\n");
   k_wait();

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
      _thread_printf(pool, lock, "thread %d ", i);
      if (thread_id == (void *)0) {
         _thread_printf(pool, lock, " failed to start\n");
         while (1) { };
      }
      else {
         _thread_printf(pool, lock, " started, id = %d\n", (unsigned)thread_id);
      }
   }

   // now loop forever, pinging each thread in turn
   while (1) {
      _thread_printf(pool, lock, "\n\nPress a key to ping all threads\n");
      k_wait();
      for (i = 1; i <= THREAD_COUNT; i++) {
         _thread_printf(pool, lock, "%d:", i);
         // ping the thread
         ping = i;
         // wait till thread responds
         while (ping) {
            // nothing to do, so yield
            _thread_yield();
         };
      }
   }

}

#pragma catapult primary mode(XMM SMALL) binary(thread_p1) options(-C CACHED_1K)

// any includes or functions required by primary here ...

void pause() {
   msleep(250);
}

void main() {
   func_1_t args_1;
   func_2_t args_2;
   int cog;

   args_1.a = 1;
   args_1.b = 2;
   args_1.c = 0;

   args_2.a = 11.1;
   args_2.b = 22.2;
   args_2.c = 0.0;

   RESERVE_AND_START(func_1, args_1, ANY_COG, cog);
   pause();
   printf("result = %d\n\n", args_1.c);

   RESERVE_AND_START(func_2, args_2, ANY_COG, cog);
   pause();

   while(1);

}
