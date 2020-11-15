/*
 * vprintf - formatted output without ellipsis to the standard output stream
 */
/* $Id: vprintf.c,v 1.4 1994/06/24 11:52:02 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"

int
vprintf(const char *format, va_list arg)
{
	return _doprnt(format, arg, stdout);
}
