/*
 * rewind.c - set the file position indicator of a stream to the start
 */
/* $Id: rewind.c,v 1.2 1994/06/24 11:51:18 ceriel Exp $ */

#include	<stdio.h>
#include	"loc_incl.h"

void
rewind(FILE *stream)
{
	(void) fseek(stream, 0L, SEEK_SET);
	clearerr(stream);
}
