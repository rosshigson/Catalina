/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: strrchr.c,v 1.4 1994/06/24 11:57:13 ceriel Exp $ */

#include	<string.h>

char *
strrchr(register const char *s, int c)
{
	register const char *result = NULL;

	c = (char) c;

	do {
		if (c == *s)
			result = s;
	} while (*s++ != '\0');

	return (char *)result;
}
