#include <pthread.h>
#include <limits.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_mutex_trylock(pthread_mutex_t *mutex) {

   register pthread_t self;
   register int ret;

   if (mutex == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&mutex->lock);

   if (mutex->lock == -1) {
      errno = ENOMEM;
      return ENOMEM;
   }
   if (mutex->type == PTHREAD_MUTEX_ERRORCHECK) {
      if (mutex->owner != NULL) {
         errno = EBUSY;
         return EBUSY;
      }
      else if (mutex->owner == pthread_self()) {
         errno = EDEADLK;
         return EDEADLK; 
      }
   }
   self = pthread_self();
   if (mutex->type == PTHREAD_MUTEX_RECURSIVE) {
      if (mutex->owner == NULL) {
         // return zero if we get the mutex immediately
         ret = _thread_lockset(_Pthread_Pool, mutex->lock);
         if (ret) {
            mutex->owner = self;
            return 0;
         }
         errno = EBUSY;
         return EBUSY;
      }
      if (mutex->owner == self) {
         if (mutex->count < INT_MAX) {
            mutex->count++;
         }
         else {
            errno = EAGAIN;
            return EAGAIN;
         } 
      }
      else {
         errno = EBUSY;
         return EBUSY;
      }
      return 0;
   }
   else {
      // return zero if we get the mutex immediately, or
      // EBUSY if  we already owned it or could not get it
      ret = _thread_lockset(_Pthread_Pool, mutex->lock);
      if (ret) {
         if (mutex->owner == self) {
            errno = EBUSY;
            return EBUSY;
         }
         mutex->owner = self;
         return 0;
      }
      errno = EBUSY;
      return EBUSY;
   }
}


