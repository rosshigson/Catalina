/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
#include	<stdlib.h>
#include	"param.h"
#include	"impl.h"
#include	"check.h"
#include	"phys.h"

public
_malloc_combine_chunks(register mallink *ml1, register mallink *ml2)
{
	/*	The chunks ml1 and ml2 are combined.
	*/
	register mallink *ml3 = phys_next_of(ml2);

	set_phys_next(ml1, ml3);
	calc_checksum(ml1);
	if (!last_mallink(ml2))	{
		set_phys_prev(ml3, ml1);
		calc_checksum(ml3);
	}
	if (ml_last == ml2)
		ml_last = ml1;
}
