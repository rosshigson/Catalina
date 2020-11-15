/*
 * ctime - convers the calendar time to a string
 */
/* $Id: ctime.c,v 1.2 1994/06/24 11:58:02 ceriel Exp $ */

#include	<time.h>

char *
ctime(const time_t *timer)
{
	return asctime(localtime(timer));
}
