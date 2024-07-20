#include "storage.h"


// #define STORAGE_DEBUG          // print debugging information

// #define MATCH_FUNCTION strstr  // use simple substring matching
#define MATCH_FUNCTION amatch     // use globbing (see glob.c)


static VOLINFO vi;
static uint32_t pstart = 0;
static char storageInitialized = 0;
static uint8_t fatscratch[SECTOR_SIZE];


/*
 * mountFatVolume - mount the file system. Must be called before any
 *                  other call.
 *                  Returns:
 *                    -1 error (e.g. could not read sector or partition table)
 *                     0 Unknown file system or no partition found
 *                     1 FAT12
 *                     2 FAT16
 *                     3 FAT32
 */
int mountFatVolume(void) {
   uint32_t psize;
   uint8_t pactive, ptype;

   memset(fatscratch,0,SECTOR_SIZE);

   // look for the magic byte
   if (DFS_ReadSector(0,fatscratch,0,1)) {
      #ifdef STORAGE_DEBUG
      printf("mountFatVolume() - Could not read sector!\n");
      #endif
      return -1;
   }
   else {
      if (fatscratch[0x1C2] == 0x0B || // win95 fat32
          fatscratch[0x1C2] == 0x0C || // win95 fat32 lba
          fatscratch[0x1C2] == 0x04 || // fat16 < 32m
          fatscratch[0x1C2] == 0x06 || // fat16
          fatscratch[0x1C2] == 0x0E )  // win95 fat16 lba
      {
         // the partition seemed to contain a fat32 partition
         // so we may now query it for the start of the volume
         pstart = DFS_GetPtnStart(0, fatscratch, 0, &pactive, &ptype, &psize);

      }
      else {
         #ifdef STORAGE_DEBUG
         printf("mountFatVolume() - Warning, FAT16/32 partition not found!\n Mounting might be unreliable!\n");
         #endif

         // the card may be formatted as a floppy without
         // a partition table.
         // this isn't a very safe method but we do it anyway
         pstart = 0;
         return 0;
      }
   }


   if (pstart == 0xFFFFFFFF) {
      #ifdef STORAGE_DEBUG
      printf("Cannot find first partition\n");
      #endif
      return -1;
   }
   else {
      if (DFS_GetVolInfo(0, fatscratch, pstart, &vi)) {
         #ifdef STORAGE_DEBUG
         printf("Could not find partition table!\n");
         #endif
         return -1;
      }
      else {
         #ifdef STORAGE_DEBUG
         printf("Volume label '%-11.11s'\n", vi.label);
         printf("Volume size %d MB\n",(psize * SECTOR_SIZE) >> 20);
         printf("Filesystem: ");

         if (vi.filesystem == FAT12)
            printf("FAT12\n");
         else if (vi.filesystem == FAT16)
            printf("FAT16\n");
         else if (vi.filesystem == FAT32)
            printf("FAT32\n");
         else
            printf("[unknown]\n");
         #endif
         storageInitialized = 1;
         if (vi.filesystem == FAT12)
            return 1;
         else if (vi.filesystem == FAT16)
            return 2;
         else if (vi.filesystem == FAT32)
            return 3;
         else
            return 0;
      }
   }
}          

/*
 * buildfn : build a file name from 11 unformatted characters in src
 *           to a 12 character file name in dst, removing spaces, 
 *           inserting "." after 8 characters, and null terminating.
 *           NOTE: dst must be at least 13 chars!
 */
void buildfn(unsigned char *dst, unsigned char *src) {
   int i;
   memset(dst, 0, 13);
   for (i = 0; i < 8; i++) {
      if (src[i] != ' ') {
         *dst++ = src[i];
      }
   }
   if (strncmp(&src[8], "   ", 3) != 0) {
      *dst++ = '.';
      for (i = 8; i < 11; i++) {
         if (src[i] != ' ') {
            *dst++ = src[i];
         }
      }
   }
}

/*
 * upper : convert src to upper case in dst (dst must be long enough!)
 */
static void upper(unsigned char *dst, unsigned char *src) {
   while (*src) {
      *dst++ = toupper(*src++);
   }
   *dst = '\0';
}

/*
 * NOTE: doDir must be preceeded by a call to mountFATVolume
 */
void doDir(unsigned char *dir, unsigned char *filter, doFile func) {
   DIRINFO di;
   DIRENT de;
   unsigned char fnam[13];
   unsigned char filt[13];
   unsigned long filesize;

   // filenames are always upper case in DOSFS
   upper(filt, filter);

   if (!storageInitialized) {
      #ifdef STORAGE_DEBUG
      printf("Storage not initialized!");
      #endif
      return;
   }

   memset(fatscratch,0,SECTOR_SIZE);
   di.scratch = fatscratch;
   if (DFS_OpenDir(&vi, (unsigned char *)dir, &di)) {
      #ifdef STORAGE_DEBUG
      printf("Error opening %s directory\n", dir);
      #endif
   }
   else {
      while (!DFS_GetNext(&vi, &di, &de)) {
         if (de.name[0]) {
            buildfn(fnam, de.name);
            filesize = (((unsigned long) de.filesize_0) 
                     |  (((unsigned long) de.filesize_1) << 8)
                     |  (((unsigned long) de.filesize_2) << 16)
                     |  (((unsigned long) de.filesize_3)) << 24);
            if (strlen(filter) > 0) {
               if (MATCH_FUNCTION(fnam, filt) != 0) { 
                  (*func)(fnam, de.attr, filesize);
               }
            }
            else {
               (*func)(fnam, de.attr, filesize);
            }
         }
      }
   }
}

/*
 * listFile - function used by listDir to simply print the file name - it 
 *            ignores the file attributes and size.
 */
static void listFile(unsigned char *name, 
                     unsigned int attr,
                     unsigned long size) {
   printf("%s\n", (char *)name);
}

/*
 * NOTE: listDir must be preceeded by a call to mountFATVolume
 */
void listDir(unsigned char *dir, unsigned char *filter) {
   doDir(dir, filter, &listFile);
}

/* 
 * NOTE: listDirStart & listDirNext use static variables to maintain state - 
 *       this means that only one caller can use listDirStart & listDirNext 
 *       at a time. 
 *
 */
static DIRINFO sdi;
static DIRENT  sde;
static unsigned char snm[13];
static unsigned char fnam[13];

/*
 * NOTE: listDir must be preceeded by a call to mountFATVolume
 *       The caller must call listDirStart once. If it returns 0 (success)
 *       then that user can call listDirNext until it returns NULL.
 */
int listDirStart(unsigned char *dir) {

   if (!storageInitialized) {
      return -1;
   }

   memset(fatscratch,0,SECTOR_SIZE);
   sdi.scratch = fatscratch;
   if (DFS_OpenDir(&vi, (unsigned char *)dir, &sdi)) {
      return -1;
   }
   return 0;
}

/*
 * NOTE: listDirNext must be preceeded by a call to listDirStart
 */
unsigned char *listDirNext(unsigned char *filter) {
   unsigned char filt[13];
   while (!DFS_GetNext(&vi, &sdi, &sde)) {
      if(sde.name[0]) {
         buildfn(fnam, sde.name);
         if (strlen(filter) > 0) {
            upper(filt, filter);
            if (MATCH_FUNCTION(fnam, filt) != 0) {
               sprintf((char *)snm, "%s", fnam);
               return snm;
            }
         }
         else {
            sprintf((char *)snm, "%s", fnam);
            return snm;
         }
      }
   }
   return NULL;
}
