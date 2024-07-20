#include <pthread.h>
#include <stdlib.h>

int pthread_setcancelstate(int state, int *oldstate) {
   register pthread_t self = pthread_self();
   if ((oldstate == NULL)
   ||  ((state != PTHREAD_CANCEL_ENABLE) 
     && (state != PTHREAD_CANCEL_DISABLE))) {
      errno = EINVAL;
      return EINVAL;
   }
   if (self == (void *)-1) {
      // main thread is not cancellable!
      *oldstate = PTHREAD_CANCEL_DISABLE;
   }
   else {
      *oldstate = self->cancelstate;
      self->cancelstate = state;
   }
   return 0;
}

// terminate a thread (or ourself!)
int pthread_cancel(pthread_t thread) {
   if ((thread == NULL) || (thread == (void *)-1)) {
      errno = EINVAL;
      return EINVAL;
   }
   else if (thread->cancelstate != PTHREAD_CANCEL_ENABLE) {
      errno = EBUSY;
      return EBUSY; // what to return ???
   }
   // Note that a tid of -1 is special (it is the main thread,
   // which is not a pthread and so cannot be cancelled with
   // this function)
   if (thread == (pthread_t)-1) {
      errno = ESRCH;
      return ESRCH;
   }
   else {
      _thread_stop(thread->thread);
      // note that if we return here, it means we were not cancelling
      // ourself! In that case, we can free the stack allocated, and 
      // what is pointed to by the thread id, which is actually a 
      // pthread_attr_t. The exception is when the thread is marked as 
      // not reclaimable, which indicates that the stack was not 
      // automatically allocated, and should not be automatically 
      // freed. 
      if (thread->reclaimable) {
         free(thread->stackaddr);
      }
      // free the space allocated for the thread
      free(thread);
      return 0;
   }
}

