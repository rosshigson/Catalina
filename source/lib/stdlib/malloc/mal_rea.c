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
realloc(void *addr, register size_t n)
{_memory_lock(); check_mallinks("realloc entry");{
	register mallink *ml, *ph_next;
	register size_type size;

	if (addr == NULL) {
		/*	Behave like most Unix realloc's when handed a
			null-pointer
		*/
		_memory_unlock();
		return malloc(n);
	}
	if (n == 0) {
		_memory_unlock();
		free(addr);
		return NULL;
	}
	ml = mallink_of_block(addr);
	if (n < MIN_SIZE) n = align(MIN_SIZE); else n = align(n);
#ifdef STORE
	if (in_store(ml)) {
		register mallink *stp = _malloc_store[(size_of(ml) >> LOG_MIN_SIZE) - 1];
		mallink *stp1 = NULL;
		while (ml != stp)	{
			stp1 = stp;
			stp = log_next_of(stp);
		}
		stp = log_next_of(stp);
		if (! stp1) _malloc_store[(size_of(ml) >> LOG_MIN_SIZE) - 1] = stp;
		else set_log_next(stp1, stp);
		set_store(ml, 0);
		calc_checksum(ml);
	}
#endif
	if (free_of(ml)) {
		_malloc_unlink_free_chunk(ml);
		set_free(ml, 0);		/* user reallocs free block */
	}
	started_working_on(ml);
	size = size_of(ml);
	if (	/* we can simplify the problem by adding the next chunk: */
		n > size &&
		!last_mallink(ml) &&
		(ph_next = phys_next_of(ml), free_of(ph_next)) &&
		n <= size + mallink_size() + size_of(ph_next)
	)	{
		/* add in the physically next chunk */
		_malloc_unlink_free_chunk(ph_next);
		_malloc_combine_chunks(ml, ph_next);
		size = size_of(ml);
		check_mallinks("realloc, combining");
	}
	if (n > size)	{		/* this didn't help */
		void *new;
		register char *l1, *l2 = addr;

		stopped_working_on(ml);
		_memory_unlock();
		if (!(new = l1 = malloc(n))) {
				return NULL;	/* no way */
		}
		while (size--) *l1++ = *l2++;
		free(addr);
		_memory_lock();
		check_work_empty("mv_realloc");
#ifdef STORE
		assert(! in_store(mallink_of_block(new)));
#endif
		_memory_unlock();
		return new;
	}
	/* it helped, but maybe too well */
	n += mallink_size();
	if (n + MIN_SIZE + MIN_SPLIT <= size_of(ml)) {
		_malloc_truncate(ml, n);
	}
	stopped_working_on(ml);
	check_mallinks("realloc exit");
	check_work_empty("realloc");
#ifdef STORE
	assert(! in_store(ml));
#endif
	_memory_unlock();
	return addr;
}}

