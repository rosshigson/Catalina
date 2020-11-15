/*
 * fgetc - get an unsigned character and return it as an int
 */
/* $Id: fgetc.c,v 1.2 1994/06/24 11:48:57 ceriel Exp $ */

#include	<stdio.h>

int
fgetc(FILE *stream)
{
	return getc(stream);
}
