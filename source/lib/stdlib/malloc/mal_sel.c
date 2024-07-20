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
public _malloc_do_free(mallink *ml), _malloc_sell_out(void);
publicdata mallink *_malloc_store[MAX_STORE];
#endif /* STORE */

/*	Auxiliary routines */

#ifdef STORE
public
_malloc_sell_out(void)	{
	/*	Frees all block in store.
	*/
	register mallink **stp;
	for (stp = &_malloc_store[0]; stp < &_malloc_store[MAX_STORE]; stp++)	{
		register mallink *ml = *stp;
		
		while (ml)	{
			*stp = log_next_of(ml);
			set_store(ml, 0);
			_malloc_do_free(ml);
			ml = *stp;
		}
	}
}
#endif /* STORE */

#ifdef	ASSERT
public
m_assert(const char *fn, int ln)
{
	char ch;
	
	while (*fn)
		write(2, fn++, 1);
	write(2, ": malloc assert failed in line ", 31);
	ch = (ln / 100) + '0'; write(2, &ch, 1); ln %= 100;
	ch = (ln / 10) + '0'; write(2, &ch, 1); ln %= 10;
	ch = (ln / 1) + '0'; write(2, &ch, 1);
	write(2, "\n", 1);
	maldump(1);
}
#endif	/* ASSERT */
