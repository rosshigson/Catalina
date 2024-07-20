/*
 * fillbuf.c - fill a buffer
 */
/* $Id: fillbuf.c,v 1.7 1994/06/24 11:49:15 ceriel Exp $ */

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

int _read(int d, char *buf, int nbytes);

int
__fillbuf(register FILE *stream)
{
   static unsigned char ch[FOPEN_MAX];
   register int i;

#if STATIC_IO_BUFFERS
   if (__iolock == -1) {
      __iolock = _locknew();
   }

   if (__iolock == -1) {
      return EOF;
   }
#endif

   stream->_count = 0;
   if (fileno(stream) < 0) return EOF;
   if (io_testflag(stream, (_IOEOF | _IOERR ))) return EOF; 
   if (!io_testflag(stream, _IOREAD)) {
      stream->_flags |= _IOERR;
      return EOF;
   }
   if (io_testflag(stream, _IOWRITING)) {
      stream->_flags |= _IOERR;
      return EOF;
   }

   if (!io_testflag(stream, _IOREADING))
      stream->_flags |= _IOREADING;
   
   if (!io_testflag(stream, _IONBF) && !stream->_buf) {
#if STATIC_IO_BUFFERS
      _acquire_lock(__iolock);
      if (stream == stdin) {
         stream->_buf = (unsigned char *)&__iostdb[LINSIZ*0];
         stream->_bufsiz = LINSIZ;
      }
      else if ((stream == stdout)) {
         stream->_buf = (unsigned char *)&__iostdb[LINSIZ*1];
         stream->_bufsiz = LINSIZ;
      }
      else if ((__ioused == 0) && !(stream->_flags & _IONBF)) {
         // t_string(1,"filbuf assigning buffer to ");
         // t_integer(1, stream->_fd);
         // t_char(1,'\n');
         stream->_buf = (unsigned char *)__iobuff;
         stream->_bufsiz = BUFSIZ;
         __ioused = 1;
      }
      if (!stream->_buf) {
         stream->_flags |= _IONBF;
      }
      else {
         stream->_flags |= _IOMYBUF;
      }
      _release_lock(__iolock);
#else      
      stream->_buf = (unsigned char *) malloc(BUFSIZ);
      if (!stream->_buf) {
         stream->_flags |= _IONBF;
      }
      else {
         stream->_flags |= _IOMYBUF;
         stream->_bufsiz = BUFSIZ;
      }
#endif      
   }

   /* flush line-buffered output when filling an input buffer */
   for (i = 0; i < FOPEN_MAX; i++) {
#if STATIC_IO_BUFFERS
      if (io_testflag(&__iotab[i], _IOLBF))
         if (io_testflag(&__iotab[i], _IOWRITING))
            (void) fflush(&__iotab[i]);
#else
      if (__iotab[i] && io_testflag(__iotab[i], _IOLBF))
         if (io_testflag(__iotab[i], _IOWRITING))
            (void) fflush(__iotab[i]);
#endif      
   }

   if (!stream->_buf) {
      stream->_buf = &ch[fileno(stream)];
      stream->_bufsiz = 1;
   }
   stream->_ptr = stream->_buf;
   stream->_count = _read(stream->_fd, (char *)stream->_buf, stream->_bufsiz);

   if (stream->_count <= 0){
      if (stream->_count == 0) {
         stream->_flags |= _IOEOF;
      }
      else 
         stream->_flags |= _IOERR;

      return EOF;
   }
   stream->_count--;

   return *stream->_ptr++;
}
