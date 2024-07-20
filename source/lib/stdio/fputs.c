/*
 * fputs - print a string
 */
/* $Id: fputs.c,v 1.3 1994/06/24 11:49:44 ceriel Exp $ */

#include	<stdio.h>

int
fputs(register const char *s, register FILE *stream)
{
	register int i = 0;

	while (*s) 
		if (putc(*s++, stream) == EOF) return EOF;
		else i++;

	return i;
}
