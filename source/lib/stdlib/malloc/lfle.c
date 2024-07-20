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

mallink *_malloc_free_list[MAX_FLIST+1];

#ifdef	CHECK
public mallink *
_malloc_free_list_entry(int i)	{
	/*	To allow maldump.c access to log.c's private data.
	*/
	return _malloc_free_list[i];
}
#endif	/* CHECK */
