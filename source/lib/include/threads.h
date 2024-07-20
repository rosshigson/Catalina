#ifndef _THREADS__H
#define _THREADS__H

#include <stdio.h>

#ifndef __CATALINA_libthreads
#error THIS PROGRAM REQUIRES THE MULTI-THREADED CATALINA KERNEL
#endif

#ifdef __CATALINA_NO_INTERRUPTS
#error NO_INTERRUPTS SPECIFIED FOR A PROGRAM THAT REQUIRES INTERRUPTS
#endif

/*
 * define the type of a thread function:
 */
typedef int (* _thread)(int argc, char *argv[]);
/*
 * define the size (in LONGs) of a thread block - the pointer to the thread
 * block is used as a unique id for each thread. The thread block has the 
 * following structure:
 *    NEXT     :  1 * LONG address of next thread block (or this thread block)
 *    REGSAVE  : 32 * LONG space to save/restore registers
 *    AFFINITY :  1 * LONG, split into:
 *                       BIT 31 .. 16 = tick count for this thread
 *                       BIT 15       = thread terminated
 *                       BIT 14       = thread completed
 *                       BIT 13       = affinity stop request
 *                       BIT 10 .. 8  = current cog affinity (i.e. 0 .. 7)
 *                       BIT  7 .. 2  = unused
 *                       BIT  0 .. 1  = used to save flags C & Z flags
 *    EXTENDED : 1 * LONG used for extended attributes of the thread 
 *                   (for pthreads it is a pointer to the pthread attribute
 *                   block. NOTE this value is NOT initialized by Catalina -
 *                   it must be initialized by the application  or library
 *                   functions that use it!)
 */
#define THREAD_BLOCK_SIZE 35
#define THREAD_REG_OFF     1
#define THREAD_AFF_OFF    33
#define THREAD_EXT_OFF    34
/*
 * define the minimum size (in LONGs) of a thread stack - the top of this
 * space is used for the thread block. Then space must be left for the 2 
 * function arguments, then the return address.
 */
#define MIN_THREAD_STACK_SIZE (THREAD_BLOCK_SIZE + 2 + 1)

/*
 * define the minimum size (in BYTEs) of a thread pool - which is 5 bytes
 * plus the number of thread locks required
 */
#define MIN_THREAD_POOL_SIZE (5)

/*
 * _thread_get_lock - get lock allocated for context switching (the lock is 
 *             set to 7 (P1) or 15 (P2) by each multithreading kernel on 
 *             startup - if two multithreading kernels are started, they 
 *             should have their locks set to be the same lock, and any 
 *             lock previously allocated should be released by calling 
 *             _lockclr() on that lock - note that this does not apply to 
 *             the initial lock (i.e. 7 or 15) as it is not actually 
 *             allocated by the kernel - it is just used.
 */
extern int _thread_get_lock();

/*
 * _thread_set_lock - set lock to use for context switching (usually, this 
 *             will be set to a lock allocated by another multithreading 
 *             kernel - make sure to use _get_lock() to retrieve any 
 *             previously allocated lock and then use _lockclr() to 
 *             release it)
 */
extern void _thread_set_lock(int lock);

/*
 * _thread_ticks - update the tick count of a thread 
 *                 (1 tick ~ 100 microseconds)
 */
extern int _thread_ticks(void * thread_id, int ticks);

/*
 * _thread_get_ticks - return the tick count of a thread 
 *                     (1 tick ~ 100 microseconds)
 */
extern int _thread_get_ticks(void * thread_id);
/*
 * _thread_id - return my unique thread id
 */
extern void * _thread_id();

/*
 * _thread_extended - get the extended attribute of a thread 
 */
extern void * _thread_extended(void * thread_id);

/*
 * _thread_set_extended - set the extended attribute of a thread 
 */
extern void * _thread_set_extended(void * thread_id, void * extended);

/*
 * _thread_affinity - return the long containing the current affinity of the 
 *                    thread
 *                    (see above for details).
 */
extern int _thread_affinity(void * thread_id);

/*
 * _thread_affinity_stop - request the current affinity (i.e. the kernel
 *                         executing the thread) to stop the thread.
 */
extern int _thread_affinity_stop(void * thread_id);

/*
 * _thread_affinity_change - request to change current affinity of thread
 *                           (thread currently being executed by this kernel)
 */
extern int _thread_affinity_change(void * thread_id, int affinity);

/*
 * _thread_start - start a new thread (top 36 longs of stack space are used
 *                 as the thread block. The SP must point to the END of 
 *                 at least MIN_THREAD_STACK_SIZE longs of Hub RAM). 
 *                 Returns the thread block on success, or zero on failure.
 */
extern void * _thread_start(_thread PC, void *SP, int argc, char *argv[]);

/*
 * _thread_stop - stop a thread executing
 */
extern void * _thread_stop(void * thread_id);

/*
 * _thread_exit - exit a thread and return a status
 */
extern void * _thread_exit(int status);

/*
 * _thread_join - join (wait for) a thread and get its result
 */
extern void * _thread_join(void * thread_id, int * result);

/*
 * _thread_check - returns non-zero if thread is currently executing
 */
extern void * _thread_check(void * thread_id);

/*
 * _thread_yield - yield to another thread (i.e. give up the cog to the next 
 *                 thread). Note that this is not guaranteed to succed, in 
 *                 which case the current thread will continue executing.
 */
extern void _thread_yield();

/*
 * _thread_init_lock_pool - initialize memory to a pool of locks (note 
 *                          that this should only be called once). The pool 
 *                          must be (size + 5) bytes of Hub RAM, long aligned.
 */
extern int _thread_init_lock_pool (void * pool, int size, int lock);

/*
 * _thread_locknew - allocate a new lock from the specified pool. 
 *                   The lock is guaranteed to be cleared.
 */
extern int _thread_locknew(void * pool);

/*
 * _thread_lockret - return the lock to the specified pool.
 */
extern int _thread_lockret(void * pool, int lockid);

/*
 * _thread_lockclr - clear the lock in the specified pool 
 *                   (return 1 on success, 0 on failure)
 */
extern int _thread_lockclr(void * pool, int lockid);

/*
 * _thread_lockset - set the lock in the specified pool 
 *                   (return 1 on success, 0 on failure)
 */
extern int _thread_lockset(void * pool, int lockid);

/*
 * _thread_wait - thread safe wait function
 */
void _thread_wait(unsigned milliseconds);

/*
 * _thread_stall - stall threading (use with caution!)
 */
void _thread_wait();

/*
 * _thread_allow - allow threading (use only after stalling)
 */
void _thread_allow();

#endif // _THREADS__H
