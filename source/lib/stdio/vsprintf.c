/*
 * vsprintf - print formatted output without ellipsis on an array
 */
/* $Id: vsprintf.c,v 1.3 1994/06/24 11:52:06 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"
#include  <limits.h>
int
vsprintf(char *s, const char *format, va_list arg)
{
	int retval;
	FILE tmp_stream;

	tmp_stream._fd     = -1;
	tmp_stream._flags  = _IOWRITE + _IONBF + _IOWRITING;
	tmp_stream._buf    = (unsigned char *) s;
	tmp_stream._ptr    = (unsigned char *) s;
	tmp_stream._count  = INT_MAX;

	retval = _doprnt(format, arg, &tmp_stream);
	putc('\0',&tmp_stream);

	return retval;
}
