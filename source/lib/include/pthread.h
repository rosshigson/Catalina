#ifndef _PTHREAD_H_
#define _PTHREAD_H_

#include <threads.h>
#include <errno.h>
#include <time.h>
#include <rtc.h>

/*
 * Catalina allocates a fixed number of thread locks that all pthreads and
 * functions share. Catalina also has a default stack size for allocating
 * pthread stacks, but the default can be overridden using a pthread_attr_t 
 * and either just specifying another stack size, or using a static stack, 
 * or by manually allocating the stack before creating the pthread. 
 *
 * The number of thread locks cannot be overridden at run time. If these 
 * numbers need to be changed then the Catalina library will have to be 
 * recompiled.
 */
#ifdef __CATALINA_P2
#define _NUM_LOCKS  1000 // maxmium thread locks shared by all pthreads on P2
#define _STACK_SIZE 1000 // default stack size of pthread in longs on P2
#else
#define _NUM_LOCKS   100 // maxmium thread locks shared by all pthreads on P1
#define _STACK_SIZE  120 // default stack size of pthread in longs on P1
#endif

/*
 * Posix clock definitions
 * =======================
 *
 * On Posix systems, these are defined in <time.h>. But the ANSI C
 * time.h header does not include them, so we define them here, plus
 * some useful support functions (e.g. to add and subtract timespecs)
 *
 * Catalina supports two clocks - the WALLCLOCK clock has a resolution of 
 * seconds and its value is settable, and the REALTIME clock has a 
 * resolution of milliseconds but its value is not settable. The C
 * functions time() and clock() correspond to these two clocks.
 */

#define CLOCK_REALTIME           0 // 1ms resolution clock (not settable)
#define CLOCK_PROCESS_CPUTIME_ID 1 // same as above
#define CLOCK_THREAD_CPUTIME_ID  2 // same as above
#define CLOCK_MONOTONIC          3 // same as above 
#define CLOCK_WALLCLOCK          4 // 1s resolution wall clock (settable)
#define TIMER_ABSTIME            1 // flag used in nanosleep & clock_nanosleep

/*
 * Posix clock public types
 * ========================
 */

typedef void *pid_t;

typedef int clockid_t;

struct timespec {
	time_t     tv_sec;            /* seconds */
	long       tv_nsec;           /* nanoseconds */
};


/*
 * standard Posix clock functions
 * ==============================
 */

int   clock_getcpuclockid(pid_t pid, clockid_t *clk_id);

int   clock_getres(clockid_t clk_id, struct timespec *res);

int   clock_gettime(clockid_t clk_id, struct timespec *tp);

int   clock_settime(clockid_t clk_id, const struct timespec *tp);

int   clock_nanosleep(clockid_t clk_id, int flags, 
                      const struct timespec *request,
                      struct timespec *remain);

int   nanosleep(const struct timespec *request, 
                struct timespec *remain);

/*
 * non-standard Posix clock functions
 * ==================================
 */

// make sure timespec.tv_nsec is less than 1000000000, 
// and adjust tv_sec as necessary
void  clock_normalize(struct timespec *t);

// compare two timespecs, 
// return -1 if t1<t2, 0 if t1==t2, 1 if t1>t2
int   clock_compare(const struct timespec *t1, const struct timespec *t2);

// subtract timespec t2 from t1 (and normalize t1)
void  clock_sub(struct timespec *t1, const struct timespec *t2);

// add timesec t2 to t1 (and normalize t1)
void  clock_add(struct timespec *t1, const struct timespec *t2);

/*
 * standard Posix scheduling types
 * ===============================
 *
 * On Posix systems, these are defined in <sched.h>, but ANSI C does not 
 * have that include file, so we define them here. Note that sched_priority 
 * is just the Catalina thread tick count for the underlying thread.
 */

#define SCHED_OTHER 0
#define SCHED_FIFO  1
#define SCHED_RR    2

struct sched_param {
   int sched_priority;
};

/*
 * standard Posix pthread definitions:
 * ===================================
 */

#define PTHREAD_MUTEX_INITIALIZER     { 0, 0, 0, 0 }
#define PTHREAD_COND_INITIALIZER      { 0, NULL }
#define PTHREAD_RWLOCK_INITIALIZER    { 0, 0, 0, NULL, NULL }
#define PTHREAD_ONCE_INIT             0

#define PTHREAD_MUTEX_NORMAL          0
#define PTHREAD_MUTEX_ERRORCHECK      1
#define PTHREAD_MUTEX_RECURSIVE       2
#define PTHREAD_MUTEX_DEFAULT         PTHREAD_MUTEX_NORMAL

