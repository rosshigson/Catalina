/*
 * difftime - compute the difference between two calendar times
 */
/* $Id: difftime.c,v 1.5 1994/06/24 11:58:05 ceriel Exp $ */

#include	<time.h>

double
difftime(time_t time1, time_t time0)
{
	/* be careful: time_t may be unsigned */
	if ((time_t)-1 > 0 && time0 > time1) {
		return - (double) (time0 - time1);
	} else {
		return (double)(time1 - time0);
	}
}
