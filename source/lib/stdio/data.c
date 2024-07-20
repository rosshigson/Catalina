/*
 * data.c - this is the initialization for the standard streams
 */
/* $Id: data.c,v 1.4 1994/06/24 11:48:19 ceriel Exp $ */

#include	<stdio.h>
#include "loc_incl.h"

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

#if STATIC_IO_BUFFERS

FILE __iotab[FOPEN_MAX] = {
   { 0, 0, _IOREAD,         0, (unsigned char *)NULL, (unsigned char *)NULL, },
   { 0, 1, _IOWRITE,        0, (unsigned char *)NULL, (unsigned char *)NULL, },
   { 0, 2, _IOWRITE|_IONBF, 0, (unsigned char *)NULL, (unsigned char *)NULL, }
};

int  __iolock = -1;     // lock used to access I/O table and buffer
int  __ioused = 0;      // set flag to 1 when buffer 2 (see below) is in use
char __iobuff[BUFSIZ];  // shared buffer - if unavailable, I/O is unbuffered
char __iostdb[LINSIZ*2];// preallocated buffers for stdin & stdout 
                        // (note that stderr is always unbuffered)

#else

struct __iobuf __stdin = {
	0, 0, _IOREAD, 0,
	(unsigned char *)NULL, (unsigned char *)NULL, 
};

struct __iobuf __stdout = {
	0, 1, _IOWRITE, 0,
	(unsigned char *)NULL, (unsigned char *)NULL, 
};

struct __iobuf __stderr = {
	0, 2, _IOWRITE | _IOLBF, 0,
	(unsigned char *)NULL, (unsigned char *)NULL, 
};

FILE *__iotab[FOPEN_MAX] = {
	&__stdin,
	&__stdout,
	&__stderr,
	0
};

#endif
