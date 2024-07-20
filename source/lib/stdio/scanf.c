/*
 * scanf.c - read formatted input from the standard input stream
 */
/* $Id: scanf.c,v 1.2 1994/06/24 11:51:22 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"

int
scanf(const char *format, ...)
{
	va_list ap;
	int retval;

	va_start(ap, format);

	retval = _doscan(stdin, format, ap);

	va_end(ap);

	return retval;
}


