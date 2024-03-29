/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: mbtowc.c,v 1.4 1994/06/24 11:53:58 ceriel Exp $ */

#include	<stdlib.h>
#include	<limits.h>

int
mbtowc(wchar_t *pwc, register const char *s, size_t n)
{
	if (s == (const char *)NULL) return 0;
	if (n <= 0) return 0;
	if (pwc) *pwc = *s;
	return (*s != 0);
}
