 /***************************************************************************\
 *                                                                           *
 *                          Maximum Thread Demo                              *
 *                                                                           *
 * Demonstrates how many threads can executing concurrently on a single cog  *
 *                                                                           *
 *  (note that this is very dependent on the other drivers that are loaded)  *
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
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the smallest possible stack size has to be 
 * established by trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE+10)

/*
 * define how many threads we want (established by trial and error, after
 * determining how big the stack size of each thread must be):
 */
#ifdef __CATALINA_P2
#define THREAD_COUNT 2500 
#else
#define THREAD_COUNT 145 
#endif

/*
 * define a global variable that all threads will share:
 */
static int ping;

/*
 * function : this function can be executed as a thread.
 */
int function(int me, char *not_used[]) {

   while (1) {
      if (ping == me) {
         // just reset ping to indicate we are still alive!
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

   t_printf("Press a key to start\n");
   k_wait();

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
      t_printf("thread %d ", i);
      if (thread_id == (void *)0) {
         t_printf(" failed to start\n");
         while (1) { };
      }
      else {
         t_printf(" started, id = %d\n", (unsigned)thread_id);
      }
   }

   // now loop forever, pinging each thread in turn
   while (1) {
      t_printf("\n\nPress a key to ping all threads\n");
      k_wait();
      for (i = 1; i <= THREAD_COUNT; i++) {
         // ping the thread
         ping = i;
         // wait till thread responds
         while (ping) {
            // nothing to do, so yield
            _thread_yield();
         };
         t_printf("%d ", i);
      }
   }

   return 0;
}
