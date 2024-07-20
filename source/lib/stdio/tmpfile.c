/*
 * tmpfile.c - create and open a temporary file
 */
/* $Id: tmpfile.c,v 1.4 1994/06/24 11:51:47 ceriel Exp $ */

#include	<stdio.h>
#include	<string.h>
#include	"loc_incl.h"

#ifdef __CATALINA__
#define TMP_NDIGITS 3
#define TMP_PREFIX  "tmp."
#else
#define TMP_NDIGITS 5
#define TMP_PREFIX  "/tmp/tmp."
#endif

unsigned int _getpid(void);

FILE *
tmpfile(void) {
	static char name_buffer[L_tmpnam] = TMP_PREFIX;
	static char *name = NULL;
	FILE *file;

	if (!name) {
		name = name_buffer + strlen(name_buffer);
		name = _i_compute(_getpid(), 10, name, TMP_NDIGITS);
		*name = '\0';
	}

	file = fopen(name_buffer,"wb+");
	if (!file) return (FILE *)NULL;
	(void) remove(name_buffer);
	return file;
}
