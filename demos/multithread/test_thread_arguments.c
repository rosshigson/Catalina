 /***************************************************************************\
 *                                                                           *
 *                          Thread Argument Demo                             *
 *                                                                           *
 *    Demonstrates passing and retrieving arguments to/from a thread         *
 *                                                                           *
 \***************************************************************************/

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
 * define the stack size for each thread:
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 200)

/*
 * define the size of the resource thread lock pool:
 */
#define NUM_LOCKS 1

/*
 * define some global variables that all threads will share:
 */

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char  pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

static int   lock;                    // thread lock to protect HMI calls

static void *ping;

/*
 * function : this function can be executed as a thread.
 */
int function(int argc, char *argv[]) {
   int i;
   void *me = _thread_id();

   // wait till we are pinged
   while (ping != me) {
      // nothing to do, so yield
      _thread_yield();
   }
   // print our id and all our arguments
   _thread_printf(pool, lock, "thread %d ", (unsigned)me);
   _thread_printf(pool, lock, "args = %d, ", argc);
   for (i = 0; i < argc; i++) {
      _thread_printf(pool, lock, "%s ", argv[i]);
   }
   _thread_printf(pool, lock, "\n");
   ping = (void *)0;

   // exit and return a status
   return -argc;
}

/*
 * main : start THREAD_COUNT threads, ping each one, then fetch each ones result
 */
int main(void) {

   int i = 0;
   char * s[THREAD_COUNT] = {"hello", "there", "this", "is", "catalina"};
   unsigned long stacks[STACK_SIZE * THREAD_COUNT];
   void * thread[THREAD_COUNT];
   int result;   

   // assign a lock to be used to avoid context switch contention 
   _thread_set_lock(_locknew());

   // create a lock (pool) to protect our common resource
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to protect the HMI functions
   lock = _thread_locknew(pool);

   _thread_printf(pool, lock, "Press a key to start\n");
   k_wait();

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 0; i < THREAD_COUNT; i++) {
      thread[i] = _thread_start( &function, &stacks[STACK_SIZE*(i+1)], i+1, s);
      _thread_printf(pool, lock, "thread %d ", i);
      if (thread[i] == (void *)0) {
         _thread_printf(pool, lock, " failed to start\n");
         while (1) { };
      }
      else {
         _thread_printf(pool, lock, " started, id = %d\n", (unsigned)thread[i]);
      }
   }

   // now ping each thread in turn
   _thread_printf(pool, lock, "\n\nPress a key to ping all threads\n");
   k_wait();
   for (i = 0; i < THREAD_COUNT; i++) {
      // ping the thread
      ping = thread[i];
      // wait till thread responds
      while (ping) {
         // nothing to do, so yield
         _thread_yield();
      };
   }

   // now join each thread to fetch the result
   _thread_printf(pool, lock, "\n\nPress a key to join all threads\n");
   k_wait();
   for (i = 0; i < THREAD_COUNT; i++) {
      if (_thread_join(thread[i], &result) != thread[i]) {
         _thread_printf(pool, lock, "failed to join thread %d\n", thread[i]);
         //while (1) { }
      };
      _thread_printf(pool, lock, "thread %d result = %d\n", i, result);
   }

   _thread_printf(pool, lock, "\nAll threads joined\n");

   while (1) ; // loop forever

   return 0;
}
