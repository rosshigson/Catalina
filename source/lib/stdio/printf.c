/*
 * printf - write on the standard output stream
 */
/* $Id: printf.c,v 1.4 1994/06/24 11:50:51 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"

int
printf(const char *format, ...)
{
	va_list ap;
	int retval;

	va_start(ap, format);

	retval = _doprnt(format, ap, stdout);

	va_end(ap);

	return retval;
}
