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
public _malloc_sell_out(void);
publicdata mallink *_malloc_store[MAX_STORE];
#endif /* STORE */

void *
malloc(register size_t n)
{_memory_lock(); check_mallinks("malloc entry");{
	register mallink *ml;
	register int min_class;

	if (n == 0) {
		_memory_unlock();
		return NULL;
	}
	if (n < MIN_SIZE) n = align(MIN_SIZE); else n = align(n);
#ifdef STORE
	if (n <= MAX_STORE*MIN_SIZE)	{
		/* look in the store first */
		register mallink **stp = &_malloc_store[(n >> LOG_MIN_SIZE) - 1];
		
		if (ml = *stp)	{
			*stp = log_next_of(ml);
			set_store(ml, 0);
			check_mallinks("malloc fast exit");
			assert(! in_store(ml));
			_memory_unlock();
			return block_of_mallink(ml);
		}
	}
#endif /* STORE */

	check_work_empty("malloc, entry");

	/*	Acquire a chunk of at least size n if at all possible;
		Try everything.
	*/
	{
		/*	Inline substitution of "smallest".
		*/
		register size_t n1 = n;

		assert(n1 < (1L << LOG_MAX_SIZE));
		min_class = 0;

		do {
			n1 >>= 1;
			min_class++;
		} while (n1 >= MIN_SIZE);
	}

	if (min_class >= MAX_FLIST) {
		_memory_unlock();
		return NULL;		/* we don't deal in blocks that big */
  }
	ml = _malloc_first_present(min_class);
	if (ml == MAL_NULL)	{
		/*	Try and extend */
		register void *p;
		register size_t req =
			((MIN_SIZE<<min_class)+ mallink_size() + MIN_SPLIT - 1) &
				~(MIN_SPLIT-1);
	
		if (!ml_last)	{
			/* first align SBRK() */
		
			p = SBRK(0);
			SBRK((int) (align((size_type) p) - (size_type) p));
		}

		/* SBRK takes an int; sorry ... */
		if ((int) req < 0) {
			p = ILL_BREAK;
		} else {
			p = SBRK((int)req);
		}
		if (p == ILL_BREAK) {
			req = n + mallink_size();
			if ((int) req >= 0) p = SBRK((int)req);
		}
		if (p == ILL_BREAK)	{
			/*	Now this is bad.  The system will not give us
				more memory.  We can only liquidate our store
				and hope it helps.
			*/
#ifdef STORE
			_malloc_sell_out();
			ml = _malloc_first_present(min_class);
			if (ml == MAL_NULL)	{
#endif /* STORE */
				/* In this emergency we try to locate a suitable
				   chunk in the free_list just below the safe
				   one; some of these chunks may fit the job.
				*/
				ml = _malloc_search_free_list(min_class - 1, n);
				if (!ml) {	/* really out of space */
					_memory_unlock();
					return NULL;
				}
				started_working_on(ml);
				_malloc_unlink_free_chunk(ml);
				check_mallinks("suitable_chunk, forced");
#ifdef STORE
			}
			else started_working_on(ml);
#endif /* STORE */
		}
		else {
			assert((size_type)p == align((size_type)p));
			ml = _malloc_create_chunk(p, req);
		}
		check_mallinks("suitable_chunk, extended");
	}
	else started_working_on(ml);

	/* we have a chunk */
	set_free(ml, 0);
	calc_checksum(ml);
	check_mallinks("suitable_chunk, removed");
	n += mallink_size();
	if (n + MIN_SIZE + MIN_SPLIT <= size_of(ml)) {
		_malloc_truncate(ml, n);
	}
	stopped_working_on(ml);
	check_mallinks("malloc exit");
	check_work_empty("malloc exit");
#ifdef STORE
	assert(! in_store(ml));
#endif
	_memory_unlock();
	return block_of_mallink(ml);
}}

void *
malloc_defragment() {
#ifdef STORE
_memory_lock();
_malloc_sell_out();
_memory_unlock();
#endif
}

