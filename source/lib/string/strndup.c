#include <stdlib.h> // for malloc
#include <string.h> // for memcpy

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

/*
 * strndup - duplicate a string of _n chars.
 * Params: str - string to duplicate
 * Returns: malloced duplicate of at most _n chars, terminated with a null.
 */
char *strndup(const char *_s, size_t _n)
{
   register char  *dup;
   register size_t len;

   len = strlen(_s);
   if (len > _n) {
      len = _n;
   }
   dup = malloc(len + 1);
   if (dup) {
      memcpy(dup, _s, len);
      dup[len] = '\0';
   }

   return dup;
}


