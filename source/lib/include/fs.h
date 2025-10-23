#ifndef _FS__H
#define _FS__H

#include <sys/types.h> 
#include <stdio.h>
#include <dosfs.h>

/* 
 * set DEBUG_FS to 1 for debug info (libraries must be recompiled)
 */
#define __CATALINA_DEBUG_FS 0

#if __CATALINA_SDCARD_IO

#if STATIC_FILE_BUFFERS
extern FILEINFO __fdtab[FOPEN_MAX];
#else
extern PFILEINFO __fdtab[FOPEN_MAX];
#endif

extern uint32_t __pstart;  // will be -1 until an sd card is mounted

extern VOLINFO  __vi;      // information of mounted sd card

#endif

/*
 * mount must be called (once) before any file system access.
 * (unit and pnum are normally left as zero). Note that only
 * SD cards WITH AN MBR are supported. 
 */
extern int _mount(int unit, int pnum);

/*
 * unmount must be called (once) before another SD card can be mounted.
 */
extern int _unmount();

/*
 * open an unmanaged file and return the file number (unmanaged files require
 * a pointer to a FILEINFO structure to be provided unless static file buffers
 *  are in use, in which case the fd parameter is ignored).
 * 
 * The mode can be:
 *    0 - read only
 *    1 - write only
 *    2 - read and write
 */
extern int _open_unmanaged(const char *path, int flags, PFILEINFO fd);

/*
 * close an unmanaged file using the file number. Files that were opened 
 * unmanaged must be closed unmanaged.
 */
extern int _close_unmanaged(int d);

/*
 * open a managed file and return the file number (managed files have the 
 * FILEINFO structure allocated and managed internally - which requires that
 * malloc be used by the program). The file must be closed using the managed 
 * close function. 
 *
 * The mode can be:
 *    0 - read only
 *    1 - write only
 *    2 - read and write
 */
extern int _open(const char *path, int flags);

/* 
 * close a managed file (managed files have the FILEINFO structure allocated
 * and managed internally). The file must have been opened using the managed
 * open function.
 */
extern int _close(int d);

/*
 * read from a file.
 */
extern int _read(int d, char *buf, int nbytes);

/*
 * write to a file.
 */
extern int _write(int d, const char *buf, int nbytes);

/*
 * seek within a file.
 */
extern off_t _lseek(int d, off_t offset, int whence);

/*
 * create and open a new unmanaged file and return the file number (unmanaged 
 * files require a pointer to a FILEINFO structure to be provided).
 *
 * The mode can be:
 *    0 - read only
 *    1 - write only
 *    2 - read and write
 */
extern int _create_unmanaged(const char *path, int mode, PFILEINFO fd);

/*
 * create and open a new managed file (unmanaged files require
 * a pointer to a FILEINFO structure to be provided unless static file buffers
 * are in use, in which case the fd parameter is ignored). The file must be 
 * closed using the managed close function.
 *
 * NOTE: _create() is the same as _creat()
 *
 * The mode can be:
 *    0 - read only
 *    1 - write only
 *    2 - read and write
 */
extern int _create(const char *path, int mode);

/*
 * create a new directory. The path to the new directory must already exist 
 * (i.e. only the last element of the path name is created) and a directory 
 * must not already exist with that name.
 */
extern int _create_directory(const char *path);

/*
 * rename a file from path to newname. The new name must not already
 * exist.
 */
extern int _rename(const char *path, const char *newname);

/*
 * unlink (delete) a file.
 */
extern int _unlink(const char *path);

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

/*
 * _load_overlay - load a blob stored in a named overlay file 
 *                 and with a specified size to a specified 
 *                 Hub RAM address.
 */
extern int _load_overlay (char *filename, void *addr, int size);

/*
 * _load_overlay_unmanaged - load a blob stored in a named overlay file 
 *                 and with a specified size to a specified Hub RAM address, 
 *                 but using Catalina file system functions rather than stdio.
 *
 *                 NOTE that _mount MUST be called before using this function.
 */
extern int _load_overlay_unmanaged (char *filename, void *addr, int size);

#endif
