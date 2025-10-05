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
 * strdup - duplicate a string.
 * Params: _s - string to duplicate
 * Returns: malloced duplicate.
 */
char *strdup(const char *_s)
{
  register char  *dup;
  register size_t len;

  len = strlen(_s) + 1;
  dup = malloc(len);
  if (dup) {
    memcpy(dup, _s, len);
  }

  return dup;
}



