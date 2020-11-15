/*
 * This program defines one factory and one worker. The factory is started in 
 * a different file. In such cases, we must use our own lock, which is defined
 * in this file.
 */

#pragma propeller lock my_lock

#pragma propeller factory factory_1 lock(my_lock) cogs(2)

#pragma propeller worker worker_1(int i) threads(5) factory(factory_1)

void my_function_1(void) {
    int i;

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_1
       #pragma propeller exclusive
       printf("a simple test %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_1
    }
}
