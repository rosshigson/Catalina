#ifndef STORAGE_H
#define STORAGE_H

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <dosfs.h>

extern VOLINFO vi;

extern uint32_t pstart;
extern char storageInitialized;
extern uint8_t fatscratch[SECTOR_SIZE];

extern int mountFatVolume(void);
extern void listDir(char *dir, char *filter);
extern uint32_t printFile(char *filepath);

extern int listDirStart(char *dir);
extern char *listDirNext(char *filter);

#endif
