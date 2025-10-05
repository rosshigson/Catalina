/*
 * sprintf - print formatted output on an array
 */
/* $Id: sprintf.c,v 1.3 1994/06/24 11:51:39 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"
#include  <limits.h>

int
sprintf(char * s, const char *format, ...)
{
	va_list ap;
	int retval;
	FILE tmp_stream;

	va_start(ap, format);

	tmp_stream._fd     = -1;
	tmp_stream._flags  = _IOWRITE + _IONBF + _IOWRITING;
	tmp_stream._buf    = (unsigned char *) s;
	tmp_stream._ptr    = (unsigned char *) s;
	tmp_stream._count  = INT_MAX;

	retval = _doprnt(format, ap, &tmp_stream);
	putc('\0',&tmp_stream);

	va_end(ap);

	return retval;
}
