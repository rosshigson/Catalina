/*
 * setbuf.c - control buffering of a stream
 */
/* $Id: setvbuf.c,v 1.8 1995/12/18 11:02:18 ceriel Exp $ */

#include	<stdio.h>
#include	<stdlib.h>
#include	"loc_incl.h"

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

#if STATIC_IO_BUFFERS
extern char __iobuff[BUFSIZ];
#endif

extern void (*_clean)(void);

int
setvbuf(register FILE *stream, char *buf, int mode, size_t size)
{
	int retval = 0;

	_clean = __cleanup;
	if (mode != _IOFBF && mode != _IOLBF && mode != _IONBF)
		return EOF;

	if (stream->_buf && io_testflag(stream,_IOMYBUF) )
#if STATIC_IO_BUFFERS   
      if ((void *)stream->_buf != (void *)__iobuff) {
         free((void *)stream->_buf);
      }
#else         
		free((void *)stream->_buf);
#endif   

	stream->_flags &= ~(_IOMYBUF | _IONBF | _IOLBF);

	if (buf && size <= 0) retval = EOF;
	if (!buf && (mode != _IONBF)) {
		if (size <= 0 || (buf = (char *) malloc(size)) == NULL) {
			retval = EOF;
		} else {
			stream->_flags |= _IOMYBUF;
		}
	}

	stream->_buf = (unsigned char *) buf;

	stream->_count = 0;
	stream->_flags |= mode;
	stream->_ptr = stream->_buf;

	if (!buf) {
		stream->_bufsiz = 1;
	} else {
		stream->_bufsiz = size;
	}

	return retval;
}
