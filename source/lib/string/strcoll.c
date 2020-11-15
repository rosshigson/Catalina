/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: strcoll.c,v 1.3 1994/06/24 11:56:46 ceriel Exp $ */

#include	<string.h>
#include	<locale.h>

int
strcoll(register const char *s1, register const char *s2)
{
	while (*s1 == *s2++) {
		if (*s1++ == '\0') {
			return 0;
		}
	}
	return *s1 - *--s2;
}