#define PTHREAD_MUTEX_ROBUST          0
#define PTHREAD_MUTEX_STALLED         1

#define PTHREAD_BARRIER_SERIAL_THREAD 1 // must not be zero!

#define PTHREAD_CANCEL_ENABLE         0
#define PTHREAD_CANCEL_DISABLE        1
#define PTHREAD_CREATE_JOINABLE       0
#define PTHREAD_CREATE_DETACHED       1
#define PTHREAD_PROCESS_SHARED        0
#define PTHREAD_PROCESS_PRIVATE       1
#define PTHREAD_SCOPE_PROCESS         0
#define PTHREAD_SCOPE_SYSTEM          1

#ifndef EDEADLK
#define EDEADLK                       45 // see errno.h
#endif

#ifndef ETIMEDOUT
#define ETIMEDOUT                     60 // see errno.h
#endif

/*
 * non-standard pthread private types
 * ==================================
 */

struct _pthread_node {
   int     signal;
   void   *self;
   struct  _pthread_node *next;
};

/*
 * standard Posix pthread public types
 * ===================================
 */

typedef struct pthread_mutexattr_t {
   int  type;
} pthread_mutexattr_t;

typedef int pthread_spinlock_t;

typedef struct pthread_condattr_t {
   clockid_t  clk_id;
} pthread_condattr_t;

typedef int pthread_barrierattr_t;

typedef int pthread_rwlockattr_t;

typedef int pthread_once_t;

typedef struct pthread_attr_t {
   void     *thread;
   void     *stackaddr;
   unsigned  stacksize; // NOTE: all stacksizes are specified in bytes
   unsigned  guardsize;
   char     *args[2];
   int       affinity;
   int       priority;
   int       detachstate;
   int       cancelstate;
   int       reclaimable;
} pthread_attr_t;

typedef pthread_attr_t  *pthread_t;

typedef struct pthread_cond_t {
   clockid_t clk_id;
   struct _pthread_node  *waiting;
} pthread_cond_t;

typedef struct pthread_barrier_t {
   pthread_spinlock_t  lock;
   unsigned  required_count;
   unsigned  waiting_count;
   unsigned  signal;
   struct _pthread_node  *waiting;
} pthread_barrier_t;

typedef struct pthread_rwlock_t {
   pthread_spinlock_t  lock;
   int  writing_count;
   int  reading_count;
   struct _pthread_node  *readers;
   struct _pthread_node  *writers;
} pthread_rwlock_t;

typedef struct pthread_mutex_t {
   int  type;
   pthread_t  owner;
   unsigned int  count;
   pthread_spinlock_t  lock;
} pthread_mutex_t;

/*
 * non-standard Posix pthread public types
 * =======================================
 */
typedef int affinity_t;

/*
 * standard Posix pthread functions
 * ================================
 *
 * Note that descriptive information is only given where additional
 * information is required about Catalina's implementation - otherwise
 * refer to any Posix pthreads documentaton
 *
 */


/* pthread functions */


// pthread_self returns a pointer to the attribute block
// of the calling pthread. The main function has a thread
// block but no pthread attribute block and returns -1 instead
pthread_t pthread_self(void);

// pthread_equal returns true if the two
// pthread ids refer to the same pthread
int pthread_equal(pthread_t tid1, pthread_t tid2);

// start a new pthread
int pthread_create(pthread_t *tid,
                   const pthread_attr_t *attr,
                   void *(*start_routine)(void *),
                   void *arg);

// wait for a pthread to exit, then return it's result
int pthread_join(pthread_t tid, void **status);

// exit a pthread, and return a status (which can be 
// retrieved using pthread_join) 
void pthread_exit(void *status);

// terminate a pthread (or ourself!) if cancellation is enabled.
// Note that cancelling a pthread is NOT recommended, and cancelling
// ourselves is HIGHLY not recommended - for one thing the storage
// space allocated will never be reclaimed if we cancel ourselves. 
int pthread_cancel(pthread_t thread);

// set a pthread as detached, which indicates it will never be
// joined. Note that this also prevents the storage space from
// being reclaimed by the pthread system, so this should only 
// be used for pthreads with statically allocated stacks, or 
// where the application is managing memory allocation itself.
int pthread_detach(pthread_t tid);

// concurrency is not used, but its setting is remembered
int pthread_setconcurrency(int new_level);

int pthread_getconcurrency(void);

