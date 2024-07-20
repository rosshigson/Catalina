#include <pthread.h>

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_barrier_destroy(pthread_barrier_t *barrier) {

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (barrier == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   _thread_stall();
   if (barrier->lock > 0) {
      _thread_lockret(_Pthread_Pool, barrier->lock);
   }
   barrier->lock = -1;
   _thread_allow();

   return 0;
}

int pthread_barrier_init(pthread_barrier_t *barrier,
                         const pthread_barrierattr_t *attr,
                         unsigned count) {

   if ((barrier == NULL) || (count == 0)) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if (barrier->lock > 0) {
      // barrier has not been destroyed - may still be in use
      errno = EBUSY;
      return EBUSY;
   }

   _thread_stall();
   barrier->lock = _thread_locknew(_Pthread_Pool);
   if (barrier->lock <= 0) {
      // no locks left!
      _thread_allow();
      errno = EAGAIN;
      return EAGAIN;
   }
   barrier->waiting = NULL;
   barrier->required_count = count;
   barrier->waiting_count = 0;
   barrier->signal = 0;
   _thread_allow();

   return 0;
}

int pthread_barrier_wait(pthread_barrier_t *barrier) {
   struct _pthread_node my_node = { 0, NULL, NULL };

   if ((barrier == NULL) || (barrier->lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }
 
   // get the barrier mutex
   _thread_lockset(_Pthread_Pool, barrier->lock);
   // add ourselves to the barrier waiting list
   my_node.next = barrier->waiting;
   barrier->waiting = &my_node;
   barrier->waiting_count++;
   if (barrier->waiting_count == barrier->required_count) {
      barrier->signal = 1;
   }
   _thread_lockclr(_Pthread_Pool, barrier->lock);
   // now wait until we are signalled
   while (barrier->signal == 0) {
      _thread_yield();
   }
   // we have the signal - now all waiting threads can go -
   // but only one (the last one on the list) will get the 
   // PTHREAD_BARRIER_SERIAL_THREAD as its return value
   //
   _thread_lockset(_Pthread_Pool, barrier->lock);
   // wait till we get to be first on the list
   while (barrier->waiting != &my_node) {
      _thread_yield();
   }

   _thread_stall();
   // remove ourselves from the list
   barrier->waiting = my_node.next;
   barrier->waiting_count--;
   if (barrier->waiting == NULL) {
      // reset the barrier object
      barrier->signal = 0;
      barrier->waiting_count = 0;
      _thread_lockclr(_Pthread_Pool, barrier->lock);
      _thread_allow();
      return PTHREAD_BARRIER_SERIAL_THREAD;
   }
   else {
      _thread_lockclr(_Pthread_Pool, barrier->lock);
      _thread_allow();
      return 0;
   }
}

int pthread_barrierattr_init(pthread_barrierattr_t *attr) {
   if (attr == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   *attr = 0;
   return 0;
}

int pthread_barrierattr_destroy(pthread_barrierattr_t *attr) {
   return 0;
}

int pthread_barrierattr_getpshared(const pthread_barrierattr_t *attr,
                                   int *pshared) {
   if ((attr == NULL) || (pshared == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   *pshared = PTHREAD_PROCESS_SHARED;
   return 0;
}

int pthread_barrierattr_setpshared(pthread_barrierattr_t *attr, 
                                   int *pshared) {
   if ((attr == NULL)
   ||  ( (*pshared != PTHREAD_PROCESS_SHARED)
      && (*pshared != PTHREAD_PROCESS_PRIVATE))) {
      errno = EINVAL;
      return EINVAL;
   }
   return 0;
}

