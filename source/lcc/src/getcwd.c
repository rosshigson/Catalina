#ifdef __CATALINA__

#include <stddef.h>
#include <errno.h>

char *getcwd(char *buf, size_t size) {
   if (size > 0) {
      buf[0] = '\0';
      return buf;
   }
   else {
      errno = ERANGE;
      return NULL;
   }
}

#endif
