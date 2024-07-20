#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_condattr_init(pthread_condattr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->clk_id = 0;
   return 0;
}

int pthread_condattr_destroy(pthread_condattr_t *attr) {
   return 0;
}

int pthread_condattr_setpshared(pthread_condattr_t *attr, 
                                int *pshared) {
   if ((attr == NULL)
   ||  ( (*pshared != PTHREAD_PROCESS_SHARED)
      && (*pshared != PTHREAD_PROCESS_PRIVATE))) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_condattr_getpshared(const pthread_condattr_t *attr,
                                int *pshared) {
   if ((attr == NULL) || (pshared == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *pshared = PTHREAD_PROCESS_SHARED;
   return 0;
}

