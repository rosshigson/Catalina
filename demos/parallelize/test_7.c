/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 instances of each worker (but only 5 in parallel at 
 * any one time).
 *
 * This time we define two factories which both use all avalable cogs, 
 * so we have to stop the first factory before we can start the second.
 *
 * Note the use of the "dynamic" memory option. This is not required, this
 * is just demonstrate it's effect. Try changing dynamic to static and see 
 * the difference in the code and file sizes when this program is compiled.
 */

#pragma propeller factory factory_1 memory(dynamic)
#pragma propeller factory factory_2 

#pragma propeller worker worker_1(int i) threads(5) stack(150) factory(factory_1) 
#pragma propeller worker worker_2(int i) threads(5) stack(150) factory(factory_2) 

void main() {
    int i;

    #pragma propeller start factory_1

    printf("Hello, world!\n\n");

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_1
       #pragma propeller exclusive
       printf("a simple test %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_1
    }
    
    #pragma propeller wait worker_1

    #pragma propeller stop factory_1
    #pragma propeller start factory_2

    printf("\n\nHello again, world!\n\n");

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


