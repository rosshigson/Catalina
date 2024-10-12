/*
 * ll_p_p2.c : run a parallelized primary and secondary program.
 *             
 * NOTES: This file is configured for a Propeller 2 P2_EDGE board  
 *        using catapult pragmas. 
 *                   
 *        The output from the parallelized primary and secondary programs 
 *        will be garbled. This is intentional - it demonstrates that each 
 *        one is executing its workers in parallel, and therefore all the 
 *        characters printed from each worker are being intermingled with
 *        any other prints occuring at the same time.
 *
 *        Specifying the number of cogs each factory in a parallelized 
 *        function should use is required, or the first factory started 
 *        will use all available cogs.
 *                   
 *        Parallelized secondary functions should explicitly stop their 
 *        factories before terminating - otherwise those cogs will never 
 *        be released. Explicitly starting the factories is NOT required, 
 *        but is done in this program so that when the registry is displayed,
 *        all the cogs used by the program are shown correctly.
 *
 */

#pragma catapult common options(-C P2_EDGE -C SIMPLE -p2 -lci -C NO_ARGS -C NO_FLOAT)

// any common includes or types here ...

#include "catapult.h"
#include <stdlib.h>
#include <prop.h>

typedef struct func_1 {
   int go;
} func_1_t;

typedef struct func_2 {
   int go;
} func_2_t;

#pragma catapult secondary func_1 mode(CMM) address(0x71C28) stack(20000) options (-lthreads -Z)

// any includes or functions required by secondary here ...

#pragma propeller factory _factory cogs(2)

#pragma propeller worker(void)

void func_1(func_1_t *s) {
    int i;

    // start the factory cogs
    #pragma propeller start

    t_printf("Hello, world from func_1 running on cog %d!\n", _cogid());

    // wait for signal to go
    while (!s->go);

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin
       t_printf("a simple test ");
       #pragma propeller end

    }

    // wait for all workers to finish
    #pragma propeller wait

    // stop the factory cogs (recommended!)
    #pragma propeller stop

    // give characters a chance to be output, so the
    // following print will not be garbled,
    msleep(500); 

    t_printf("\nGoodbye, world, from func_1!\n");

}
 
#pragma catapult secondary func_2 mode(LMM) address(0x694D8) stack(30000) options(-lthreads)

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

#define THREAD_COUNT 50
/*
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the smallest possible stack size has to
 * be established by trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 60)

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

   t_printf("Hello, world from func_2 running on cog %d!\n", _cogid());

    // wait for signal to go
    while (!s->go);

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // initialize a pool of thread locks (we need only 1 lock)
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to avoid HMI plugin contention (not 
   // really necessary in this example, but good practice!).
   lock = _thread_locknew(pool);

   //_thread_printf(pool, lock, "Press a key to start\n");
   //k_wait();

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
      if (thread_id == (void *)0) {
         _thread_printf(pool, lock, "thread %d failed to start\n", i);
         while (1) { };
      }
      else {
         //_thread_printf(pool, lock, "thread %d started, id = %d\n", i, (unsigned)thread_id);
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

#pragma catapult primary mode(NMM) binary(ll_p_p2) options(-Z -lthreads)

// any includes or functions required by primary here ...

#include <stdio.h>

// display_registry - decode and display registry
void display_registry(int cogs) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   printf("\nRegistry:\n");
   while (i < cogs) {
      printf("   %2d: ", i);
      // display plugin type name
      printf("%-24.24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      printf("$%08x ", *(a_ptr +1));     
      printf("\n");
      i++;
   };
   printf("\n");
}

#pragma propeller factory _factory cogs(2)

#pragma propeller worker(void)

void main() {
   func_1_t args_1 = { 0 };
   func_2_t args_2 = { 0 };
   int cog;
   int i;

   RESERVE_SPACE(func_1);
   RESERVE_SPACE(func_2);

   RESERVED_START(func_1, args_1, ANY_COG, cog);
   RESERVED_START(func_2, args_2, ANY_COG, cog);

   msleep(500);

   // display the registry to see the cog usage before starting
   // display_registry(8);

   msleep(500);
   args_1.go = 1;

   msleep(500);
   args_2.go = 1;

   msleep(500);
   t_printf("Hello, world from primary running on cog %d!\n\n", _cogid());

   for (i = 1; i <= 10; i++) {

      #pragma propeller begin
      t_printf("A SIMPLE TEST ");
      #pragma propeller end

   }

   // wait for all workers to finish
   #pragma propeller wait

   // give characters a chance to be output, so the
   // following print will not be garbled,
   msleep(500); 

   t_printf("\n\nGoodbye world, from primary!\n");

   while(1);

}
