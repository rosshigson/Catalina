/*
 * tzset - set timezone information
 */
/* $Id: tzset.c,v 1.4 1994/06/24 11:58:29 ceriel Exp $ */

/* This function is present for System V && POSIX */

#include	<time.h>
#include	"loctime.h"

void
tzset(void)
{
	_tzset();	/* does the job */
}