// sched_param can be used to set the thread ticks
int pthread_setschedparam(pthread_t thread,
                          int policy,
                          const struct sched_param *param);

pthread_getschedparam(pthread_t thread, 
                      int *policy,
                      struct sched_param *param);

// enable or disable cancellation
int pthread_setcancelstate(int state, int *oldstate);

// returns ENOENT since individual clocks per pthread are not supported
// (i.e. the supported clocks are the same for all pthreads)
int pthread_getcpuclockid(pthread_t thread, clockid_t *clockid);

// set up a function that will only ever be executed
// once no matter how many times pthreads call it
int pthread_once(pthread_once_t *once_control, 
                 void (*init_routine)(void));


/* pthread attribute functions */


int pthread_attr_init(pthread_attr_t *attr);

int pthread_attr_destroy(pthread_attr_t *attr);

// set the stack address manually - this is useful if 
// the stack has been statically allocated, or the
// application wants to manage memory itself. Manually
// specified stacks will not be "freed" by the pthread
// system. 
// NOTE: all stack sizes are specified in bytes, but 
//       stack addresses must be long aligned, and all 
//       stack sizes must be a multiple of 4!
int pthread_attr_setstack(pthread_attr_t *attr,
                          void *stackaddr, size_t stacksize);

int pthread_attr_getstack(pthread_attr_t *attr,
                         void **stackaddr, size_t *stacksize);

int pthread_attr_setstacksize(pthread_attr_t *attr, size_t size);

int pthread_attr_getstacksize(pthread_attr_t *attr, size_t *size);

// any specified guard size is simply added to the stack size
int pthread_attr_setguardsize(pthread_attr_t *attr, size_t guardsize);

int pthread_attr_getguardsize(const pthread_attr_t *attr,
                              size_t *guardsize);

// detached state is used to indicate whether the pthread is
// "joinable". In Posix, detached state is also used to indicate 
// that the storage space used by the pthread can be reclaimed
// when the pthread terminates, but Catalina does not do this. 
// This is why detached state should only be set on pthreads 
// started with statically allocated stacks, or when the 
// application is managing the memory allocation itself. 
int pthread_attr_setdetachstate(pthread_attr_t *attr, int detachstate);

int pthread_attr_getdetachstate(const pthread_attr_t *attr, int *detachstate);

// scope is not used, PTHREAD_SCOPE_SYSTEM is always returned
int pthread_attr_setscope(pthread_attr_t *attr,int scope);

int pthread_attr_getscope(pthread_attr_t *attr, int *scope);

// policy is not used, SCHED_OTHER is always returned
int pthread_attr_setschedpolicy(pthread_attr_t *attr, int policy);

int pthread_attr_getschedpolicy(pthread_attr_t *attr,
                                int *policy);

// sched_priority refers to the thread's tick count - 100 is the
// default, and a higher value means the thread gets more processor
// time relative to all other threads. Lower values means less time.
int pthread_attr_setschedparam(pthread_attr_t *attr,
                               const struct sched_param *param);

int pthread_attr_getschedparam(pthread_attr_t *attr,
                               struct sched_param *param);


/* mutex functions */


int pthread_mutex_lock(pthread_mutex_t *mutex);

int pthread_mutex_unlock(pthread_mutex_t *mutex);

int pthread_mutex_trylock(pthread_mutex_t *mutex);

int pthread_mutex_init(pthread_mutex_t *mutex,
                       const pthread_mutexattr_t *attr);

int pthread_mutex_destroy(pthread_mutex_t *mutex);

int pthread_mutex_consistent(pthread_mutex_t *mutex);

// timed functions require the CLOCK plugin to work correctly
int pthread_mutex_timedlock(pthread_mutex_t *mutex,
                            const struct timespec *abstime);


/* mutex attribute functions */

int pthread_mutexattr_init(pthread_mutexattr_t *attr);

int pthread_mutexattr_destroy(pthread_mutexattr_t *attr);

int pthread_mutexattr_gettype(const pthread_mutexattr_t *attr, int *type);

int pthread_mutexattr_settype(pthread_mutexattr_t *attr, int type);

// shared is not used, PTHREAD_PROCESS_SHARED is always returned
int pthread_mutexattr_setpshared(pthread_mutexattr_t *attr,
                                 int *pshared);

int pthread_mutexattr_getpshared(pthread_mutexattr_t *attr,
                                 int *pshared);

// robustness is not used, PTHREAD_MUTEX_STALLED is always returned
int pthread_mutexattr_getrobust(const pthread_mutexattr_t *attr, int *robustness);

