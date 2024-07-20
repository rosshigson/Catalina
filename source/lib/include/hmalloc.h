/*
 * hmalloc.h - Hub RAM version of malloc functions
 *
 * see the file hub_malloc.c for full details
 */

#if	!defined(_HMALLOC_H)
#define	_HMALLOC_H

#include <stdlib.h>

#if !defined(__CATALINA_P2) && !defined(__CATALINA_LARGE)
#error HUB_MALLOC IS ONLY SUPPORTED IN XMM LARGE MODE ON THE PROPELLER 1
#endif

void		*hub_calloc(size_t _nmemb, size_t _size);
void		hub_free(void *_ptr);
void		*hub_malloc(size_t _size);
void		*hub_realloc(void *_ptr, size_t _size);

#endif	/* _HMALLOC_H */
