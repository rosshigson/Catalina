/*
** scheduler module for executing lua threads
** See Copyright Notice in luathread.h
*/

/* 
 * this is a modified version of lpsched.h
 */

#ifndef _LUA_LUATHREAD_SCHED_H_
#define _LUA_LUATHREAD_SCHED_H_

#include "lthreads.h"

/****************************************
 * scheduler functions return constants *
 ***************************************/

/* scheduler function return constants */
#define	LUATHREAD_SCHED_OK                 0
#define LUATHREAD_SCHED_PTHREAD_ERROR     -1

/*************************************
 * default number of initial workers *
 ************************************/

/* scheduler default number of worker threads */
#define LUATHREAD_SCHED_DEFAULT_WORKER_THREADS 0

/***********************
 * function prototypes *
 **********************/

/* initialize scheduler */
int sched_init( void );
/* join workers */
void sched_join_workers( void );
/* wait until there are no more active lua processes */
void sched_wait( void );
/* move process to ready queue (ie, schedule process) */
void sched_queue_proc( luathread *lp );
/* increase active luathread count */
void sched_inc_lpcount( void );
/* set number of active workers (creates and destroys accordingly) */
int sched_set_numworkers( int numworkers );
/* return the number of active workers */
int sched_get_numworkers( void );
/* set number of active factories (creates and destroys accordingly) */
int sched_set_numfactories( int numfactories );
/* return the number of active factories */
int sched_get_numfactories( void );
/* set the factory of specified thread */
int sched_set_factory( int newfactory );
/* return the factory of the current worker */
int sched_get_factory( void );

#endif
