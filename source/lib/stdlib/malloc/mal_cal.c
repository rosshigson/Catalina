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
publicdata mallink *_malloc_store[MAX_STORE];
#endif /* STORE */

void *
calloc(size_t nmemb, size_t size)
{_memory_lock(); check_mallinks("calloc entry");{
	long *l1, *l2;
	size_t n;

	if (size == 0) {
		_memory_unlock();
		return NULL;
  }
	if (nmemb == 0) {
		_memory_unlock();
		return NULL;
  }

	/* Check for overflow on the multiplication. The peephole-optimizer
	 * will eliminate all but one of the possibilities.
	 */
	if (sizeof(size_t) == sizeof(int)) {
		if (UINT_MAX / size < nmemb) {
			_memory_unlock();
			return NULL;
    }
	} else if (sizeof(size_t) == sizeof(long)) {
		if (ULONG_MAX / size < nmemb) {
			_memory_unlock();
			return NULL;
    }
	} else {
		_memory_unlock();
		return NULL;		/* can't happen, can it ? */
	}

	n = size * nmemb;
	if (n < MIN_SIZE) n = align(MIN_SIZE); else n = align(n);
	if (n >= (1L << LOG_MAX_SIZE)) {
		_memory_unlock();
		return NULL;
	}
	_memory_unlock();
	l1 = (long *) malloc(n);
	_memory_lock();
	l2 = l1 + (n / sizeof(long));	/* n is at least long aligned */
	while ( l2 != l1 ) *--l2 = 0;
	check_mallinks("calloc exit");
	check_work_empty("calloc exit");
	_memory_unlock();
	return (void *)l1;
}}

