#ifndef STORAGE_H
#define STORAGE_H

#include <stdio.h>
#include <string.h>
#include <dosfs.h>
#include <ctype.h>


/*
 * mountFatVolume : mount the file system. Must be called before any
 *                  other storage call.
 *
 *                  Returns:
 *                    -1 error (e.g. could not read sector or partition table)
 *                     0 Unknown file system or no partition found
 *                     1 FAT12
 *                     2 FAT16
 *                     3 FAT32
 */
extern int mountFatVolume(void);

/*
 * doFile is a function that accepts an unsigned char * file name, an 
 * unsigned integer set of DOSFS attributes, and an unsigned long size, and 
 * returns void. It is the prototype for the function required by doDir.
 */
typedef void (*doFile)(unsigned char *name, 
                       unsigned int   attr, 
                       unsigned long  size);

/*
 * doDir : process a directory by calling func on every matching file name
 */
extern void doDir(unsigned char *dir, unsigned char *filter, doFile func);

/*
 * listDir : an example of using doDir - it simply prints each file name
 */
extern void listDir(unsigned char *dir, unsigned char *filter);

/*
 * listDirStart and listDirNext return the name of each file in the 
 * specified directory that match the specified filter. 
 *
 * listDirStart must be called once before listDirNext. listDirNext
 * can then be called multiple times. It will returns a pointer to a 
 * static copy of the matching filename, or NULL if there are no more
 * matches.
 */
extern int listDirStart(unsigned char *dir);
extern unsigned char *listDirNext(unsigned char *filter);

#endif
