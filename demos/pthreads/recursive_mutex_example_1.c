#include <stdio.h>
#include <pthread.h>

/*
 * try changing USE_RECURSIVE_MUTEX to 0 to see the difference it makes!
 */
#define USE_RECURSIVE_MUTEX 1

#define NTHREADS 10

#define RECURSION 3

pthread_mutexattr_t mutex_attr;

pthread_mutex_t mutex;

pthread_once_t once = PTHREAD_ONCE_INIT;

int  counter = 0;

void once_function(void) {
   printf("You should see this message only once!\n");
}

void *thread_function(void *dummyPtr) {
   int k;
   int result;
   int got_lock = 0;
   printf("Thread %8X\n", pthread_self());
   pthread_once(&once, once_function);
   for (k = 0; k < RECURSION; k++) {
      result = pthread_mutex_lock( &mutex );
      if (result == 0) {
         got_lock++;
         counter++;
      }
      else {
         printf("failed to get lock, result = %d!\n", result);
      }
   }
   if (got_lock) {
      for (k = 0; k < RECURSION; k++) {
         result = pthread_mutex_unlock( &mutex );
      }
   }
   return NULL;
}

void main() {
   pthread_t thread_id[NTHREADS];
   int i, j;


   pthread_mutexattr_init(&mutex_attr);
   printf("Main   %8X\n", pthread_self());

#if USE_RECURSIVE_MUTEX
   pthread_mutexattr_settype(&mutex_attr, PTHREAD_MUTEX_RECURSIVE);
#else
   pthread_mutexattr_settype(&mutex_attr, PTHREAD_MUTEX_NORMAL);
#endif

   pthread_mutex_init(&mutex, &mutex_attr);

   for(i=0; i < NTHREADS; i++) {
      pthread_create( &thread_id[i], NULL, thread_function, NULL );
   }

   for(j=0; j < NTHREADS; j++) {
      pthread_join( thread_id[j], NULL); 
   }
  
   /* Now that all threads are complete I can print the final result.     */
   /* Without the join I could be printing a value before all the threads */
   /* have been completed.                                                */

   printf("All threads joined. Final counter value: %d\n", counter);
}


