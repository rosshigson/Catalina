/*
 * fclose.c - flush a stream and close the file
 */
/* $Id: fclose.c,v 1.5 1994/06/24 11:48:38 ceriel Exp $ */

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

int _close(int d);

int
fclose(FILE *fp)
{
   register int i, retval = 0;

#if STATIC_IO_BUFFERS
   if (__iolock == -1) {
      __iolock = _locknew();
   }

   if (__iolock == -1) {
      return EOF;
   }

   _acquire_lock(__iolock);

   for (i=0; i<FOPEN_MAX; i++)
      if (fp == &__iotab[i]) {
         break;
      }
   if (i >= FOPEN_MAX) {
      retval = EOF;
      goto done;
   }
   if (fflush(fp)) retval = EOF;
   if (_close(fileno(fp))) retval = EOF;
   // t_string(1,"closing - flags = 0x");
   // t_hex(1, fp->_flags);
   // t_char(1,'\n');
   if (io_testflag(fp,_IOMYBUF) && fp->_buf) {
      if ((fp->_buf) == (unsigned char *)__iobuff) {
         // this is the shared buffer
         // t_string(1,"close releasing buffer from ");
         // t_integer(1, fp->_fd);
         // t_char(1,'\n');
         __ioused = 0;
      }
      else if (fp->_fd >= 2) {
         // this is not stdin or stdout
         // TBD ... should really deallocate this buffer, but ...
         // free((void *)fp->_buf);
      }
      fp->_buf = 0;
   }
   fp->_flags = 0;

done:
   _release_lock(__iolock);
   return retval;
#else      
   for (i=0; i<FOPEN_MAX; i++)
      if (fp == __iotab[i]) {
         __iotab[i] = 0;
         break;
      }
   if (i >= FOPEN_MAX)
      return EOF;
   if (fflush(fp)) retval = EOF;
   if (_close(fileno(fp))) retval = EOF;
   if ( io_testflag(fp,_IOMYBUF) && fp->_buf )
      free((void *)fp->_buf);
   if (fp != stdin && fp != stdout && fp != stderr)
      free((void *)fp);
   return retval;
#endif   
}
