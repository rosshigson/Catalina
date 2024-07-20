#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int  counter = 0;

void *inc_count();

void main() {
   pthread_t thread1, thread2;
   int result;

   /* Create independent threads each of which will execute inc_count() */

   if (result=pthread_create(&thread1, NULL, inc_count, NULL)) {
      printf("Thread creation failed: %d\n", result);
   }

   if (result=pthread_create(&thread2, NULL, inc_count, NULL)) {
      printf("Thread creation failed: %d\n", result);
   }

   /* Wait till threads are complete before main continues. Unless we  */
   /* wait we run the risk of executing an exit which will terminate   */
   /* the process and all threads before the threads have completed.   */

   pthread_join(thread1, NULL);
   pthread_join(thread2, NULL); 

   printf("all threads complete\n");

   exit(0);
}

void *inc_count() {
   pthread_mutex_lock( &mutex );
   counter++;
   printf("Counter value: %d\n",counter);
   pthread_sleep(1);
   pthread_mutex_unlock( &mutex );
   return NULL;
}


