/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: memset.c,v 1.4 1994/06/24 11:56:34 ceriel Exp $ */

#include	<string.h>

void *
memset(void *s, register int c, register size_t n)
{
	register char *s1 = s;

	if (n>0) {
		n++;
		while (--n > 0) {
			*s1++ = c;
		}
	}
	return s;
}
