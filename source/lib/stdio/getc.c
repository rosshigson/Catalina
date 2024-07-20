/*
 * getc.c - read an unsigned character
 */

#include	<stdio.h>

int
(getc)(FILE *stream)
{
#if __CATALINA_SIMPLE_IO
   return catalina_getc(stream);
#else
	if (--(stream)->_count >= 0) {
      return (int) (*(stream)->_ptr++);
   }
   else {
      return __fillbuf(stream);
   }
#endif
}
