/*
 * fputc.c - print an unsigned character
 */
/* $Id: fputc.c,v 1.2 1994/06/24 11:49:39 ceriel Exp $ */

#include	<stdio.h>

int
fputc(int c, FILE *stream)
{
	return putc(c, stream);
}
