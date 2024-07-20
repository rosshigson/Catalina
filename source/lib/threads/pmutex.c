#include <pthread.h>
#include <limits.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_mutex_lock(pthread_mutex_t *mutex) {
   register pthread_t self;

   if (mutex == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&mutex->lock);

   if (mutex->type == PTHREAD_MUTEX_ERRORCHECK) {
      if (mutex->owner != NULL) {
         errno = EBUSY;
         return EBUSY;
      }
   }
   
   self = pthread_self();
   if (mutex->type == PTHREAD_MUTEX_RECURSIVE) {
      if (mutex->owner != self) {
         // do not return until we get the mutex - no checking!
         while (!_thread_lockset(_Pthread_Pool, mutex->lock)) {
            _thread_yield();
         }
         mutex->owner = self;
         mutex->count = 1;
         return 0;
      }
      else {
         if (mutex->count < INT_MAX) {
            mutex->count++;
            return 0;
         }
         else {
            errno = EAGAIN;
            return EAGAIN;
         } 
      }
   }
   else {
      if (mutex->owner == self) {
         // we already have this mutex locked
         errno = EDEADLK;
         return EDEADLK; 
      }
      // do not return until we get the mutex - no checking!
      while (!_thread_lockset(_Pthread_Pool, mutex->lock)) {
         _thread_yield();
      }
      mutex->owner = self;
      return 0;
   }
}

int pthread_mutex_unlock(pthread_mutex_t *mutex) {
   if ((mutex == NULL) || (mutex->lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (mutex->owner != pthread_self()) {
      errno = EPERM;
      return EPERM;
   }
   if (mutex->type == PTHREAD_MUTEX_RECURSIVE) {
      if (mutex->count > 1) {
         mutex->count--;
      }
      else {
         mutex->count = 0;
         mutex->owner = NULL;
         _thread_lockclr(_Pthread_Pool, mutex->lock);
      }
      _thread_yield();
      return 0;
   }
   else {
      mutex->owner = NULL;
      _thread_lockclr(_Pthread_Pool, mutex->lock);
      _thread_yield();
      return 0;
   } 
}

