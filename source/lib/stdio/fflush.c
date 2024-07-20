/*
 * fflush.c - flush stream(s)
 */
/* $Id: fflush.c,v 1.7 1994/06/24 11:48:51 ceriel Exp $ */

#include	<sys/types.h>
#include	<stdio.h>
#include	"loc_incl.h"

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

int _write(int d, const char *buf, int nbytes);
off_t _lseek(int fildes, off_t offset, int whence);

int
fflush(FILE *stream)
{
#if __CATALINA_SIMPLE_IO
   return catalina_fflush(stream);
#else
   int count, c1, i, retval = 0;

	if (!stream) {
	    for(i= 0; i < FOPEN_MAX; i++)
#if STATIC_IO_BUFFERS          
		if ((__iotab[i]._flags != 0) && fflush(&__iotab[i]))
#else
		if (__iotab[i] && fflush(__iotab[i]))
#endif         
			retval = EOF;
	    return retval;
	}

	if (!stream->_buf
	    || (!io_testflag(stream, _IOREADING)
		&& !io_testflag(stream, _IOWRITING)))
		return 0;
	if (io_testflag(stream, _IOREADING)) {
		/* (void) fseek(stream, 0L, SEEK_CUR); */
		int adjust = 0;
		if (stream->_buf && !io_testflag(stream,_IONBF))
			adjust = stream->_count;
		stream->_count = 0;
		_lseek(fileno(stream), (off_t) adjust, SEEK_CUR);
		if (io_testflag(stream, _IOWRITE))
			stream->_flags &= ~(_IOREADING | _IOWRITING);
		stream->_ptr = stream->_buf;
		return 0;
	} else if (io_testflag(stream, _IONBF)) return 0;

	if (io_testflag(stream, _IOREAD))		/* "a" or "+" mode */
		stream->_flags &= ~_IOWRITING;

	count = stream->_ptr - stream->_buf;
	stream->_ptr = stream->_buf;

	if ( count <= 0 )
		return 0;

	if (io_testflag(stream, _IOAPPEND)) {
		if (_lseek(fileno(stream), 0L, SEEK_END) == -1) {
			stream->_flags |= _IOERR;
			return EOF;
		}
	}
	c1 = _write(stream->_fd, (char *)stream->_buf, count);

	stream->_count = 0;

	if ( count == c1 )
		return 0;

	stream->_flags |= _IOERR;
	return EOF; 
#endif
}

void
__cleanup(void)
{
#ifndef __CATALINA_SIMPLE_IO
	register int i;
	for(i= 0; i < FOPEN_MAX; i++)
#if STATIC_IO_BUFFERS
		if (io_testflag(&__iotab[i], _IOWRITING))
#else
		if (__iotab[i] && io_testflag(__iotab[i], _IOWRITING))
#endif   
			(void) fflush(__iotab[i]);
#endif
}
