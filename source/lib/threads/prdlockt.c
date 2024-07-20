#include <pthread.h>
#include <stdlib.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

/*
 * define the number of milliseconds to use for timed resolutions. It really
 * should be 1ms, but timed calls at this resolution would be very expensive, 
 * and in any case the resolution of the thread context switching is not that 
 * high!
 */
#define _TIMED_RESOLUTION 10

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_rwlock_timedrdlock(pthread_rwlock_t *rwlock,
                               const struct timespec *abstime) {
   register struct _pthread_node *my_node = NULL;
   struct timespec now;
   register int timed_out = 0;

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);
   
   // now wait until there are no writers 
   // either writing or waiting, or we time out
   while (1) {
      while (!_thread_lockset(_Pthread_Pool, rwlock->lock)) {
         clock_gettime(CLOCK_REALTIME, &now);
         if (clock_compare(&now, abstime) >= 0) {
            timed_out = 1;
            break;
         }
         pthread_msleep(_TIMED_RESOLUTION);
      }
      // either we got the lock, or we timed out (but not both)
      if (timed_out) {
         // we timed out - return an error
         errno = ETIMEDOUT;
         return ETIMEDOUT;
      }
      else {
         // we can proceed if there are no writers
         if  ((rwlock->writing_count == 0) 
         &&   (rwlock->writers == NULL)) {
            // add ourselves to the rwlock readers list
            my_node = malloc(sizeof(struct _pthread_node));
            if (my_node == NULL) {
               _thread_lockclr(_Pthread_Pool, rwlock->lock);
               errno = EAGAIN;
               return EAGAIN;
            }
            my_node->self = pthread_self();
            my_node->next = NULL;
            my_node->next = rwlock->readers;
            rwlock->readers = my_node;
            // increment reader count
            rwlock->reading_count++;
            _thread_lockclr(_Pthread_Pool, rwlock->lock);
            return 0;
         }
         else {
            // keep trying
            _thread_lockclr(_Pthread_Pool, rwlock->lock);
         }
      }
   }
   // can't ever get here, but the compiler doesn't know that
   return 0;
}

