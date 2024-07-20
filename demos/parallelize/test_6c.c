/*
 * This program defines one factory and one worker. The factory is started in 
 * a different file. In such cases, we must use our own lock, which is also
 * defined in a different file, so in this file we declare it as "extern".
 *
 * We also declare an exclusive code segment across multiple files (i.e. a
 * segment of code which we only want one thread to be executing at a time). 
 * In such cases, we define the exclusion lock in one file by specifically 
 * declaring the "lock" for the exclusive code segment in another file, but 
 * we can then use the same lock in this file by declaring it as "extern".
 */

#pragma propeller extern my_lock

#pragma propeller factory factory_2 lock(my_lock) cogs(2)

#pragma propeller worker worker_2(int i) threads(5) factory(factory_2)

void my_function_2(void) {
    int i;

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_2
       #pragma propeller exclusive extern
       printf("A SIMPLE TEST %d ", i);
       #pragma propeller shared 
       #pragma propeller end worker_2
    }
}
