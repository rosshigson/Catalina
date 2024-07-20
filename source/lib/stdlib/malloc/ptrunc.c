/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
#include	<stdlib.h>
#include	"param.h"
#include	"impl.h"
#include	"check.h"
#include	"phys.h"

/*	Physical manipulations.
	The blocks concerned are not in any logical chain.
*/

public
_malloc_truncate(register mallink *ml, size_t size)
{
	/*	The chunk ml is truncated.
		The chunk at ml is split in two.
		The remaining part is then freed.
	*/
	register mallink *new = (mallink *)((char *)ml + size);
	register mallink *ph_next = phys_next_of(ml);

	new_mallink(new);
	set_free(new, 1);
	set_phys_prev(new, ml);
	set_phys_next(new, ph_next);
	calc_checksum(new);
	if (! last_mallink(ml))	{
		set_phys_prev(ph_next, new);
		calc_checksum(ph_next);
		if (free_of(ph_next)) coalesce_forw(new, ph_next);
	}
	else	ml_last = new;
	set_phys_next(ml, new);
	calc_checksum(ml);

	started_working_on(new);
	_malloc_link_free_chunk(new);
	stopped_working_on(new);
	check_mallinks("truncate");
}

