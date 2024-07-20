#include <pthread.h>
#include <limits.h>

/*
 * default prority for all threads (ticks)
 */
#define _DEFAULT_PRIORITY 100
#define _DEFAULT_AFFINITY -1

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_attr_init(pthread_attr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   memset(attr, 0, sizeof(pthread_attr_t));
   attr->stacksize = _STACK_SIZE*4; // bytes
   attr->priority  = _DEFAULT_PRIORITY;
   attr->affinity  = _cogid(); // current cog
   return 0;
}

int pthread_attr_destroy(pthread_attr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_attr_copy(pthread_attr_t *dst, const pthread_attr_t *src) {
   memcpy(dst, src, sizeof(pthread_attr_t));
   return 0;
}

int pthread_attr_setstack(pthread_attr_t *attr, 
                          void *stackaddr, size_t stacksize) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->stackaddr = stackaddr;
   attr->stacksize = stacksize;
   return 0;
}

int pthread_attr_getstack(pthread_attr_t *attr,
                          void **stackaddr, size_t *stacksize) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   *stackaddr = attr->stackaddr;
   *stacksize = attr->stacksize;
   return 0;
}

int pthread_attr_setstacksize(pthread_attr_t *attr, size_t size) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->stacksize = size; 
   return 0;
}

int pthread_attr_getstacksize(pthread_attr_t *attr, size_t *size) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   *size = attr->stacksize; 
   return 0;
}

int pthread_attr_setguardsize(pthread_attr_t *attr, size_t guardsize) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->guardsize = guardsize; 
   return 0;
}

int pthread_attr_getguardsize(const pthread_attr_t *attr,
                              size_t *guardsize) {
   if ((attr == NULL) || (guardsize == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *guardsize = attr->guardsize; 
   return 0;
}

int pthread_attr_setdetachstate(pthread_attr_t *attr,int detachstate) {
   if ((attr == NULL)
   ||  ( (detachstate != PTHREAD_CREATE_DETACHED)
      && (detachstate != PTHREAD_CREATE_JOINABLE))) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->detachstate = detachstate;
   return 0;
}


int pthread_attr_getdetachstate(const pthread_attr_t *attr, int *detachstate) {
   if ((attr == NULL) || (detachstate == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *detachstate = attr->detachstate;
   return 0;
}

int pthread_attr_setscope(pthread_attr_t *attr,int scope) {
   if ((attr == NULL)
   ||  ( (scope != PTHREAD_SCOPE_SYSTEM)
      && (scope != PTHREAD_SCOPE_PROCESS))) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_attr_getscope(pthread_attr_t *attr, int *scope) {
   if ((attr == NULL) || (scope == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *scope = PTHREAD_SCOPE_SYSTEM;
   return 0;
}

int pthread_attr_setschedpolicy(pthread_attr_t *attr, int policy) {
   if ((attr == NULL) || (policy != SCHED_OTHER)) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

int pthread_attr_getschedpolicy(pthread_attr_t *attr,
                                int *policy) {
   if ((attr == NULL) || (policy == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *policy = SCHED_OTHER;
   return 0;
}

int pthread_attr_setschedparam(pthread_attr_t *attr,
                               const struct sched_param *param) {
   if ((attr == NULL) || (param == NULL) || (param->sched_priority < 1)) {
      errno = EINVAL;
      return EINVAL;
   }
   attr->priority = param->sched_priority;
   return 0;
}

int pthread_attr_getschedparam(pthread_attr_t *attr,
                               struct sched_param *param) {
   if ((attr == NULL) || (param == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   param->sched_priority = attr->priority;
   return 0;
}

int pthread_setschedparam(pthread_t thread,
                          int policy,
                          const struct sched_param *param) {
   if ((thread == NULL) || (param == NULL) || (param->sched_priority < 1)) {
      errno = EINVAL;
      return EINVAL;
   }
   _thread_ticks(thread->thread, param->sched_priority);
   return 0;
}

int pthread_getschedparam(pthread_t thread, 
                      int *policy,
                      struct sched_param *param) {
   if ((thread == NULL) || (param == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *policy = SCHED_OTHER;
   param->sched_priority = _thread_get_ticks(thread->thread);
   return 0;
}


