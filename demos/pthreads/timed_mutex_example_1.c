#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int counter = 0;

void *inc_count(void *hold_time);

// these times will make at least one thread time out ...
#define WAIT_TIME 5
#define HOLD_TIME_1 3
#define HOLD_TIME_2 4
#define HOLD_TIME_3 5

void main() {
   pthread_t thread1, thread2, thread3;
   int result;

   pthread_mutex_init(&mutex, NULL);

   /* Create independent threads each of which will execute inc_count() */

   if (result=pthread_create(&thread1, NULL, inc_count, (void *)HOLD_TIME_1)) {
      printf("Thread creation failed: %d\n", result);
   }

   if (result=pthread_create(&thread2, NULL, inc_count, (void *)HOLD_TIME_2)) {
      printf("Thread creation failed: %d\n", result);
   }

   if (result=pthread_create(&thread3, NULL, inc_count, (void *)HOLD_TIME_3)) {
      printf("Thread creation failed: %d\n", result);
   }

   /* Wait till threads are complete before main continues. Unless we  */
   /* wait we run the risk of executing an exit which will terminate   */
   /* the process and all threads before the threads have completed.   */

   pthread_join(thread1, NULL);
   pthread_join(thread2, NULL); 
   pthread_join(thread3, NULL); 

   printf("all threads complete\n");

   exit(0);
}

void *inc_count(void *hold_time) {
   struct timespec now;
   struct timespec wait;
   int result;

   clock_gettime(CLOCK_REALTIME, &now);
   wait.tv_sec = WAIT_TIME;
   wait.tv_nsec = 0;
   clock_add(&wait, &now);
   result = pthread_mutex_timedlock(&mutex, &wait);
   if (result == ETIMEDOUT) {
      printf("timed out waiting for the mutex\n");
   }
   else {
      counter++;
      printf("Counter value: %d\n",counter);
      printf("holding the mutex for %d seconds\n", hold_time);
      pthread_sleep((int)hold_time);
      printf("unlockng the mutex\n");
      pthread_mutex_unlock( &mutex );
   }
   return NULL;
}


