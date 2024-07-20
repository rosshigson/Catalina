#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_cond_init(pthread_cond_t *cond,
                      const pthread_condattr_t *attr) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (attr != NULL) {
      cond->clk_id = attr->clk_id;
   }
   else {
      cond->clk_id = CLOCK_REALTIME;
   }
   return 0;
}

int pthread_cond_destroy(pthread_cond_t *cond) {
   register struct _pthread_node *temp;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (cond == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // If there are any threads waiting on the condition, 
   // try and signal them.
   pthread_cond_broadcast(cond);
   // now free any entries on the waiting list

   _thread_stall();
   while (cond->waiting != NULL) {
      temp = cond->waiting;
      cond->waiting = temp->next;
      free(temp);
   }
   _thread_allow();

   return 0;
}

