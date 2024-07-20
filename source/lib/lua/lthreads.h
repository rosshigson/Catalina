/*
** Auxiliary functions from luathread API
** See Copyright Notice at the end of this file
*/

/* 
 * this is a modified version of luaproc.h
 */

#ifndef _LUA_LUATHREAD_H_
#define _LUA_LUATHREAD_H_

/*************************************
 * execution status of lua processes *
 ************************************/

#define LUATHREAD_STATUS_IDLE           0
#define LUATHREAD_STATUS_READY          1
#define LUATHREAD_STATUS_BLOCKED_SEND   2
#define LUATHREAD_STATUS_BLOCKED_RECV   3
#define LUATHREAD_STATUS_FINISHED       4

/*******************
 * structure types *
 ******************/

typedef struct stluathread luathread; /* lua process */

typedef struct stchannel channel; /* communication channel */

/* linked (fifo) list */
typedef struct stlist {
  luathread *head;
  luathread *tail;
  int nodes;
} list;

/***********************
 * function prototypes *
 **********************/

/* unlock access to a channel */
void luathread_unlock_channel( channel *chan );

/* return a channel where a lua process is blocked at */
channel *luathread_get_channel( luathread *lp );

/* queue a lua process that tried to send a message */
void luathread_queue_sender( luathread *lp );

/* queue a lua process that tried to receive a message */
void luathread_queue_receiver( luathread *lp );

/* add a lua process to the recycle list */
void luathread_recycle_insert( luathread *lp );

/* return a lua process' status */
int luathread_get_status( luathread *lp );

/* set a lua process' status */
void luathread_set_status( luathread *lp, int status );

/* return a lua process' lua state */
lua_State *luathread_get_state( luathread *lp );

/* return the number of arguments expected by a lua process */
int luathread_get_numargs( luathread *lp );

/* set the number of arguments expected by a lua process */
void luathread_set_numargs( luathread *lp, int n );

/* initialize an empty list */
void list_init( list *l );

/* insert a lua process in a list */
void list_insert( list *l, luathread *lp );

/* remove and return the first lua process in a list */
luathread* list_remove( list *l );

/* return a list's node count */
int list_count( list *l );

/* }====================================================================== */


/******************************************************************************
* Copyright 2008-2015 Alexandre Skyrme, Noemi Rodriguez, Roberto Ierusalimschy
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************/

#endif
