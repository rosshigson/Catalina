 /***************************************************************************\
 *                                                                           *
 *                          Multiple Thread Demo                             *
 *                                                                           *
 *    Demonstrates many threads executing concurrently on a single cog       *
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
#ifdef __CATALINA_P2
#define THREAD_COUNT 300 // can go higher, but things start to slow down!
#else
#define THREAD_COUNT 80 // (just barely on the Propeller 1!)
#endif
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
 * main : start up to THREAD_COUNT threads, then ping each one in turn
 */
int main(void) {

   int i = 0;
   void *thread_id;

   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

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

   return 0;
}
