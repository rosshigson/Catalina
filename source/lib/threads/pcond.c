#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

// release mutex and block on condition
// when condition is signalled re-acquire mutex and return
int pthread_cond_wait(pthread_cond_t *cond,
                      pthread_mutex_t *mutex) {
   struct _pthread_node my_node = { 0, NULL, NULL };

   if ((cond == NULL) || (mutex == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&mutex->lock);

   // we must already have locked the mutex associated with this 
   // condition variable - if not, we will crash and burn here!
   my_node.next = cond->waiting;
   cond->waiting = &my_node;
   // unlock the mutex while waiting
   pthread_mutex_unlock(mutex);
   // keep yielding until we are signalled
   while (!my_node.signal) {
      _thread_yield();
   }
   // we have been signalled - get the mutex and return
   pthread_mutex_lock(mutex);
   return 0;
}

// signal a condition to a single thread - should be done only 
// while holding the mutex that is associated with the condition
int pthread_cond_signal(pthread_cond_t *cond) {
   register int *signal;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (cond == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   _thread_stall();
   // make sure there is a thread waiting!
   if (cond->waiting != NULL) {
      // get the address of the signal for the waiting thread
      signal = &cond->waiting->signal;
      // remove this entry from the list of waiting threads
      cond->waiting = cond->waiting->next;
      // set the signal
      *signal = 1;
   }
   _thread_allow();

   _thread_yield();
   return 0;
}

// signal a condition to all waiting threads - should be done only 
// while holding the mutex that is associated with the condition

int pthread_cond_broadcast(pthread_cond_t *cond) {
   register int *signal;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (cond == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   _thread_stall();
   // make sure there is a thread waiting!
   while (cond->waiting != NULL) {
      // get the address of the signal for the waiting thread
      signal = &cond->waiting->signal;
      // remove this entry from the list of waiting threads
      cond->waiting = cond->waiting->next;
      // set the signal
      *signal = 1;
   }
   _thread_allow();

   _thread_yield();
   return 0;
}

