/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: strcpy.c,v 1.3 1994/06/24 11:56:49 ceriel Exp $ */

#include	<string.h>

char *
strcpy(char *ret, register const char *s2)
{
	register char *s1 = ret;

	while (*s1++ = *s2++)
		/* EMPTY */ ;

	return ret;
}
