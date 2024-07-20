#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_mutex_init(pthread_mutex_t *mutex,
                       const pthread_mutexattr_t *attr) {
   // ensure the lock pool has been initialized, but
   // do not allocate a lock till we see if one has
   // already been allocated ...
   _pthread_init_lock_pool(NULL);

   if (mutex == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock is not already initialized (???how???)
   /*
   _thread_stall();
   if (mutex->lock > 0) {
      _thread_allow();
      errno = EBUSY;
      return EBUSY;
   }
   if (mutex->lock <= 0) {
      mutex->lock = _thread_locknew(_Pthread_Pool);
   }
   _thread_allow();
   */


   _thread_stall();
   mutex->lock = _thread_locknew(_Pthread_Pool);
   if (mutex->lock == -1) {
      errno = ENOMEM;
      return ENOMEM;
   }
   if (attr != NULL) {
      mutex->type = attr->type;
   }
   mutex->owner = NULL;
   mutex->count = 0;
   _thread_allow();

   
   return 0;
}

int pthread_mutex_destroy(pthread_mutex_t *mutex) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((mutex == NULL) || (mutex->lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }

   _thread_stall();
   if (mutex->lock > 0) {
      _thread_lockret(_Pthread_Pool, mutex->lock);
   }
   mutex->count = 0;
   mutex->owner = NULL;
   mutex->lock = -1;
   _thread_allow();

   return 0;
}

int pthread_mutex_consistent(pthread_mutex_t *mutex) {
   if (mutex == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

