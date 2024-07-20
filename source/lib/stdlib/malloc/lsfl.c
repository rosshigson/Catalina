/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
#include	"param.h"
#include	"impl.h"
#include	"check.h"
#include	"log.h"
#include "phys.h"

/*	Logical manipulations.
	The chunks are properly chained in the physical chain.
*/

publicdata mallink *_malloc_free_list[MAX_FLIST+1];

public mallink *
_malloc_search_free_list(int class, size_t n)
{
	/*	Searches the _malloc_free_list[class] for a chunk of at least size n;
		since it is searching a slightly undersized list,
		such a block may not be there.
	*/
	register mallink *ml;
	
	for (ml = _malloc_free_list[class]; ml; ml = log_next_of(ml))
		if (size_of(ml) >= n)
			return ml;
	return MAL_NULL;		/* nothing found */
}

