/*
 * puts.c - print a string onto the standard output stream
 */
/* $Id: puts.c,v 1.3 1994/06/24 11:51:04 ceriel Exp $ */

#include	<stdio.h>

int
puts(register const char *s)
{
	register FILE *file = stdout;
	register int i = 0;

	while (*s) {
		if (putc(*s++, file) == EOF) return EOF;
		else i++;
	}
	if (putc('\n', file) == EOF) return EOF;
	return i + 1;
}
