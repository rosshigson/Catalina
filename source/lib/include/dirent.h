#ifndef _DIRENT_H
#define _DIRENT_H 1

/* This limited version of dirent supports only those functions required 
 * by Cake - i.e.:
 *
 *    realpath()
 *    opendir()
 *    closedir()
 *    readdir()
 *
 *  This version uses static variables and is NOT re-entrant or safe for 
 *  multi-processing!
 */

#include <sys/types.h> // for off_t
#include <dosfs.h>

enum
{
    DT_UNKNOWN = 0,
    DT_FIFO    = 1,
    DT_CHR     = 2,
    DT_DIR     = 4,
    DT_BLK     = 6,
    DT_REG     = 8,
    DT_LNK     = 10,
    DT_SOCK    = 12,
    DT_WHT     = 14
};

struct dirent
{
    ino_t d_ino;             /* Inode number */
    off_t d_off;             /* Not an offset; see below */
    unsigned short d_reclen; /* Length of this record */
    unsigned char d_type;    /* Type of file */
    char d_name[MAX_PATH];   /* Null-terminated filename */
};

struct TAGDIR;

typedef struct TAGDIR DIR;

char* realpath(const char* path, char* resolved_path);

DIR* opendir(const char* name);

int closedir(DIR* dirp);

struct dirent* readdir(DIR* dirp);

#endif // _DIRENT_H
