/*
 * This program defines one factory and one worker. The factory is started in 
 * a different file. In such cases, we must use our own lock, which is also
 * defined in a different file.
 */

#pragma propeller extern my_lock

#pragma propeller factory factory_2 lock(my_lock) cogs(2)

#pragma propeller worker worker_2(int i) threads(5) factory(factory_2)

void my_function_2(void) {
    int i;

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_2
       #pragma propeller exclusive
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller shared
       #pragma propeller end worker_2
    }
}
