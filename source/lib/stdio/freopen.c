/*
 * freopen.c - open a file and associate a stream with it
 */
/* $Id: freopen.c,v 1.9 1994/06/24 11:49:53 ceriel Exp $ */

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

#define	PMODE		0666

/* Do not "optimize" this file to use the open with O_CREAT if the file
 * does not exist. The reason is given in fopen.c.
 */
#define	O_RDONLY	0
#define	O_WRONLY	1
#define	O_RDWR		2

#define	O_CREAT		0x010
#define	O_TRUNC		0x020
#define	O_APPEND	0x040

int _open(const char *path, int flags);
int _creat(const char *path, int mode);
int _close(int d);

FILE *
freopen(const char *name, const char *mode, FILE *stream)
{
	register int i;
	int rwmode = 0, rwflags = 0;
	int fd, flags = stream->_flags & (_IONBF | _IOFBF | _IOLBF | _IOMYBUF);

	(void) fflush(stream);				/* ignore errors */
	(void) _close(fileno(stream));

	switch(*mode++) {
	case 'r':
		flags |= _IOREAD;	
		rwmode = O_RDONLY;
		break;
	case 'w':
		flags |= _IOWRITE;
		rwmode = O_WRONLY;
		rwflags = O_CREAT | O_TRUNC;
		break;
	case 'a': 
		flags |= _IOWRITE | _IOAPPEND;
		rwmode = O_WRONLY;
		rwflags |= O_APPEND | O_CREAT;
		break;         
	default:
		return (FILE *)NULL;
	}

	while (*mode) {
		switch(*mode++) {
		case 'b':
			continue;
		case '+':
			rwmode = O_RDWR;
			flags |= _IOREAD | _IOWRITE;
			continue;
		/* The sequence may be followed by aditional characters */
		default:
			break;
		}
		break;
	}

	if ((rwflags & O_TRUNC)
	    || (((fd = _open(name, rwmode)) < 0)
		    && (rwflags & O_CREAT))) {
		if (((fd = _creat(name, PMODE)) < 0) && flags | _IOREAD) {
			(void) _close(fd);
			fd = _open(name, rwmode);
		}
	}

   // TBD - is there a bug here? It lookse like fd may not be initialized
   //       unless rwflags includes O_TRUNC

#if STATIC_IO_BUFFERS
   if (fd < 0) {
		for( i = 0; i < FOPEN_MAX; i++) {
			if (stream == &__iotab[i]) {
				__iotab[i]._flags = 0;
				break;
			}
		}
#else
   if (fd < 0) {
		for( i = 0; i < FOPEN_MAX; i++) {
			if (stream == __iotab[i]) {
				__iotab[i] = 0;
				break;
			}
		}
		if (stream != stdin && stream != stdout && stream != stderr)
			free((void *)stream);
#endif      
		return (FILE *)NULL;
	}

	stream->_count = 0;
	stream->_fd = fd;
	stream->_flags = flags;
	return stream;
}
