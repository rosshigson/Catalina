/*
 * fileno .c - map a stream to a file descriptor
 */
/* $Id: fileno.c,v 1.2 1994/06/24 11:49:09 ceriel Exp $ */

#include	<stdio.h>

int
(fileno)(FILE *stream)
{
	return stream->_fd;
}
