This directory contains example programs to demonstrate running Catalina
programs using multiple threads.

To build these programs, use the 'build_all' scripts, specifying the
platform and HMI options. For example:

   build_all C3 TTY
or
   build_all HYBRID
or
   build_all TRIBLADEPROP CPU_2 PC VT100
or
   build_all HYDRA COMPACT
or
   build_all P2_EVAL

Note that currently Catalina can only support LMM and CMM programs runnning
multiple threads. XMM support may be added in future, but there is currently
not enough room in the XMM kernel to add the necessary multi-threading.

Note that the multi-threading kernel is based on the "alternate" kernel, so
programs needing floating point will also have to be compiled with -lma 
(or -lmb) if floating point support is required. This also means that if
more than one thread needs to use floating point, then the floating point 
operations will have to be protected with a lock, in the same way that HMI 
calls are protected in the demo programs.


Introduction to Threads
=======================

A thread is simply a C function with a prototype that looks like a C "main"
function - i.e:

   int function(int argc, char *argv[]);

When the thread is started, the argc and argv parameters can be provided, and
when the thread terminates, it can return an int value. A typedef for a 
pointer to such a function is also provided:

   typedef int (* _thread)(int argc, char *argv[]);

This typedef is used in the _thread_init() function. It is defined in the
header file "catalina_threads.h"


Fundamental Thread Functions
=============================

The fundamental thread library functions are defined in "catalina_threads.h"

They are as follows:

extern int _thread_get_lock();
==============================
Get the cog lock allocated to the kernel for context switching. See the 
explanation of _thread_set_lock() for details on when this function is 
required.

extern void _thread_set_lock(int lock);
=======================================

Set the cog lock the multi-threading kernel will use for context switching. If
there are multiple multi-threading kernels started, it is important that they
all use the same cog lock to prevent context switching contention.

Initially, each multi-threading kernel will use cog lock 7 - but the kernel 
does not reserve this lock via _locknew(), so a new cog lock should usually
be reserved using _locknew() and then set  using _thread_lock_set() BEFORE the 
kernel starts any threads). This can be done very simply by:

   _thread_set_lock(_locknew());

Because the initial cog lock is not reserved, it does not need to be returned 
using _lockret() - but if another lock is used and it subsequently needs to be 
changed, the following sequence MUST be used:

1. get the current cog lock via _thread_get_lock()
2. reserve a new cog lock via _locknew()
3. set the new cog lock in ALL multi-threading kernels via _thread_set_lock()
4. release the current cog lock via _lockret().

