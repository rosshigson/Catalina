/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: rand.c,v 1.4 1994/06/24 11:54:05 ceriel Exp $ */

#include	<stdlib.h>

static unsigned long int next = 1;

int rand(void)
{
	next = next * 1103515245 + 12345;
	return (unsigned int)(next/(2 * (RAND_MAX +1L)) % (RAND_MAX+1L));
}

void srand(unsigned int seed)
{
	next = seed;
}
