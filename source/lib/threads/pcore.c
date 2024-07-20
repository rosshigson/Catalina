#include <pthread.h>
#include <stdlib.h>
#include <limits.h>
#include <hmi.h>
#include <thutil.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

/*
 * a lock to protect our kernels (-1 if not yet initialized!)
 * NOTE: This is a propeller lock, not a thread lock!
 */
static int Kernel_lock = -1;

/*
 * A lock to use to protect our lock pool (-1 if not yet initialized!)
 * NOTE: This is a propeller lock, not a thread lock!
 */
static int Pthread_Lock = -1;

/*
 * A thread lock to use to protect pthread_printf (-1 if not yet initialized!)
 */
static int Printf_Lock = -1;

/*
 * A thread lock to use to protect pthread_once (-1 if not yet initialized!)
 */
static int Once_Lock = -1;

/*
 * concurrency is not used, but is required to be remembered
 */
static int concurrency = 0;

/*
 * a pool of shared thread locks (+2 for Printf_Lock and Once_Lock)
 */
char _Pthread_Pool[MIN_THREAD_POOL_SIZE + _NUM_LOCKS + 2]; 

/*
 * ensure a lock has been allocated
 */
static void _ensure_lock(int *lock) {

   if (*lock <= 0) {
      *lock = _thread_locknew(_Pthread_Pool);
   }
}

/*
 * initialize the thread lock, the lock pool, and the Once_Lock if they
 * have not been initialized already, and then (optionally) ensure the 
 * specified thread lock has been allocated, or allocate it if it has not. 
 *
 * Note that doing the initialization this way is ok for multi-threaded
 * programs (since the main function must execute at least one thread 
 * function to get the other threads running, but is not guaranteed to 
 * work for multi-cog programs, which should always manually set the 
 * same thread lock in each kernel as the first thing they do. If they
 * do that, this code will work correctly in that case as well.
 */
void _pthread_init_lock_pool(int *lock) {

   if (Kernel_lock == -1) {
      Kernel_lock = _locknew();
      _thread_set_lock(Kernel_lock);
   }

   _thread_stall();
   // if we have not initialized the lock pool, do it now ...
   if (Pthread_Lock == -1) {
      Pthread_Lock = _locknew();
      _thread_init_lock_pool(_Pthread_Pool, _NUM_LOCKS + 2, Pthread_Lock);
   }   

   // ensure we have a Printf_Lock
   _ensure_lock(&Printf_Lock);

   // ensure we have a Once_Lock
   _ensure_lock(&Once_Lock);

   // if a  non-NULL lock pointer is specified, ensure one is allocated
   if (lock != NULL) {
      _ensure_lock(lock);
   }
   _thread_allow();
}

// pthread_yield is not standard, but many pthread implementations have it.
void pthread_yield(void) {
   _thread_yield();
}

// pthread_sleep, pthread_msleep and pthread_usleep are not standard, 
// but are useful replacement for sleep(), msleep() and usleep() when
// using threads.
void pthread_sleep(int secs) {
   _thread_wait(1000*secs);
}

void pthread_msleep(int msecs) {
   _thread_wait(msecs);
}

void pthread_usleep(int usecs) {
   _thread_wait(usecs/1000);
}

// pthread_printf is a drop-in replacement for printf that will not
// garble its output even when called from multiple threads
int pthread_printf(const char *_format, ...) {
  
   va_list ap;
   int retval;

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&Printf_Lock);

   while (_thread_lockset(_Pthread_Pool, Printf_Lock) == 0) {
     _thread_yield();
   }

   va_start (ap, _format);       /* Initialize the argument list. */
   retval = t_vprintf ((char *)_format, ap);
   va_end (ap);                  /* Clean up. */

   _thread_lockclr(_Pthread_Pool, Printf_Lock);

   return retval;
}

