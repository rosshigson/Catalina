/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: memcpy.c,v 1.5 1994/06/24 11:56:28 ceriel Exp $ */

#include	<string.h>

void *
memcpy(void *s1, const void *s2, register size_t n)
{
	register char *p1 = s1;
	register const char *p2 = s2;


	if (n) {
		n++;
		while (--n > 0) {
			*p1++ = *p2++;
		}
	}
	return s1;
}
