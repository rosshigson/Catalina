/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: labs.c,v 1.2 1994/06/24 11:53:44 ceriel Exp $ */

#include	<stdlib.h>

long
labs(register long l)
{
	return l >= 0 ? l : -l;
}
