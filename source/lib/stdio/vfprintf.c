/*
 * vfprintf - formatted output without ellipsis
 */
/* $Id: vfprintf.c,v 1.3 1994/06/24 11:51:59 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"

int
vfprintf(FILE *stream, const char *format, va_list arg)
{
	return _doprnt (format, arg, stream);
}
