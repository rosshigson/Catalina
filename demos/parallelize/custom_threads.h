/*****************************************************************************
 *                                                                           *
 *   This is an example "custom_threads.h" file that enables the Catalina    *
 *   Parallelizer to be used with another thread library - in this case,     *
 *   with GCC and Posix threads.                                             *
 *                                                                           *
 *   To use this file with a C program (which we will assume is called       *
 *   "custom_demo.c", first use the Catalina parallelizer to produce a       *
 *   "parallelized" version of the same program. For example:                *
 *                                                                           *
 *      parallelize custom_demo.c -o parallel_demo.c                         *
 *                                                                           *
 *   Then compile the parallel version of the program using the Propeller    *
 *   version of GCC, including the file "custom_threads.c", using a command  *
 *   such as:                                                                *
 *                                                                           *
 *      gcc -lpthread -D _REENTRANT -D CUSTOM_THREADS -D LOCAL_THREADS \     *
 *          parallel_demo.c custom_threads.c                                 *
 *                                                                           *
 *   Defining the _REENTRANT flag is necessary to use reentrant versions of  *
 *   the GCC libraries.                                                      *
 *                                                                           *
 *   Defining CUSTOM_THREADS tells the program to include "custom_threads.h" *
 *   (instead of "threads.h") and defining LOCAL_THREADS tells it            *
 *   to include this file from the current directory instead of from the     *
 *   system include directories. The functions in "custom_threads.c" could   *
 *   also be included from the system libraries, and in that case you could  *
 *   compile programs just by using a command like:                          *
 *                                                                           *
 *      gcc -lpthread -D _REENTRANT -D CUSTOM_THREADS parallel_demo.c        *
 *                                                                           *
 *   NOTE: When using GCC and Posix threads on the Propeller 1, you may      *
 *         need to reduce the number of threads executed in parallel, and    *
 *         also use the COMPACT mode of the compiler. For instance, the      *
 *         example program custom_demo.c was created from test_1.c by        *
 *         modifying the worker pragma to start at most 5 parallel threads   *
 *         (not the default of 10) - i.e. the worker pragma was modified     *
 *         to:                                                               *
 *                                                                           *
 *             #pragma propeller worker(int i) threads(5)                    *
 *                                                                           *
 *****************************************************************************/

// include standard C functions:
#include <stdio.h>
#include <stdlib.h>

// include propeller functions:
#include <cog.h>
#include <prop.h>

// include posix thread functions:
#include <pthread.h>

// specify the names of some common cog functions (Catalina puts an underscore
// in front of such names, other compilers may not):
#define _LOCKSET lockset
#define _LOCKCLR lockclr
#define _LOCKNEW locknew
#define _COGSTOP cogstop
#define _UNREGISTER(cog)

// Define the name of the function pointer type (the type is defined below). 
// This name must be defined as the name of the type that describes what a
// pointer to a thread function looks like. If it is not defined, then the 
// Catalina thread function pointer type will be used:
#define _THREAD _PTHREAD

// Define the thread function pointer type, which defines the type of a 
// pointer to a function that can be executed as a thread. This must match 
// the macro _THREAD_FUNCTION, which is used to actually declare instances 
// of this type, and the name must also match the name defined for _THREAD 
// macro, above:
typedef void *(* _PTHREAD)(void *);

// What a function must look like to be run as a thread (if the function
// does not accept an integer as its first parameter, you must define the
// GET_ID_FUNCTION macro to return the unique integer id of the thread). 
// This macro definition must match the thread function type defined above 
// (note that type is a pointer to this type):
#define _THREAD_FUNCTION(pthread) void *pthread(void *argc)

// If the thread function does not accept an integer as its first parameter, 
// define a _GET_ID_FUNCTION that returns a unique integer id for the calling 
// thread. The name passed to this macro is the name of the worker type, and
// the unique integer id must start at zero and increment by one for each 
// instance of the type created. However, the integer id is only unique to
// the type, so the name may need to be used to specify different functions
// or global variables to be used for each type. Posix threads do accept a
// parameter, but it is type void *, so we need to cast it to an integer:
#define _GET_ID_FUNCTION(name) ((int)argc)

// The function that releases CPU to other threads. This is important for
// threads implementations (such as Posix threads) that do not implement
// true preemptive multitasking:
#define _THREAD_YIELD() pthread_yield()

// The function to start a new threaded cog, with an initial "foreman" 
// thread. Must return the cog number or -1 if no cogs available. This 
// function is only used to start the foreman thread, which does not 
// require a parameter. Worker threads are instead started using the 
// _THREAD_ON_COG function:
#define _THREADED_COG(foreman, stack, stack_size) \
   new_threaded_cog(foreman, stack, stack_size)

// The function to start a worker thread on a specified cog - the id passed
// in is the unique id of this worker thread. It will be passed in the first
// parameter if the thread function accepts parameters, otherwise the thread 
// must fetch its unique worker id via the _GET_ID_FUNCTION:
#define _THREAD_ON_COG(worker, stack, size, cog, argc, ticks) \
   new_thread_on_cog(worker, stack, size, cog, argc, ticks) 

// The function to set the global thread lock (this should be a null macro 
// if a global lock is not required, such as when using Posix threads, which 
// do not use preemptive multitasking)
#define _THREAD_SET_LOCK(lock)

// The function to get the global thread lock (this should be a constant 
// macro that just returns -1 if a global lock is not required, such as when
// using Posix threads, which do not use preemptive multitasking)
#define _THREAD_GET_LOCK() (-1)

// Forward declaration of the function to start a new cog, with a specified 
// foreman, stack and stack size. Must return the cog number, or -1 if no 
// cog is available.
int new_threaded_cog(_PTHREAD foreman, long *stack, int stack_size);

// Forward declaration of the function to start a new thread on a cog, with
// the specified stack size, id and ticks (ticks may be ignored by Posix 
// threads, which does not implement preemptive multitasking). Must return 
// (as a void *) a unique handle for the thread, or NULL if the thread 
// cannot be started.
void *new_thread_on_cog(_PTHREAD worker, 
                        long *stack, int stack_size, 
                        int cog, int id, int ticks);


