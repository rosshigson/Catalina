#if	!defined(_SYS_STAT_H)
#define	_SYS_STAT_H

#include <sys/types.h>

/*
 * make a leaf directory (no recursion)
 * NOTE: mode not currently used
 */
extern int _mkdir(const char *pathname, mode_t mode);

/*
 * make a directory, recursing as necessary (i.e. creating intermediates)
 * NOTE: mode not currently used
 */
extern int _mkdirr(const char *pathname, mode_t mode);

#define mkdir(pathname, mode) _mkdir(pathname, mode)

#define mkdirr(pathname, mode) _mkdirr(pathname, mode)

#endif
