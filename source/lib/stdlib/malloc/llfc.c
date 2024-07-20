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

public
_malloc_link_free_chunk(register mallink *ml)
{
	/*	The free chunk ml is inserted in its proper logical
		chain.
	*/
	register mallink **mlp = &_malloc_free_list[0];
	register size_type n = size_of(ml);
	register mallink *ml1;

	assert(n < (1L << LOG_MAX_SIZE));

	do {
		n >>= 1;
		mlp++;
	}
	while (n >= MIN_SIZE);

	ml1 = *--mlp;
	set_log_prev(ml, MAL_NULL);
	set_log_next(ml, ml1);
	calc_checksum(ml);
	if (ml1) {
		/* link backwards
		*/
		set_log_prev(ml1, ml);
		calc_checksum(ml1);
	}
	*mlp = ml;
}

