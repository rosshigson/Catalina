#include <pthread.h>
#include <stdlib.h>

// exit a thread, and return a status (which can be retrieved 
// using pthread_join). Note that a thread that exits will only
// have its stack reclaimed if it is (a) marked as reclaimable
// and (b) subsequenly joined. 
void pthread_exit(void *status) {
   _thread_exit((int)status);
}

int pthread_join(pthread_t tid, void **status) {
   int result;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (tid == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   if (tid->detachstate != PTHREAD_CREATE_JOINABLE) {
      // thread cannnot be joined (i.e. it is detached)
      errno = EINVAL;
      return EINVAL;
   }

   _thread_join(tid->thread, &result);
   if (status != NULL) {
     *status = (void *)result;
   }
   // when join returns with the id of the task being joined,
   // we can free the stack allocated, and what is pointed to
   // by the thread id, which is a thead_attr_t. The exception
   // is when the thread is marked as not reclaimable, which 
   // indicates that the stack was not automatically allocated,
   // and should not be automatically freed. Also, note that a 
   // tid of -1 is special (the main thread has this tid) ...
   if (tid != (pthread_t)-1) {
      if (tid->reclaimable) {
         free(tid->stackaddr);
      }
      // free the space allocated for the thread
      free(tid);
   }
   return 0;
}

