/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: abs.c,v 1.2 1994/06/24 11:53:08 ceriel Exp $ */

#include	<stdlib.h>

int
abs(register int i)
{
	return i >= 0 ? i : -i;
}
