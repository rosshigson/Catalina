 /***************************************************************************\
 *                                                                           *
 *                        Thread Resource Lock Demo                          *
 *                                                                           *
 * This program shows how to use thread locks to synchronize activity        *
 * amongst multiple threads - e.g. to share access to a common resource.     *
 *                                                                           *
 * Note that the program looks more complicated than it actually is because  *
 * (for the demo only) we use THREE locks - one cog lock for kernel context  *
 * switching (which is always required), one thread lock to protect the HMI  *
 * functions (which would not be required in a program that just wants a     *
 * simple resource lock) - and one thread lock to protect the resources.     *
 *                                                                           *
 * Note also that it is important to distinguish between COG locks (which    *
 * are the usual Parallax locks) and THREAD locks, which are similar but     *
 * which work in a multi-threaded environment.                               *
 *                                                                           *
 \***************************************************************************/

/*
 * include Catalina multi-threading:
 */
#include <catalina_threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thread_utilities.h>

/*
 * define stack size for threads:
 */
#define STACK_SIZE 200

/*
 * define the size of the thread lock pool:
 */
#define NUM_LOCKS 2

/*
 * define the number of threads to start:
 */
#define MAX_THREADS 10

/*
 * define global variables that all cogs will share (we would define our
 * common resource here as well, so that all cogs can access it):
 */

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char Pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

static int HMI_lock;                   // thread lock to protect HMI functions

static int Resource_Lock;              // thread lock to protect resources


/*
 * function : C function that can be executed as a thread.
 */
int function(int argc, char *argv[]) {
   int result;

   // announce ourselves, but then let all threads start 
   // before doing anything else
   _thread_printf(Pool, HMI_lock, "Thread %d started!\n", argc);
   _thread_wait(500); 

   // do something forever - but only when we have the lock!
   while (1) {

      // get the resource lock - wait some random time
      // between attempts, to mix things up a little
      do { 
          _thread_wait(random(100));
      } while (!_thread_lockset (Pool, Resource_Lock));

      // do some work here that requires access to the common resource
      while (1) {
         // just as a test, wait some random number of seconds, 
         // with a 50% chance of giving up the lock each second
         _thread_printf(Pool, HMI_lock, "Thread %d has the lock!\n", argc);
         _thread_wait(1000);
         if (random(100) < 50) {
            break;
         }
      }

      // release the resource lock
      _thread_lockclr(Pool, Resource_Lock);

   }
   return 0;
}


/*
 * main : start up to MAX_THREADS threads, letting them all 
 *        compete for the thread resource lock
 */
void main(void) {
   int i = 0;
   static void *thread = NULL;
   unsigned long stacks[STACK_SIZE * MAX_THREADS];

   // assign a cog lock to avoid kernel context switch contention 
   _thread_set_lock(_locknew());

   // create a lock (pool) to protect our common resource
   _thread_init_lock_pool (Pool, NUM_LOCKS, _locknew());

   // allocate a thread lock to protect the HMI functions
   HMI_lock = _thread_locknew(Pool);

   // and allocate a resource thread lock from the same lock pool
   Resource_Lock = _thread_locknew(Pool);

   _thread_printf(Pool, HMI_lock, "Press a key to start\n");
   k_wait();
   randomize();

   // start some threads
   for (i = 1; i <= MAX_THREADS ; i++) {
      thread = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
   }

   // now let the other threads do their thing, all competing for 
   // access to the resource lock - and we can do the same ourselves!
   function(0, NULL);
}
