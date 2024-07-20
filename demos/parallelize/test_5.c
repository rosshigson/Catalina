/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 instances of each worker.
 *
 * We define two factories, and we partition the available cogs between 
 * them (2 each) so that they can execute together. 
 *
 * This time we define our own lock, and use it in both factories. Because
 * we define our own lock, we must also set that as the kernel lock as well.
 *
 * We also declare one of the factories to have a custom foreman. Because of 
 * this, we also must include the threads.h header file. Note that a foreman 
 * MUST set the thread lock - this should be the first thing it does.
 *
 * We also used a "named" exclusion lock called "printf" (the name can be
 * any valid identifier, but this name reminds us of what it is used for).
 *
 * In this example, we also manually start the factories.
 *
 */

#ifdef __PARALLELIZED
#include <threads.h>
#endif

#pragma propeller lock my_lock

#pragma propeller factory factory_1 cogs(2) lock(my_lock)
#pragma propeller factory factory_2 cogs(2) lock(my_lock) stack(150) foreman(my_foreman)

#pragma propeller worker worker_1(int i) stack(150) factory(factory_1)
#pragma propeller worker worker_2(int i) stack(150) factory(factory_2)

#ifdef __PARALLELIZED
// define our own foreman
static int my_foreman(int argc, char *argv[]) {
   _thread_set_lock(my_lock);
   printf("Foreman standing by on cog %d!\n\n", _cogid());
   while (1) {
      _thread_yield();
   }
   return 0;
}
#endif

void main() {
    int i;

    #pragma propeller kernel my_lock

    #pragma propeller start factory_1
    #pragma propeller start factory_2

    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_1
       #pragma propeller exclusive printf
       printf("a simple test %d ", i);
       #pragma propeller shared printf
       #pragma propeller end worker_1
    }

    #pragma propeller wait worker_1

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_2
       #pragma propeller exclusive printf
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller shared printf
       #pragma propeller end worker_2
    }

    #pragma propeller wait worker_1
    #pragma propeller wait worker_2

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
