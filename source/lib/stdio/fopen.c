/*
 * fopen.c - open a stream
 */
/* $Id: fopen.c,v 1.9 1994/06/24 11:49:28 ceriel Exp $ */

#include   <stdio.h>
#include   <stdlib.h>
#include   "loc_incl.h"

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

#define   PMODE      0666

/* The next 3 defines are true in all UNIX systems known to me.
 */
#define   O_RDONLY   0
#define   O_WRONLY   1
#define   O_RDWR     2

/* Since the O_CREAT flag is not available on all systems, we can't get it
 * from the standard library. Furthermore, even if we know that <fcntl.h>
 * contains such a flag, it's not sure whether it can be used, since we
 * might be cross-compiling for another system, which may use an entirely
 * different value for O_CREAT (or not support such a mode). The safest
 * thing is to just use the Version 7 semantics for open, and use creat()
 * whenever necessary.
 *
 * Another problem is O_APPEND, for which the same holds. When "a"
 * open-mode is used, an lseek() to the end is done before every write()
 * system-call.
 *
 * The O_CREAT, O_TRUNC and O_APPEND given here, are only for convenience.
 * They are not passed to open(), so the values don't have to match a value
 * from the real world. It is enough when they are unique.
 */
#define   O_CREAT    0x010
#define   O_TRUNC    0x020
#define   O_APPEND   0x040

int _open(const char *path, int flags);
int _creat(const char *path, int mode);
int _close(int d);

FILE *
fopen(const char *name, const char *mode)
{
   register int i;
   int rwmode = 0, rwflags = 0;
   FILE *stream = NULL;
   int fd, flags = 0;

#if STATIC_IO_BUFFERS
   if (__iolock == -1) {
      __iolock = _locknew();
   }

   if (__iolock == -1) {
      goto error;
   }

   _acquire_lock(__iolock);

   for (i = 0; __iotab[i]._flags != 0; i++) 
      if ( i >= FOPEN_MAX-1 )
         goto error;
#else   
   for (i = 0; __iotab[i] != 0 ; i++) 
      if ( i >= FOPEN_MAX-1 )
         return (FILE *)NULL;
#endif
   switch(*mode++) {
   case 'r':
      flags |= _IOREAD | _IOREADING;   
      rwmode = O_RDONLY;
      break;
   case 'w':
      flags |= _IOWRITE | _IOWRITING;
      rwmode = O_WRONLY;
      rwflags = O_CREAT | O_TRUNC;
      break;
   case 'a': 
      flags |= _IOWRITE | _IOWRITING | _IOAPPEND;
      rwmode = O_WRONLY;
      rwflags |= O_APPEND | O_CREAT;
      break;         
   default:
#if STATIC_IO_BUFFERS
      goto error;
#else      
      return (FILE *)NULL;
#endif      
   }

   while (*mode) {
      switch(*mode++) {
      case 'b':
         continue;
      case '+':
         rwmode = O_RDWR;
         flags |= _IOREAD | _IOWRITE;
         continue;
      /* The sequence may be followed by additional characters */
      default:
         break;
      }
      break;
   }

   /* Perform a creat() when the file should be truncated or when
    * the file is opened for writing and the open() failed.
    */
   if ((rwflags & O_TRUNC)
       || (((fd = _open(name, rwmode)) < 0)
          && (rwflags & O_CREAT))) {
      if (((fd = _creat(name, PMODE)) > 0) && flags  | _IOREAD) {
         (void) _close(fd);
         fd = _open(name, rwmode);
      }
         
   }

#if STATIC_IO_BUFFERS
   if (fd < 0) goto error;

   stream = &__iotab[fd];

#else      
   if (fd < 0) return (FILE *)NULL;

   if (( stream = (FILE *) malloc(sizeof(FILE))) == NULL ) {
      _close(fd);
      return (FILE *)NULL;
   }
#endif      

   if ((flags & (_IOREAD | _IOWRITE))  == (_IOREAD | _IOWRITE))
      flags &= ~(_IOREADING | _IOWRITING);

   stream->_count = 0;
   stream->_fd = fd;
   stream->_flags = flags;
   stream->_buf = NULL;
#if STATIC_IO_BUFFERS
        _release_lock(__iolock);
   return stream;
error:
   if (__iolock != -1) {
      _release_lock(__iolock);
   }
   return stream;
#else
   __iotab[i] = stream;
   return stream;
#endif
}