// pthread_printf_ln is similar to pthread_printf but it adds a new line to
// its output so it can be used as a replacement for Lua's print function.
int pthread_printf_ln(const char *_format, ...) {
   va_list ap;
   int retval;

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&Printf_Lock);

   while (_thread_lockset(_Pthread_Pool, Printf_Lock) == 0) {
     _thread_yield();
   }

   va_start (ap, _format);       /* Initialize the argument list. */
   retval = t_vprintf ((char *)_format, ap);
   va_end (ap);                  /* Clean up. */
   t_printf("\n");               /* print new line */

   _thread_lockclr(_Pthread_Pool, Printf_Lock);

   return retval;
}

// debugging only - check the kernel and pthread locks and test the print lock
void pthread_lock_check() {
   t_printf("KERNEL LOCK is %d\n", _thread_get_lock());
   if (Pthread_Lock < 0) {
      t_printf("NO PTHREAD LOCK!\n");
   }
   else {
      t_printf("PTHREAD LOCK is %d\n", Pthread_Lock);
      if (Printf_Lock < 0) {
         t_printf("NO PRINTF LOCK!\n");
      }
      else {
         t_printf("PRINTF LOCK is %d\n", Printf_Lock);
         if (_thread_lockset(_Pthread_Pool, Printf_Lock) == 0) {
            t_printf("PRINTF LOCK FAILED!\n");
         }
         _thread_lockclr(_Pthread_Pool, Printf_Lock);
      }
   }
}

// return a pointer to our own pthread block
pthread_t pthread_self(void) {
   return (pthread_t)_thread_extended(_thread_id());
}

// compare if two pthread types refer to the same thread
int pthread_equal(pthread_t tid1, pthread_t tid2) {
   return (tid1 == tid2);
}

typedef void *(*pthread_func_t)(void *);

static int dummy_function(int argc, char *argv[]) {
    // our first argument is the pthread function, which 
    // expects one void *argument - so we provide it our 
    // second argv argument. Our first argv value is
    // our pthread attribute block address, which we store
    // as an extended attribute. Our second argv value
    // is the argument intended for the pthread function
    pthread_func_t func;
    pthread_t self;
    int result;

    func = (pthread_func_t)argc;
    // set up our extended attribute (which is the
    // address of our pthread attribute block)
    _thread_set_extended(_thread_id(), argv[0]);
    // call the pthread function with its argument
    result = (int)func(argv[1]);
    // in case the function just exits without explicitly calling 
    // pthread_exit, but is joinable, we must call pthread_exit
    self = pthread_self();
    if (self->detachstate == PTHREAD_CREATE_JOINABLE) {
       pthread_exit((void *)result);
    }
    return result;
}

int pthread_create(pthread_t *tid, 
                   const pthread_attr_t *attr, 
                   void *(*start_routine)(void *), 
                   void *arg) {
   register pthread_attr_t *new_thread;

   // ensure the lock pool has been initialized ...
   _pthread_init_lock_pool(NULL);

   _thread_stall();
   new_thread = malloc(sizeof(pthread_attr_t));
   _thread_allow();
   if (new_thread != NULL) {
      if (attr == NULL) {
         pthread_attr_init(new_thread);
      }
      else {
         pthread_attr_copy(new_thread, attr);
      }
      new_thread->args[0] = (char *)new_thread;
      new_thread->args[1] = (char *)arg;
      if (new_thread->stackaddr == NULL) {
         // we mark the thread as reclaimable to indicate that the 
         // stack space will be freed when the thread is joined or
         // cancelled
         new_thread->reclaimable = 1;
         _thread_stall();
         new_thread->stackaddr 
           = malloc(new_thread->stacksize + new_thread->guardsize);
         _thread_allow();
      }
      else {
         // mark this thread as not reclaimable, to indicate the 
         // stack space should NOT be freed when the thread is 
         // joined or cancelled
         new_thread->reclaimable = 0;
      }
      if (new_thread->stackaddr != NULL) {
         new_thread->thread = _thread_start(
             &dummy_function, 
             (char *)new_thread->stackaddr + new_thread->stacksize, 
             (int)start_routine, 
             new_thread->args
         );
         *tid = (pthread_t)new_thread;
         if (*tid == NULL) {
            errno = EAGAIN;
            return EAGAIN;
         }
         else {
            new_thread->affinity = _cogid();
            _thread_ticks(*tid, new_thread->priority);
            return 0;
         }
      }
      _thread_stall();
      free(new_thread);
      _thread_allow();
   }
   errno = EAGAIN;
   return EAGAIN;
}

