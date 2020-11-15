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

public mallink *
_malloc_create_chunk(void *p, size_t n)
{
	/*	The newly acquired piece of memory at p, of length n,
		is turned into a free chunk, properly chained in the
		physical chain.
		The address of the chunk is returned.
	*/
	register mallink *ml;
	/*	All of malloc memory is followed by a virtual chunk, the
		mallink of which starts mallink_size() bytes past the last
		byte in memory.
		Its use is prevented by testing for ml == ml_last first.
	*/
	register mallink *last = ml_last;
	
	assert(!last || p == (char *)phys_next_of(last) - mallink_size());
	ml = (mallink *)((char *)p + mallink_size());	/* bump ml */
	new_mallink(ml);
	started_working_on(ml);
	set_free(ml, 1);
	set_phys_prev(ml, last);
	ml_last = ml;

	set_phys_next(ml, (mallink *)((char *)ml + n));
	calc_checksum(ml);
	assert(size_of(ml) + mallink_size() == n);
	if (last && free_of(last)) {
		coalesce_backw(ml, last);
		ml = last;
	}
	check_mallinks("create_chunk, phys. linked");
	return ml;
}

