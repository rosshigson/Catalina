/*
 * flushbuf.c - flush a buffer
 */
/* $Id: flushbuf.c,v 1.9 1996/04/24 13:06:00 ceriel Exp $ */

#include   <stdio.h>
#include   <stdlib.h>
#include   "loc_incl.h"

#include   <sys/types.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

off_t _lseek(int fildes, off_t offset, int whence);
int _write(int d, const char *buf, int nbytes);
int _isatty(int d);
extern void (*_clean)(void);

static int
do_write(int d, char *buf, int nbytes)
{
   int c;

   /* POSIX actually allows write() to return a positive value less
      than nbytes, so loop ...
   */
   while ((c = _write(d, buf, nbytes)) > 0 && c < nbytes) {
      nbytes -= c;
      buf += c;
   }
   return c > 0;
}

static unsigned char *get_buf() {
#if STATIC_IO_BUFFERS
   unsigned char *retval;

   if (__iolock == -1) {
      __iolock = _locknew();
   }

   if (__iolock == -1) {
      return 0;
   }
   _acquire_lock(__iolock);
   if (__ioused == 0) {
      retval = (unsigned char *)__iobuff;
      __ioused = 1;
   }
   else {
      retval = 0;
   }
   _release_lock(__iolock);
   return retval;

#else   
  return malloc(BUFSIZ);
#endif
}

int
__flushbuf(int c, FILE * stream)
{
   _clean = __cleanup;
   if (fileno(stream) < 0) return EOF;
   if (!io_testflag(stream, _IOWRITE)) return EOF;
   if (io_testflag(stream, _IOREADING) && !feof(stream)) return EOF;

   stream->_flags &= ~_IOREADING;
   stream->_flags |= _IOWRITING;
   if (!io_testflag(stream, _IONBF)) {
      if (!stream->_buf) {
#if STATIC_IO_BUFFERS         
         if (stream == stdin) {
            stream->_buf = (unsigned char *)&__iostdb[LINSIZ*0];
            stream->_flags |= _IOFBF|_IOMYBUF;
            stream->_bufsiz = BUFSIZ;
            stream->_count = -1;
         }
         else if (stream == stdout) {
            stream->_buf = (unsigned char *)&__iostdb[LINSIZ*1];
            if (_isatty(fileno(stdout))) {
               stream->_flags |= _IOLBF|_IOMYBUF;
            }
            else {
               stream->_flags |= _IOFBF|_IOMYBUF;
            }
            stream->_bufsiz = BUFSIZ;
            stream->_count = -1;
         } 
         else if (stream == stderr) {
            stream->_buf = (unsigned char *)&__iostdb[LINSIZ*2];
            stream->_flags |= _IONBF;
            stream->_count = -1;
         }
#else
         if (stream == stdout && _isatty(fileno(stdout))) {
            if (!(stream->_buf = get_buf())) {
               stream->_flags |= _IONBF;
            } else {
               stream->_flags |= _IOLBF|_IOMYBUF;
               stream->_bufsiz = BUFSIZ;
               stream->_count = -1;
            }
         }
#endif         
         else {
            if (!(stream->_buf = get_buf())) {
               stream->_flags |= _IONBF;
            } else {
               // if (stream->_buf == (unsigned char *)&__iobuff[2*BUFSIZ]) {
                  // t_string(1,"flushbuf assigning buffer to ");
                  // t_integer(1, stream->_fd);
                  // t_char(1,'\n');
               // }
               stream->_flags |= _IOMYBUF;
               stream->_bufsiz = BUFSIZ;
               if (!io_testflag(stream, _IOLBF))
                  stream->_count = BUFSIZ - 1;
               else   stream->_count = -1;
            }
         }
         stream->_ptr = stream->_buf;
      }
   }

   if (io_testflag(stream, _IONBF)) {
      char c1 = c;

      stream->_count = 0;
      if (io_testflag(stream, _IOAPPEND)) {
         if (_lseek(fileno(stream), 0L, SEEK_END) == -1) {
            stream->_flags |= _IOERR;
            return EOF;
         }
      }
      if (_write(fileno(stream), &c1, 1) != 1) {
         stream->_flags |= _IOERR;
         return EOF;
      }
      return (unsigned char) c;
   } else if (io_testflag(stream, _IOLBF)) {
      *stream->_ptr++ = c;
      /* stream->_count has been updated in putc macro. */
      if (c == '\n' || stream->_count == -stream->_bufsiz) {
         int count = -stream->_count;

         stream->_ptr  = stream->_buf;
         stream->_count = 0;

         if (io_testflag(stream, _IOAPPEND)) {
            if (_lseek(fileno(stream), 0L, SEEK_END) == -1) {
               stream->_flags |= _IOERR;
               return EOF;
            }
         }
         if (! do_write(fileno(stream), (char *)stream->_buf,
               count)) {
            stream->_flags |= _IOERR;
            return EOF;
         }
      }
   } else {
      int count = stream->_ptr - stream->_buf;

      stream->_count = stream->_bufsiz - 1;
      stream->_ptr = stream->_buf + 1;

      if (count > 0) {
         if (io_testflag(stream, _IOAPPEND)) {
            if (_lseek(fileno(stream), 0L, SEEK_END) == -1) {
               stream->_flags |= _IOERR;
               return EOF;
            }
         }
         if (! do_write(fileno(stream), (char *)stream->_buf, count)) {
            *(stream->_buf) = c;
            stream->_flags |= _IOERR;
            return EOF;
         }
      }
      *(stream->_buf) = c;
   }
   return (unsigned char) c;
}
