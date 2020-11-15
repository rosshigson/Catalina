/*
 * fscanf.c - read formatted input from stream
 */
/* $Id: fscanf.c,v 1.2 1994/06/24 11:49:57 ceriel Exp $ */

#include	<stdio.h>
#include	<stdarg.h>
#include	"loc_incl.h"

int
fscanf(FILE *stream, const char *format, ...)
{
	va_list ap;
	int retval;

	va_start(ap, format);

	retval = _doscan(stream, format, ap);

	va_end(ap);

	return retval;
}
