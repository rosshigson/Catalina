 /***************************************************************************\
 *                                                                           *
 *                       Maximum Posix Thread Demo                           *
 *                                                                           *
 * Demonstrates how many threads can executing concurrently on a single cog  *
 *                                                                           *
 *  (note that this is very dependent on the other drivers that are loaded)  *
 *                                                                           *
 *  On the Propeller 1, compile this with a command like:                    *
 *                                                                           *
 *    catalina test_max_pthreads.c -lci -lthreads -C C3 -C COMPACT -C TTY    *
 *                                                                           *
 *  On the Propeller 2, compile this with a command like:                    *
 *                                                                           *
 *    catalina test_max_pthreads.c -p2 -lci -lthreads -C P2_EVAL -C COMPACT  *
 *                                                                           *
 \***************************************************************************/

/*
 * include Posix multi-threading:
 */
#include <pthread.h>
#include <prop2.h>
#include <hmi.h>

/*
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the smallest possible stack size has to be 
 * established by trial and error):
 */
#define STACK_SIZE 60 // longs!

/*
 * define how many threads we want (established by trial and error, after
 * determining how big the stack size of each thread must be):
 */
#ifdef __CATALINA_P2
#define THREAD_COUNT 1000 
#else
#define THREAD_COUNT 50
#endif

/*
 * define a global variable that all threads will share:
 */
static int ping;

/*
 * function : this function can be executed as a Posix thread.
 */
void *function(void *me) {

   while (1) {
      if (ping == (int)me) {
         // just reset ping to indicate we are still alive!
         ping = 0;
      }
      else {
         // nothing to do, so yield
         pthread_yield();
      }
   }
   return NULL;
}

/*
 * main : start up to THREAD_COUNT threads, then ping each one in turn
 */
int main(void) {

   int i = 0;
   pthread_attr_t attr;
   pthread_t thread_id;

   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   t_printf("Press a key to start\n");
   k_wait();

   pthread_attr_init(&attr);
   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      pthread_attr_setstack(&attr, (void *)&stacks[STACK_SIZE*(i-1)], STACK_SIZE*4);
      pthread_create(&thread_id, &attr, &function, (void *)i);
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
            pthread_yield();
         };
         t_printf("%d ", i);
      }
   }

   return 0;
}
