/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
#include	<limits.h>
#include	<stdlib.h>
#include	"param.h"
#include	"impl.h"
#include	"check.h"
#include	"log.h"
#include	"phys.h"

/*	Malloc space is traversed by N doubly-linked lists of chunks, each
	containing a couple of house-keeping data addressed as a
	'mallink' and a piece of useful space, called the block.
	The N lists are accessed through their starting pointers in
	free_list[].  Free_list[n] points to a list of chunks between
	2**(n+LOG_MIN_SIZE) and 2**(n+LOG_MIN_SIZE+1)-1, which means
	that the smallest chunk is 2**LOG_MIN_SIZE (== MIN_SIZE).
*/

#ifdef SYSTEM
#include	<system.h>
#define SBRK	sys_break
#else
#define SBRK	_sbrk
#define	ILL_BREAK		(void *)(-1)	/* funny failure value */
#endif
extern void *SBRK(int incr);
#ifdef STORE
#define	MAX_STORE	32
public _malloc_do_free(mallink *ml);
publicdata mallink *_malloc_store[MAX_STORE];
#endif /* STORE */

void
free(void *addr)
{_memory_lock(); check_mallinks("free entry");{
	register mallink *ml;

	if (addr == NULL) {
		check_mallinks("free(0) very fast exit");
		_memory_unlock();
		return;
	}

	ml = mallink_of_block(addr);
#ifdef STORE

	if (free_of(ml) || in_store(ml)) {
		_memory_unlock();
		return;				/* user frees free block */
	}
	if (size_of(ml) <= MAX_STORE*MIN_SIZE)	{
		/* return to store */
		mallink **stp = &_malloc_store[(size_of(ml) >> LOG_MIN_SIZE) - 1];
		
		set_log_next(ml, *stp);
		*stp = ml;
		set_store(ml, 1);
		calc_checksum(ml);
		check_mallinks("free fast exit");
	}
	else	{
		_malloc_do_free(ml);
		check_mallinks("free exit");
	}
	_memory_unlock();
}}

public
_malloc_do_free(register mallink *ml)
{{
#endif

#ifndef STORE
	if (free_of(ml)) {
		_memory_unlock();
    return;
  }
#endif /* STORE */
	started_working_on(ml);
	set_free(ml, 1);
	calc_checksum(ml);
	if (! last_mallink(ml)) {
		register mallink *next = phys_next_of(ml);

		if (free_of(next)) coalesce_forw(ml, next);
	}

	if (! first_mallink(ml)) {
		register mallink *prev = phys_prev_of(ml);

		if (free_of(prev)) {
			coalesce_backw(ml, prev);
			ml = prev;
		}
	}
	_malloc_link_free_chunk(ml);
	stopped_working_on(ml);
	check_work_empty("free");

	/* Compile-time checks on param.h */
	switch (0)	{
	case MIN_SIZE < OFF_SET * sizeof(mallink):	break;
	case 1:	break;
	/*	If this statement does not compile due to duplicate case
		entry, the minimum size block cannot hold the links for
		the free blocks.  Either raise LOG_MIN_SIZE or switch
		off NON_STANDARD.
	*/
	}
	switch(0)	{
	case sizeof(void *) != sizeof(size_type):	break;
	case 1:	break;
	/*	If this statement does not compile due to duplicate
		case entry, size_type is not defined correctly.
		Redefine and compile again.
	*/
	}
#ifndef STORE
	_memory_unlock();
#endif /* STORE */
}}