int pthread_mutexattr_setrobust(pthread_mutexattr_t *attr, int *robustness);


/* condition variable functions */


int pthread_cond_init(pthread_cond_t *cond,
                      const pthread_condattr_t *attr);

int pthread_cond_destroy(pthread_cond_t *cond);

int pthread_cond_wait(pthread_cond_t *cond,
                      pthread_mutex_t *mutex);

int pthread_cond_signal(pthread_cond_t *cond);

int pthread_cond_broadcast(pthread_cond_t *cond);

// timed functions require the CLOCK plugin to work correctly
int pthread_cond_timedwait(pthread_cond_t *cond,
                           pthread_mutex_t *mutex,
                           const struct timespec *abstime);


/* condition variable attribute functions */


int pthread_condattr_init(pthread_condattr_t *attr);

int pthread_condattr_destroy(pthread_condattr_t *attr);

// shared is not used, PTHREAD_PROCESS_SHARED is always returned
int pthread_condattr_setpshared(pthread_condattr_t *attr, 
                                int *pshared);

int pthread_condattr_getpshared(const pthread_condattr_t *attr,
                                int *pshared);

// there are two clocks - the WALLCLOCK clock has a resolution of
// seconds, and the REALTIME clock has a resolution of milliseconds
int pthread_condattr_setclock(pthread_condattr_t *attr,
                              clockid_t clk_id);

int pthread_condattr_getclock(const pthread_condattr_t *attr,
                              clockid_t *clk_id);


/* barrier functions */


int pthread_barrier_init(pthread_barrier_t *barrier,
                         const pthread_barrierattr_t *attr,
                         unsigned count);

int pthread_barrier_destroy(pthread_barrier_t *barrier);

int pthread_barrier_wait(pthread_barrier_t *barrier);


/* barrier attribute functions */


int pthread_barrierattr_init(pthread_barrierattr_t *attr);

int pthread_barrierattr_destroy(pthread_barrierattr_t *attr);

// shared is not used, PTHREAD_PROCESS_SHARED is always returned
int pthread_barrierattr_getpshared(const pthread_barrierattr_t *attr,
                                   int *pshared);

int pthread_barrierattr_setpshared(pthread_barrierattr_t *attr, 
                                   int *pshared);


/* spin lock functions */


int pthread_spin_init(pthread_spinlock_t *lock, int pshared);

int pthread_spin_lock(pthread_spinlock_t *lock);

int pthread_spin_trylock(pthread_spinlock_t *lock);

int pthread_spin_unlock(pthread_spinlock_t *lock);

int pthread_spin_destroy(pthread_spinlock_t *lock);



/* read/write lock functions */


int pthread_rwlock_init(pthread_rwlock_t *rwlock,
                        const pthread_rwlockattr_t *attr);

int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);

int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock );

int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock);

int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock );

int pthread_rwlock_trywrlock(pthread_rwlock_t *rwlock);

int pthread_rwlock_unlock (pthread_rwlock_t *rwlock);

// timed functions require the CLOCK plugin to work correctly
int pthread_rwlock_timedrdlock(pthread_rwlock_t *rwlock,
                               const struct timespec *abstime);

// timed functions require the CLOCK plugin to work correctly
int pthread_rwlock_timedwrlock(pthread_rwlock_t *rwlock,
                               const struct timespec *abstime);


/* read/write lock attribute functions */


int pthread_rwlockattr_init(pthread_rwlockattr_t *attr);

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *attr);

// shared is not used, PTHREAD_PROCESS_SHARED is always returned
int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *attr, 
                                  int *pshared);

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *attr,
                                  int *pshared);


/*
 * non-standard Posix pthread functions
 * ====================================
 */

// pthread_yield is not standard, but many pthread implementations have it.
// For Catalina, it is the same as _thread_yield()
void pthread_yield(void);

// pthread_sleep, pthread_msleep and pthread_usleep are not standard, 
// but are useful replacement for sleep(), msleep() and usleep() when
// using multi-threading. You can call pthread_sleep directly, or you 
// can specify -D"sleep=pthread_sleep" on the Catalina command-line 
// to use (for example) pthread_sleep in place of all calls to sleep.
void pthread_sleep(int secs);

void pthread_msleep(int msecs);

void pthread_usleep(int usecs);

// pthread_printf is a drop-in replacement for printf that uses a lock
// to prevent garbled output. It can be called directly, or you can
// specify -D"printf=pthread_printf" on the Catalina command-line to
// use it in place of all calls to printf.
int pthread_printf(const char *_format, ...);

