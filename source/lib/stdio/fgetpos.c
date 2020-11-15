/*
 * fgetpos.c - get the position in the file
 */
/* $Id: fgetpos.c,v 1.3 1994/06/24 11:49:01 ceriel Exp $ */

#include	<stdio.h>

int
fgetpos(FILE *stream, fpos_t *pos)
{
	*pos = ftell(stream);
	if (*pos == -1) return -1;
	return 0;
}
