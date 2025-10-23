/*
 * secondary segment:
 *    name="hub_function"
 *    address="0x76468"
 *    stack="8000"
 *    mode="NMM"
 *    options="-lci -lthreads -C NO_FLOAT"
 *    type="shared_data_t"
 *    binary=""
 *    overlay=""
 */

#include "common.h"

#line 50 "lua_p2.c"

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * define how many threads we want:
 */
#define THREAD_COUNT 10

/*
 * define the stack size each thread needs (since this number 
 * depends on the function executed by the thread, the smallest 
 * possible stack size has to be established by trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 55)

static int ping;

/*
 * function : a function that can be executed as a thread
 */
int function(int me, char *not_used[]) {

   while (1) {
      if (ping == me) {
         // print our id
         t_printf("%d ", (unsigned)me);
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
 * hub_function : start THREAD_COUNT threads, then ping each one in turn
 */
void hub_function(shared_data_t *s) {

   int i = 0;
   void *thread_id;
   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   // wait till we are told to go (by Lua!) before proceeding
   while (s->go == 0);

   t_printf("... C executes multiple threads using cog %d\n\n", _cogid());

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

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
         t_printf("%d:", i);
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


/******************************************************************************
 *                                                                            *
 * The primary function - executes Lua                                        *
 *                                                                            *
 ******************************************************************************/

void main(shared_data_t *shared) {
   hub_function(shared);
   while(1);
}
