/*****************************************************************************
 *                                                                           *
 *   This is an example "custom_threads.c" file that enables the Catalina    *
 *   Parallelizer to be used with another thread library - in this case,     *
 *   with GCC and Posix threads.                                             *
 *                                                                           *
 *   See the file "custom_threads.h" for details on how to use this file.    *
 *                                                                           *
 *****************************************************************************/

#include "custom_threads.h"

// When using GCC and Posix threads, a function to be started on a cog
// is different to a function to be started as a thread, so we must
// define the former type here, as we expect to tbe passed the latter.
typedef void (* foreman_t)(void *arg);

// Function to start a foreman function on a new cog. Must return the 
// cog number, or -1 if no cogs are available. In this case, all we
// need to do is cast the thread type to be a foreman thread type, and
// then we can just use the cogstart function. This is safe because
// the only difference is the return type, and foreman functions never
// return.
int new_threaded_cog(_PTHREAD foreman, long *stack, int stack_size) {
   return cogstart((foreman_t)foreman, NULL, stack, stack_size);
}  

// Function to start a worker function on a specified cog. Must return a 
// void * that is the unique handle of the thread, or NULL if the thread 
// cannot be started. Thread functions accept a void * parameter, so we
// cast our argument to be a void * - the worker must cast it back to an
// integer to get its unique worker id.
void *new_thread_on_cog(_PTHREAD worker, 
                        long *stack, int stack_size, 
                       int cog, int argc, int ticks) {
   pthread_t t = NULL;
   pthread_attr_t ta;
   ta.stack = (void *)stack;
   ta.stksiz = stack_size;
   ta.flags = _PTHREAD_DETACHED;
      if (pthread_create(&t, &ta, worker, (void *)argc) == 0) {
      pthread_set_cog_affinity_np(t, ~(1<<cog));
   }
   return t;
}

