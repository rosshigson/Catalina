/*
 * fsetpos.c - set the position in the file
 */
/* $Id: fsetpos.c,v 1.2 1994/06/24 11:50:06 ceriel Exp $ */

#include	<stdio.h>

int
fsetpos(FILE *stream, fpos_t *pos)
{
	return fseek(stream, *pos, SEEK_SET);
}
