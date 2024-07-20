#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_mutexattr_destroy(pthread_mutexattr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->type = PTHREAD_MUTEX_DEFAULT;
   return 0;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *attr, int *type) {
   if ((attr == NULL) || (type == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *type = attr->type;
   return 0;
}

int pthread_mutexattr_init(pthread_mutexattr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->type = PTHREAD_MUTEX_DEFAULT;
   return 0;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *attr, int type) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->type = type;
   return 0;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *attr,
                                 int *pshared) {
   if ((attr == NULL)
   ||  ( (*pshared != PTHREAD_PROCESS_SHARED)
      && (*pshared != PTHREAD_PROCESS_PRIVATE))) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_mutexattr_getpshared(pthread_mutexattr_t *attr,
                                 int *pshared) {
   if ((attr == NULL) || (pshared == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *pshared = PTHREAD_PROCESS_SHARED;
   return 0;
}

int pthread_mutexattr_getrobust(const pthread_mutexattr_t *attr, int *robustness) {
   if ((attr == NULL) || (robustness == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *robustness = PTHREAD_MUTEX_STALLED;
   return 0;
}

int pthread_mutexattr_setrobust(pthread_mutexattr_t *attr, int *robustness) {
   if ((attr == NULL) || (robustness == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

