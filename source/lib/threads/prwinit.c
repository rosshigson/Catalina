#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_rwlock_init(pthread_rwlock_t *rwlock,
                        const pthread_rwlockattr_t *attr) {

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);

   if (rwlock->lock <= 0) {
      // no locks left!
      errno = EAGAIN;
      return EAGAIN;
   }
   rwlock->writing_count = 0;
   rwlock->reading_count = 0;
   rwlock->writers = NULL;
   rwlock->readers = NULL;
   return 0;
}

int pthread_rwlock_destroy(pthread_rwlock_t *rwlock) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((rwlock == NULL) ) {
      errno = EINVAL;
      return EINVAL;
   }
   _thread_stall();
   if (rwlock->lock > 0) {
      _thread_lockret(_Pthread_Pool, rwlock->lock);
   }
   rwlock->lock = -1;
   _thread_allow();

   return 0;
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   *attr = 0;
   return 0;
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *attr) {
   return 0;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *attr, 
                                  int *pshared) {
   if ((attr == NULL)
   ||  ( (*pshared != PTHREAD_PROCESS_SHARED)
      && (*pshared != PTHREAD_PROCESS_PRIVATE))) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *attr,
                                  int *pshared) {
   if ((attr == NULL) || (pshared == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *pshared = PTHREAD_PROCESS_SHARED;
   return 0;
}