// this function is the first (and possibly only) 
// C code to run on a newly created affinity. This
// function should be kept simple so it does not
// need much stack space allocated.
static int foreman(int argc, char *argv[]) {
   // the kernel lock will have been initialized (in create_affinity, if
   // not before) for the initial kernel, but we have to set it manually 
   // in each new kernel
   _thread_set_lock(Kernel_lock);
   while (1) {
      _thread_wait(100);
   }
   return 0;
}

// create a new affinity (if possible)
// On Catalina, this creates a new multi-threaded kernel cog. 
// The addr and size represent whatever space an affinity requires, which
// on Catalina represents a stack - but this stack is only used by the 
// default initial process (i.e not by subsequent threads moved to this cog
// via pthread_setaffinity) so it need not be very large.
// NOTE: addr must be long aligned, and
//       size must be a multple of 4
int pthread_createaffinity(void *addr, size_t size, affinity_t *affinity) {

  // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(NULL);

   if ((addr == NULL) || (affinity == NULL)) {
      errno = EINVAL;
      return EINVAL;
   } 
   *affinity = _thread_cog(&foreman, 
                           (unsigned long *)((char *)addr + size), 
                           0, 
                           NULL);
   _thread_yield(); // give foreman a chance to execute
   if (*affinity >= 0) {
      return 0;
   }
   else {
      errno = EAGAIN;
      return EAGAIN;
   }
}

// set the affinity of a thread (if possible)
int pthread_setaffinity(pthread_t thread, const affinity_t affinity) {
   register int newcog = affinity;
   if ((thread == NULL) 
   ||  (affinity < 0) 
   ||  (affinity >= ANY_COG)) {
      errno = EINVAL;
      return EINVAL;
   }
   if (newcog != thread->affinity) {
      if (_thread_affinity_change(thread->thread, newcog) != 0) {
         thread->affinity = newcog;
         return 0;
      }
      else {
         errno = EAGAIN;
         return EAGAIN;
      } 
   }
   return 0;
}

// return the affinity of a thread
int pthread_getaffinity(pthread_t thread, int *affinity) {
   if ((thread == NULL) || (affinity == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   else {
      *affinity = thread->affinity;
   }
   return 0;
}


int pthread_once(pthread_once_t *once_control, 
                 void (*init_routine)(void)) {

   // ensure the lock pool has been initialized, and 
   // that a lock has been allocated ...
   _pthread_init_lock_pool(&Once_Lock);

   _thread_lockset(_Pthread_Pool, Once_Lock);
   if (once_control == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   if (!*once_control) {
      *once_control = 1;
      init_routine();
   }
   _thread_lockclr(_Pthread_Pool, Once_Lock);
   return 0;
}

int pthread_detach(pthread_t tid) {
   if (tid == NULL) {
      errno = EINVAL;
      return EINVAL;
   }
   tid->detachstate = PTHREAD_CREATE_DETACHED;
   return 0;
}

int pthread_setconcurrency(int new_level) {
   concurrency = new_level;
   return 0;
}

int pthread_getconcurrency(void) {
   return concurrency;
}

int pthread_getcpuclockid(pthread_t thread, clockid_t *clock_id) {
   if ((thread == NULL) || (clock_id == NULL)) {
      errno = EINVAL;
      return EINVAL;
   }
   errno = ENOENT;
   return ENOENT;
}

