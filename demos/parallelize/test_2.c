/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 instances of each worker using the same (default)
 * factory. 
 *
 * We use a stack size of 150 longs (the default is 200, but this is too
 * much stack space on the Propeller 1 if we want to be able to execute 20
 * threads in parallel. However, in this program, each worker calls "printf", 
 * so we do need a fairly large stack - we must establish the appropriate 
 * stack size by trial and error for each type of worker. If necessary, we 
 * can reduce the number of worker threads that can execute in parallel.
 *
 * We use "wait" pragmas to wait until all the workers have completed.
 */

#pragma propeller  worker worker_1(int i) stack(150)
#pragma propeller  worker worker_2(int i) stack(150)

void main() {
    int i;

    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin worker_1
       printf("a simple test %d ", i);
       #pragma propeller end worker_1
    }

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin worker_2
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller end worker_2

    }

    #pragma propeller wait worker_1
    #pragma propeller wait worker_2

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}

