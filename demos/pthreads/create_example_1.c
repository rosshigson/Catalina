#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *print_message(void *message) {
     printf("%s \n", (char *)message);
     return NULL;
}

void main() {
     pthread_t thread1, thread2;

    /* Create threads each of which will print a message*/

     pthread_create(&thread1, NULL, print_message, (void *)"Thread 1 here!");
     pthread_create(&thread2, NULL, print_message, (void *)"Thread 2 here!");

     /* Wait till threads are complete before main continues. Unless we  */
     /* wait we run the risk of executing an exit which might terminate  */
     /* the process and all threads before the threads have completed.   */

     pthread_join(thread1, NULL);
     pthread_join(thread2, NULL);
     printf("Threads complete\n");

     exit(0);
}


