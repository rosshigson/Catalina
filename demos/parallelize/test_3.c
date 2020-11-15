/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 instances of each worker (up to 5 in parallel) using 
 * the same (default) factory.
 *
 * We use of the "exclusive" and "shared" pragmas to prevent the mixing of 
 * output between the workers of each type.  However, we do not prevent the 
 * two sets of workers from mixing. 
 */

#pragma propeller worker worker_1(int i) threads(5)
#pragma propeller worker worker_2(int i) threads(5)

void main() {
    int i;

    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_1
       #pragma propeller exclusive
       printf("a simple test %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_1
    }
    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_2
       #pragma propeller exclusive
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_2
    }

    #pragma propeller wait worker_1
    #pragma propeller wait worker_2

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
