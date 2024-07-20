/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
#include	"param.h"
#include	"impl.h"
#include	"check.h"
#include	"log.h"

/*	Logical manipulations.
	The chunks are properly chained in the physical chain.
*/

publicdata mallink *_malloc_free_list[MAX_FLIST+1];

public mallink *
_malloc_first_present(int class)
{
	/*	Find the index i in _malloc_free_list[] such that:
			i >= class && _malloc_free_list[i] != MAL_NULL.
		Return MAL_NULL if no such i exists;
		Otherwise, return the first block of this list, after
		unlinking it.
	*/
	register mallink **mlp, *ml;

	for (mlp = &_malloc_free_list[class]; mlp < &_malloc_free_list[MAX_FLIST]; mlp++) {
		if ((ml = *mlp) != MAL_NULL)	{
	
			*mlp = log_next_of(ml);	/* may be MAL_NULL */
			if (*mlp) {
				/* unhook backward link
				*/
				set_log_prev(*mlp, MAL_NULL);
				calc_checksum(*mlp);
			}
			return ml;
		}
	}
	return MAL_NULL;
}

