/*
 * This program defines one factory and one worker. The factory is started in 
 * a different file. In such cases, we must use our own lock, which is defined
 * in this file as a "lock".
 *
 * We can also declare an exclusive code segment across multiple files (i.e. 
 * a segment of code which we only want one thread to be executing at a time). 
 * In such cases, we define the exclusion lock in one file (i.e. this one), 
 * by specifically declaring it as a "lock" for the excusive code segment, but 
 * we can then use the same lock in other files by declaring it as "extern".
 */

#pragma propeller lock my_lock

#pragma propeller factory factory_1 lock(my_lock) cogs(2)

#pragma propeller worker worker_1(int i) threads(5) factory(factory_1)

void my_function_1(void) {
    int i;

    for (i = 1; i <= 10; i++) {
       #pragma propeller begin worker_1
       #pragma propeller exclusive lock 
       printf("a simple test %d ", i);
       #pragma propeller shared 
       #pragma propeller end worker_1
    }
}
