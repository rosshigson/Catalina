#include <pthread.h>

/*
 * define the number of milliseconds to use for timed resolutions. It really
 * should be 1ms, but timed calls at this resolution would be very expensive, 
 * and in any case the resolution of the thread context switching is not that 
 * high!
 */
#define _TIMED_RESOLUTION 10

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_cond_timedwait(pthread_cond_t *cond,
                           pthread_mutex_t *mutex,
                           const struct timespec *abstime) {
   struct _pthread_node my_node = { 0, NULL, NULL };
   struct timespec now;

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
   // keep yielding until we are signalled, or the time
   // specified by abstime has arrived
   while (!my_node.signal) {
      clock_gettime(cond->clk_id, &now);
      if (clock_compare(&now, abstime) >= 0) {
         break;
      }
      pthread_msleep(_TIMED_RESOLUTION);
   }
   // we always get the mutex, even if we timed out
   pthread_mutex_lock(mutex);
   if (my_node.signal) {
      // we have been signalled - return ok
      return 0;
   }
   else {
      // we must have have timed out - return error
      errno = ETIMEDOUT;
      return ETIMEDOUT;
   }
}


int pthread_condattr_setclock(pthread_condattr_t *attr,
                              clockid_t clk_id) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->clk_id = clk_id;
   return 0;
}

int pthread_condattr_getclock(const pthread_condattr_t *attr,
                              clockid_t *clk_id) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   *clk_id = attr->clk_id;
   return 0;
}
