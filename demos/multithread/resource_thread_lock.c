 /***************************************************************************\
 *                                                                           *
 *                        Thread Resource Lock Demo                          *
 *                                                                           *
 * This program shows how to use thread locks to synchronize activity        *
 * amongst multiple threads - e.g. to share access to a common resource.     *
 *                                                                           *
 * Note that the program looks more complicated than it actually is because  *
 * (for the demo only) we use FOUR locks - one cog lock for kernel context   *
 * switching (which is always required), one cog lock to protect the thread  *
 * lock pool (which is always required if we have a pool), one thread lock   *
 * to protect the HMI functions (which would not be required in a program    *
 * that just wants a simple resource lock) - and one thread lock to protect  *
 * the resources.                                                            *
 *                                                                           *
 * Note also that it is important to distinguish between COG locks (which    *
 * are the usual Parallax locks) and THREAD locks, which are similar but     *
 * which work in a multi-threaded environment, and we are not limited to     *
 * only having 8 (on the Propeller 1) or 16 (on the Propeller 2) of them.    *
 *                                                                           *
 \***************************************************************************/

/*
 * include propeller functions
 */
#include <prop.h>
#ifdef __CATALINA_P2
#include <prop2.h>
#endif

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thutil.h>

/*
 * define stack size for threads:
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 100)

/*
 * define the size of the thread lock pool - we need one lock for our 
 * HMI functions, and one to protect our (hypothetical) shared resource:
 */
#define NUM_LOCKS 2

/*
 * define the number of threads to start:
 */
#define MAX_THREADS 10

/*
 * define global variables that all cogs will share (we define any
 * common resources here as well, so that all cogs can access them):
 */

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5):
 */

static char Pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

/*
 * a thread lock to protect HMI functions:
 */
static int HMI_Lock;

/*
 * a thread lock to protect our (hypothetical) resource:
 */
static int Resource_Lock;

/*
 * a flag to tell all threads to start competing:
 */
static int start;

/*
 * function : a C function that can be executed as a thread:
 */
int function(int argc, char *argv[]) {
   int result;

   // announce ourselves, but wait till we are told to start
   // competing for the lock before doing anything else
   _thread_printf(Pool, HMI_Lock, "Thread %d started!\n", argc);
   while (!start) {
      _thread_yield();
   }

   // do something forever - but only when we get the lock!
   while (1) {

      // get the resource lock - wait some random time
      // between attempts, to mix things up a little
      do { 
          _thread_wait(random(100));
      } while (_thread_lockset(Pool, Resource_Lock) == 0);
      // do some work here that requires access to the common resource
      while (1) {
         // just as a test, wait some random number of seconds, 
         // with a 50% chance of giving up the lock each second
         _thread_printf(Pool, HMI_Lock, "Thread %d has the lock!\n", argc);
         _thread_wait(100);
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
 *        compete for the thread resource lock, which protects
 *        our (hypothertical) shared resource
 */
void main(void) {
   int i = 0;
   static void *thread = NULL;
   unsigned long stacks[STACK_SIZE * MAX_THREADS];

   // assign a cog lock to avoid kernel context switch contention 
   _thread_set_lock(_locknew());

   // create a lock (pool) to protect our common resource
   _thread_init_lock_pool (Pool, NUM_LOCKS,  _locknew());

   // allocate a thread lock to protect the HMI functions
   HMI_Lock = _thread_locknew(Pool);

   // and allocate a resource thread lock from the same lock pool
   Resource_Lock = _thread_locknew(Pool);

   // now start the threads, and give them some time to start
   _thread_printf(Pool, HMI_Lock, "Press a key to start threads\n");
   k_wait();
   randomize();
   for (i = 1; i <= MAX_THREADS ; i++) {
      thread = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
   }
   _thread_wait(1000);

   // now start the competition amongst all the threads
   _thread_printf(Pool, HMI_Lock, "\nPress a key to start competing\n");
   k_wait();
   start = 1;

   // and we can join the competition ourselves!
   function(0, NULL);
}
