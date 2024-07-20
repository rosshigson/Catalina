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

int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock ) {
   register struct _pthread_node *my_node = NULL;

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);

   my_node = malloc(sizeof(struct _pthread_node));
   if (my_node == NULL) {
      errno = EAGAIN;
      return EAGAIN;
   }
   my_node->self = pthread_self();
   my_node->next = NULL;
   // get the rwlock mutex
   _thread_lockset(_Pthread_Pool, rwlock->lock);
   // add ourselves to the rwlock readers list
   my_node->next = rwlock->readers;
   rwlock->readers = my_node;
   _thread_lockclr(_Pthread_Pool, rwlock->lock);
   // now wait until there are no writers 
   // either writing or waiting
   while (1) {
      _thread_lockset(_Pthread_Pool, rwlock->lock);
      if  ((rwlock->writing_count == 0) 
      &&   (rwlock->writers == NULL)) {
         break;
      }
      else {
         _thread_lockclr(_Pthread_Pool, rwlock->lock);
         _thread_yield();
      }
   }
   // we can proceed - increment reader count
   rwlock->reading_count++;
   _thread_lockclr(_Pthread_Pool, rwlock->lock);
   return 0;
}

int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock ) {
   register struct _pthread_node *my_node = NULL;
   register void *self = NULL;

   if (rwlock == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   
   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&rwlock->lock);

   my_node = malloc(sizeof(struct _pthread_node));
   if (my_node == NULL) {
      errno = EAGAIN;
      return EAGAIN;
   }
   self = pthread_self();
   my_node->self = self;
   // get the rwlock mutex
   _thread_lockset(_Pthread_Pool, rwlock->lock);
   // add ourselves to the rwlock writers list
   my_node->next = rwlock->writers;
   rwlock->writers = my_node;
   _thread_lockclr(_Pthread_Pool, rwlock->lock);
   // now wait until there are no readers reading
   // or writers writing
   while (1) {
      _thread_lockset(_Pthread_Pool, rwlock->lock);
      if  ((rwlock->reading_count == 0) 
      &&   (rwlock->writing_count == 0)) {
         break;
      }
      else {
         _thread_lockclr(_Pthread_Pool, rwlock->lock);
         _thread_yield();
      }
      pthread_sleep(1);
   }
   // we can proceed, so increment the writing count
   rwlock->writing_count++;
   _thread_lockclr(_Pthread_Pool, rwlock->lock);
   return 0;
}

int pthread_rwlock_unlock (pthread_rwlock_t *rwlock) {
   register struct _pthread_node *prev_node;
   register struct _pthread_node *curr_node;
   register void *self;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   if ((rwlock == NULL) || (rwlock->lock <= 0)) {
      errno = EINVAL;
      return EINVAL;
   }

   self = pthread_self();
   // get the rwlock mutex
   _thread_lockset(_Pthread_Pool, rwlock->lock);
   // see if we are on the rwlock writers list
   prev_node = NULL;
   curr_node = rwlock->writers;
   while ((curr_node != NULL) 
   &&     (curr_node->next != NULL) 
   &&     (curr_node->self != self)) {
      prev_node = curr_node;
      curr_node = curr_node->next;
   }
   if ((curr_node != NULL) && (curr_node->self == self)) {
      // we found ourselves on the writers list
      // so remove ourselves
      if (prev_node == NULL) {
         rwlock->writers = curr_node->next;
      }
      else {
         prev_node->next = curr_node->next;
      }
      free(curr_node);
      // decrement the writer count
      rwlock->writing_count--;
      _thread_lockclr(_Pthread_Pool, rwlock->lock);
      return 0;
   }
   // see if we are on the rwlock readers list
   prev_node = NULL;
   curr_node = rwlock->readers;
   while ((curr_node != NULL) 
   &&     (curr_node->next != NULL) 
   &&     (curr_node->self != self)) {
      prev_node = curr_node;
      curr_node = curr_node->next;
   }
   if ((curr_node != NULL) && (curr_node->self == self)) {
      // we found ourselves on the readers list
      // so remove ourselves
      if (prev_node == NULL) {
         rwlock->readers = curr_node->next;
      }
      else {
         prev_node->next = curr_node->next;
      }
      free(curr_node);
      // decrement the reader count
      rwlock->reading_count--;
      _thread_lockclr(_Pthread_Pool, rwlock->lock);
      return 0;
   }
   // we were not on either the readers or writers list
   _thread_lockclr(_Pthread_Pool, rwlock->lock);
   errno = EINVAL;
   return EINVAL;
}

