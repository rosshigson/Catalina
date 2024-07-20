/*
 * remove.c - remove a file
 */
/* $Id: remove.c,v 1.3 1994/06/24 11:51:08 ceriel Exp $ */

#include	<stdio.h>

int _unlink(const char *path);

int
remove(const char *filename) {
	return _unlink(filename);
}
