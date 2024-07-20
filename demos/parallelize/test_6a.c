/*
 * This program defines two workers, which print different test messages. 
 * We then execute 10 of each worker.
 *
 * In this program the workers themselves are defined in separate files. In
 * such cases, we must always use our own lock, which is defined in a
 * different file. So in this file, we declare it as "extern".
 */

#pragma propeller extern my_lock

#pragma propeller worker worker_1(int i) threads(5) factory(factory_1)
#pragma propeller worker worker_2(int i) threads(5) factory(factory_2)

void main() {

    #pragma propeller kernel my_lock

    #pragma propeller start factory_1
    #pragma propeller start factory_2

    printf("Hello, world!\n\n");

    my_function_1();
    my_function_2();

    #pragma propeller wait worker_1
    #pragma propeller wait worker_2

    printf("\n\nGoodbye, world!\n");

    while(1);  // never terminate
}
