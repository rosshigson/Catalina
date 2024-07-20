#include <pthread.h>
#include <limits.h>

/*
 * define the number of milliseconds to use for timed resolutions. It really
 * should be 1ms, but timed calls at this resolution would be very expensive, 
 * and in any case the resolution of the thread context switching is not that 
 * high!
 */
#define _TIMED_RESOLUTION 10

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_mutex_timedlock(pthread_mutex_t *mutex,
                            const struct timespec *abstime) {
   struct timespec now;
   register pthread_t self;
   register int timed_out = 0;

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
         // do not return until we get the mutex or time out
         while (!_thread_lockset(_Pthread_Pool, mutex->lock)) {
            clock_gettime(CLOCK_REALTIME, &now);
            if (clock_compare(&now, abstime) >= 0) {
               timed_out = 1;
               break;
            }
            pthread_msleep(_TIMED_RESOLUTION);
         }
         if (timed_out) {
            // we timed out - return error
            errno = ETIMEDOUT;
            return ETIMEDOUT;
         }
         else {
            // we got the lock - return ok
            mutex->owner = self;
            mutex->count = 1;
            return 0;
         }
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
         errno = EDEADLK;
         return EDEADLK; 
      }
      // do not return until we get the mutex
      while (!_thread_lockset(_Pthread_Pool, mutex->lock)) {
         clock_gettime(CLOCK_REALTIME, &now);
         if (clock_compare(&now, abstime) >= 0) {
            timed_out = 1;
            break;
         }
         pthread_msleep(_TIMED_RESOLUTION);
      }
      if (timed_out) {
         // we timed out - return error
         errno = ETIMEDOUT;
         return ETIMEDOUT;
      }
      else {
         // we got the lock - return ok
         mutex->owner = self;
         return 0;
      }
   }
}

