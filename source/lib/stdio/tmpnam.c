/*
 * tmpnam.c - create a unique filename
 */
/* $Id: tmpnam.c,v 1.5 1994/06/24 11:51:52 ceriel Exp $ */

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

char *
tmpnam(char *s) {
	static char name_buffer[L_tmpnam] = TMP_PREFIX;
	static unsigned long count = 0;
	static char *name = NULL;

	if (!name) { 
		name = name_buffer + strlen(name_buffer);
		name = _i_compute(_getpid(), 10, name, TMP_NDIGITS);
		*name++ = '.';
		*name = '\0';
	}
	if (++count > TMP_MAX) count = 1;	/* wrap-around */
	*_i_compute(count, 10, name, 3) = '\0';
	if (s) return strcpy(s, name_buffer);
	else return name_buffer;
}
