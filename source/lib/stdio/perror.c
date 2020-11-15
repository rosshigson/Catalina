/*
 * perror.c - print an error message on the standard error output
 */
/* $Id: perror.c,v 1.3 1994/06/24 11:50:46 ceriel Exp $ */

#include	<errno.h>
#include	<stdio.h>
#include	<string.h>

void
perror(const char *s)
{
	if (s && *s) {
		(void) fputs(s, stderr);
		(void) fputs(": ", stderr);
	}
	(void) fputs(strerror(errno), stderr);
	(void) fputs("\n", stderr);
}