// create a new affinity (if possible)
// On Catalina, this creates a new multi-threaded kernel cog. 
// The addr and size represent whatever space an affinity requires, which
// on Catalina represents a stack - but this stack is only used by the 
// default initial process (i.e not by subsequent threads moved to this cog
// via pthread_setaffinity) so it need not be very large.
// NOTE: addr must be long aligned, and
//       size must be a multple of 4
int pthread_createaffinity(void *addr, size_t size, affinity_t *affinity);

// set the affinity of a thread (if possible)
// On Catalina, this moves the thread to the specified cog.
int pthread_setaffinity(pthread_t thread, const affinity_t affinity);

// return the affinity of a thread
// n Catalina, this returns the cog on which the thread is running.
int pthread_getaffinity(pthread_t thread, affinity_t *affinity);


/*
 *
 * Posix pthread implementation summary
 * ====================================
 */

/*
 
   Posix pthread functions implemented using Catalina threads:


      pthread_spin_init
      pthread_spin_destroy
      pthread_spin_lock
      pthread_spin_unlock

      pthread_mutextattr_init
      pthread_mutexattr_destroy
      pthread_mutexattr_settype
      pthread_mutexattr_gettype

      pthread_mutex_init
      pthread_mutex_destroy
      pthread_mutex_lock
      pthread_mutex_timedlock

      pthread_rwlockattr_init
      pthread_rwlockattr_destroy

      pthread_rwlock_init
      pthread_rwlock_destroy
      pthread_rwlock_rdlock
      pthread_rwlock_trywrlock
      pthread_rwlock_unlock
      pthread_rwlock_timedrdlock
      pthread_rwlock_timedwrlock

      pthread_attr_init
      pthread_attr_destroy
      pthread_attr_getstack
      pthread_attr_getstacksize
      pthread_attr_setguardsize
      pthread_attr_getguardsize
      pthread_attr_getdetachstate
      pthread_attr_setdetachstate
      pthread_attr_setscope
      pthread_attr_getscope
      pthread_attr_setschedparam
      pthread_attr_getschedparam
      pthread_attr_setschedpolicy
      pthread_attr_getschedpolicy

      pthread_barrierattr_init
      pthread_barrierattr_destroy

      pthread_barrier_init
      pthread_barrier_destroy
      pthread_barrier_wait

      pthread_condattr_init
      pthread_condattr_setclock
      pthread_condattr_getclock

      pthread_cond_init
      pthread_cond_broadcast
      pthread_cond_destroy
      pthread_cond_timedwait
 
      pthread_create
      pthread_cancel
      pthread_join
      pthread_once
      pthread_detach
      pthread_equal
      pthread_exit
      pthread_self
      pthread_getcpuclockid
      pthread_setschedparam
      pthread_getschedparam
      pthread_setcancelstate


   Posix pthread functions defined for compliance only (i.e. do nothing,
   because a robust program that uses these should generally work with
   these attributes just set to default values):


      pthread_mutex_consistent

      pthread_barrierattr_getpshared
      pthread_barrierattr_setpshared

      pthread_mutexattr_setpshared
      pthread_mutexattr_getpshared

      pthread_mutexattr_getrobust
      pthread_mutexattr_setrobust

      pthread_rwlockattr_getpshared
      pthread_rwlockattr_getpshared

      pthread_setconcurrency
      pthread_getconcurrency

      pthread_condattr_destroy
      pthread_condattr_setpshared
      pthread_condattr_getpshared


   Posix pthread functions not defined or implemented (because a program
   that uses these probably won't work correctly without them, or just
   using default values for the relevant attributes - the reason for the
   use of these functions should be investigated)


      pthread_atfork
      pthread_testcancel
      pthread_setschedprio
      pthread_cleanup_push
      pthread_cleanup_pop
      pthread_setspecific
      pthread_getspecific
      pthread_key_create
      pthread_key_delete

      pthread_attr_setinheritsched
      pthread_attr_getinheritsched

      pthread_mutex_setprioceiling
      pthread_mutex_getprioceiling

      pthread_mutexattr_setprioceiling
      pthread_mutexattr_getprioceiling
      pthread_mutexattr_setprotocol
      pthread_mutexattr_getprotocol

  Non-Posix pthread functions added

      pthread_yield
      pthread_sleep
      pthread_msleep
      pthread_usleep
      pthread_printf
      pthread_createaffinity
      pthread_setaffinity
      pthread_getaffinity


*/

#endif /* _PTHREAD_H_ */


