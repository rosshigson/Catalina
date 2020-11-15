/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: abort.c,v 1.4 1994/06/24 11:53:05 ceriel Exp $ */

#if	defined(_POSIX_SOURCE)
#include	<sys/types.h>
#endif
#include	<signal.h>
#include	<stdlib.h>

extern void (*_clean)(void);

void
abort(void)
{
	if (_clean) _clean();		/* flush all output files */
	raise(SIGABRT);
}

