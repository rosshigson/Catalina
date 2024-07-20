#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_spin_init(pthread_spinlock_t *lock, int pshared) {

   if (lock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(lock);

   if (*lock <= 0) {
      // no locks left
      errno = EAGAIN;
      return EAGAIN;
   }
   return 0;
}

int pthread_spin_lock(pthread_spinlock_t *lock) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((lock == NULL) || (*lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }
   // do not return until we get the spin lock
   while (!_thread_lockset(_Pthread_Pool, *lock)) {
      _thread_yield();
   }
   return 0;
}

int pthread_spin_trylock(pthread_spinlock_t *lock) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((lock == NULL) || (*lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }
   // return EBUSY if we don't get the spin lock immediately
   if (!_thread_lockset(_Pthread_Pool, *lock)) {
      errno = EBUSY;
      return EBUSY;
   }
   // otherwise return 0
   return 0;
}

int pthread_spin_unlock(pthread_spinlock_t *lock) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((lock == NULL) || (*lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }
   _thread_lockclr(_Pthread_Pool, *lock);
   return 0;
}

int pthread_spin_destroy(pthread_spinlock_t *lock) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (lock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   if (*lock > 0) {
      _thread_lockret(_Pthread_Pool, *lock);
   }
   *lock = -1;
   return 0;
}