extern int _thread_ticks(void * thread_id, int ticks);
==================================================
Update the tick count of the specified thread. Each tick is approximately 100 
microseconds, and the thread will execute for this many ticks before a context
switch (unless something occurs - such as a call to _thread_yield() - which 
makes the thread switch earlier.

A thread can update its own tick count, but the change will not take effect
until the next context switch.

extern void * _thread_id();
===========================
Return the unique non-zero thread id of the current thread.

extern void * _thread_start(_thread PC, void * SP, int argc, char *argv);
=========================================================================
Start a new thread. The SP must point to the top of at least THREAD_BLOCK_SIZE
longs. These longs are used as the thread block. The RAM below this is then
used as the stack of the thread. 

Returns the (non-zero) thread id on success, or 0 on failure.

extern void * _thread_stop(void * thread_id);
=============================================
Stop a thread executing. The thread to be stopped must be executing on the 
same cog as the thread calling the function (if this is not the case, use 
_thread_affinity_stop instead). 

Returns the non-zero thread id if the thread was found and stopped, or 0 if not.

extern void * _thread_join(void * thread_id, int * result);
===========================================================
Wait for a thread to complete and fetch it's return value. Note that this
function does not return until the thread has stopped.

Returns the non-zero thread id if the thread was found, or 0 if not. Also
returns 0 if you attempt to join your own thread, or the thread you are
trying to join gets terminated.

extern void * _thread_check(void * thread_id);
==============================================
Check if the specified thread is currently executing.

Returns the non-zero thread id if the thread is executing, or 0 if not.

extern void _thread_yield();
============================
Yield the cog to another thread. This is typically called instead of "busy
waiting" when a thread discovers it has no more work to do, and must wait
for another thread, or for an external event.
 

extern int _thread_init_lock_pool (void * pool, int size, int lock);
====================================================================
Initialize a block of Hub RAM as a pool of locks. This function should be 
called once (and only once) for each pool. The pool must be (size + 5) bytes 
of Hub RAM, and must be long aligned. 

If the intialization succeeds, 0 is returned.

extern int _thread_locknew(void * pool);
========================================
Allocate a free lock from a lock pool. Note that the pool must have previously
been initialized using _thread_init_lock_pool(). The id of the next unused 
lock in the pool is returned on success (1 .. size), and the lock is cleared. 

If no more locks are available, -1 is returned.

extern int _thread_lockclr(void * pool, int lockid);
====================================================
Clear the specified lock (1 .. size) in the specified lock pool. The lock pool 
must have been initialized using _thread_init_lock_pool(), and the lock must 
have previously been allocated using _thread_locknew() or an error is returned.

The previous value of the lock (0 or 1) is returned. On error, -1 is returned.

extern int _thread_lockret(void * pool, int lockid);
====================================================
Return a lock (1 .. size) to the specified lock pool. The lock pool must have 
been initialized using _thread_init_lock_pool(), and the lock must have 
previously been allocated using _thread_locknew() or an error is returned. 

On success, 0 is returned. On error, -1 is returned.

extern int _thread_lockset(void * pool, int lockid);
====================================================
Set the specified lock (1 .. size) in the specified lock pool. The lock pool 
must have been initialized using _thread_init_lock_pool(), and the lock must 
have previously been allocated using _thread_locknew() or an error is returned.

The previous value of the lock (0 or 1) is returned. On error, -1 is returned.
To check that the lock was not already set, test for a return value of 0.

extern int _thread_affinity(void *thread_id)
=============================================
Return the affinity status of the specified thread (can be used to determine 
both the current affinity, and also the current state of any outstanting 
affinity request).

extern int _thread_affinity_stop(void *thread_id)
=================================================
Stop the specified thread, which may have a different affinity from the
calling thread. Returns an error if an affinity command is already set for 
the specified thread.

extern int _thread_affinity_change(void *thread_id, int affinity)
==================================================================
Request a change of affinity for the specified thread. Check the affinity of 
the thread later to see if the change has taken effect.


Additional Thread Utility Functions
===================================

Some additional thread library functions are defined in "thread_utilities.h"

They are as follows:

int _thread_cog(_thread func, unsigned long *stack, int argc, char *argv[]);
============================================================================
Start a new multi-threaded kernel on a new cog, and have it initially run the
specified thread.

int _thread_integer(void *pool, int lock, int num);
===================================================
These functions are just the equivalents of the HMI functions t_integer, but
which uses a thread lock to ensure that only one such function can access the 
HMI plugin at once - this makes these functions more suitable for use with 
when multiple threads are executing.

int _thread_unsigned(void *pool, int lock, unsigned num);
=========================================================
As above, for t_unsigned.

int _thread_string(void *pool, int lock, char *str);
====================================================
As above, for t_string.

int _thread_char(void *pool, int lock, char ch);
================================================
As above, for t_char.

int _thread_hex(void *pool, int lock, unsigned num);
===================================================
As above, for t_hex.

int _thread_bin(void *pool, int lock, unsigned num);
====================================================
As above, for t_bin.

int _thread_printf(void *pool, int lock, char *str, ...);
=========================================================
As above, for t_printf.

void randomize();
=================
While not specific to threads, this function is useful - it initializes the
random number generator (using srand) based on the current clock value.

int  random(int max);
=====================
While not specific to threads, this function is useful - it returns a
random number from 0 to MAX - 1.

