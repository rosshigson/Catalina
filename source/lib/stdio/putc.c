/*
 * putc.c - print (or buffer) one character
 */

#include	<stdio.h>

int
(putc)(int c, FILE *stream)
{
#if __CATALINA_SIMPLE_IO
	return catalina_putc(c, stream);
#else
   if (--(stream)->_count >= 0) {
      return (int) (*(stream)->_ptr++ = (c));
   }
   else {
      return __flushbuf((c),(stream));
   }
#endif
}
