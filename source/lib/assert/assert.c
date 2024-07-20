/*
 * assert.c - diagnostics
 */
/* $Id: assert.c,v 1.4 1994/06/24 11:39:03 ceriel Exp $ */

#include	<assert.h>
#include	<stdio.h>
#include	<stdlib.h>

void __bad_assertion(const char *mess) {

	fputs(mess, stderr);
	abort();
}
