#include <pthread.h>
#include <stdlib.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

extern char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

extern void _pthread_init_lock_pool(int *lock);

int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock) {
   register struct _pthread_node *my_node = NULL;

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   
   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);

   // get the rwlock mutex
   _thread_lockset(_Pthread_Pool, rwlock->lock);
   // now see if there are any writers 
   // either writing or waiting
   if  ((rwlock->writing_count == 0) 
   &&   (rwlock->writers == NULL)) {
      // no writers either writing or waiting, so
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
      // writers writing or waiting - return busy
      _thread_lockclr(_Pthread_Pool, rwlock->lock);
      errno = EBUSY;
      return EBUSY;
   }
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *rwlock) {
   register struct _pthread_node *my_node = NULL;

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   
   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);

   // get the rwlock mutex
   _thread_lockset(_Pthread_Pool, rwlock->lock);
   // we have the lock if there are no readers reading
   // or writiers writing
   if  ((rwlock->reading_count == 0) 
   &&   (rwlock->writing_count == 0)) {
      // no writers writing or readers reading, so
      // add ourselves to the rwlock writers list
      my_node = malloc(sizeof(struct _pthread_node));
      if (my_node == NULL) {
         _thread_lockclr(_Pthread_Pool, rwlock->lock);
         errno = EAGAIN;
         return EAGAIN;
      }
      my_node->self = pthread_self();
      my_node->next = NULL;
      my_node->next = rwlock->writers;
      rwlock->writers = my_node;
      // increment the writers lock and return ok
      rwlock->writing_count++;
      _thread_lockclr(_Pthread_Pool, rwlock->lock);
      return 0;
   }
   else {
      // readers reading or writers writing - return busy
      _thread_lockclr(_Pthread_Pool, rwlock->lock);
      errno = EBUSY;
      return EBUSY;
   }
}


