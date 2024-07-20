/* $Id: log.c,v 1.4 1994/06/24 11:55:23 ceriel Exp $ */
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
_malloc_unlink_free_chunk(register mallink *ml)
{
	/*	Unlinks a free chunk from (the middle of) the
		logical chain.
	*/
	register mallink *next = log_next_of(ml);
	register mallink *prev = log_prev_of(ml);

	if (!prev)	{
		/* it is the first in the chain */
		register mallink **mlp = &_malloc_free_list[-1];
		register size_type n = size_of(ml);

		assert(n < (1L << LOG_MAX_SIZE));
		do {
			n >>= 1;
			mlp++;
		}
		while (n >= MIN_SIZE);
		*mlp = next;
	}
	else	{
		set_log_next(prev, next);
		calc_checksum(prev);
	}
	if (next) {
		set_log_prev(next, prev);
		calc_checksum(next);
	}
}

