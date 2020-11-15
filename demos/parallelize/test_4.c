/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 instances of each worker (up to 4 in parallel).
 *
 * This time we define two factories, and we partition the available
 * cogs between them (2 each) so that they can execute together. We use
 * a "wait" pragma to keep the output of the two factories separate, but 
 * we do not prevent the output of the workers of each factory from mixing.
 */

#pragma propeller factory factory_1 cogs(2)
#pragma propeller factory factory_2 cogs(2)

#pragma propeller worker worker_1(int i) threads(4) factory(factory_1)
#pragma propeller worker worker_2(int i) threads(4) factory(factory_2)

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

    #pragma propeller wait worker_1

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_2
       #pragma propeller exclusive
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_2
    }

    #pragma propeller wait worker_2

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
