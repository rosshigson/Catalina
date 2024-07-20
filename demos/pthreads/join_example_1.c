#include <stdlib.h>
#include <pthread.h>

void *thread_func(void *arg) {
   printf("Hello World! (from pthread)\n");
   pthread_sleep(1);
   pthread_exit((void *)(arg));
   return NULL;
}

void main(int argc, char *argv[]) {
   pthread_t thread;
   void *result;

   printf("Hello World!\n");

   pthread_create(&thread, NULL, thread_func, (void *)0x12345678);
   pthread_join(thread, &result);

   printf("thread joined, result = %8x\n", (int)result);
   
   while(1);
}
