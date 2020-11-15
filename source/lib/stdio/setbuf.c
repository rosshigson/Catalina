/*
 * setbuf.c - control buffering of a stream
 */
/* $Id: setbuf.c,v 1.3 1994/06/24 11:51:27 ceriel Exp $ */

#include	<stdio.h>
#include	"loc_incl.h"

void
setbuf(register FILE *stream, char *buf)
{
	(void) setvbuf(stream, buf, (buf ? _IOFBF : _IONBF), (size_t) BUFSIZ);
}
