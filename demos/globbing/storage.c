#include "storage.h"

#define DOSFS_DEBUG

VOLINFO vi;

uint32_t pstart;
char storageInitialized;
uint8_t fatscratch[SECTOR_SIZE];


//#define MATCH_FUNCTION strstr
#define MATCH_FUNCTION amatch

int mountFatVolume(void) {
   uint32_t psize;
   uint8_t pactive, ptype;

   memset(fatscratch,0,SECTOR_SIZE);

   // look for the magic byte
   if (DFS_ReadSector(0,fatscratch,0,1)) {
      printf("mountFatVolume() - Could not read sector!\n");
      return -1;
   }
   else {
      if (   fatscratch[0x1C2] == 0x0B || // win95 fat32
            fatscratch[0x1C2] == 0x0C || // win95 fat32 lba
            fatscratch[0x1C2] == 0x04 || // fat16 < 32m
            fatscratch[0x1C2] == 0x06 || // fat16
            fatscratch[0x1C2] == 0x0E ) // win95 fat16 lba
      {
         // the partition seemed to contain a fat32 partition
         // so we may now query it for the start of the volume
         pstart = DFS_GetPtnStart(0, fatscratch, 0, &pactive, &ptype, &psize);

      }
      else {
         printf("mountFatVolume() - Warning, FAT16/32 partition not found!\n Mounting might be unreliable!\n");

         // the card may be formatted as a floppy without
         // a partition table.
         // this isn't a very safe method but we do it anyway
         pstart = 0;
      }
   }


   if (pstart == 0xFFFFFFFF)
      printf("Cannot find first partition\n");
   else {
      if (DFS_GetVolInfo(0, fatscratch, pstart, &vi)) {
         printf("Could not find partition table!\n");
         return -1;
      }
      else {
         #ifdef DOSFS_DEBUG
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
      }
   }
   return 0;
}          

void listDir(char *dir, char *filter) {
   DIRINFO di;
   DIRENT de;

   if (!storageInitialized) {
      printf("Storage not initialized!");
      return;
   }

   memset(fatscratch,0,SECTOR_SIZE);
   di.scratch = fatscratch;
   if (DFS_OpenDir(&vi, (unsigned char *)dir, &di)) {
      printf("Error opening %s directory\n", dir);
   }
   else {
      printf("Contents of directory '%s'\n",dir);
      while(!DFS_GetNext(&vi, &di, &de)) {
         if(de.name[0]) {
            if (strlen(filter) > 0) {
               if (MATCH_FUNCTION(de.name, filter) != 0)
                  printf("\tentry: %-11.11s \n",de.name);
            }
            else
               printf("\tentry: %-11.11s \n",de.name);
         }
      }
   }
}

uint32_t printFile(char *filepath) {
   uint32_t res;
   FILEINFO fi;
   uint8_t readbuffer[SECTOR_SIZE];
   uint32_t bytesread, i;

   if (!storageInitialized) {
      printf("Storage not initialized!");
      return -1;
   }
   memset(fatscratch,0,SECTOR_SIZE);
   if ((res = DFS_OpenFile(&vi, (unsigned char *)filepath, DFS_READ, fatscratch, &fi))) {
      printf("error opening file for read, err %d\n", res);
   }
   else {
      do {
         res = DFS_ReadFile(&fi, fatscratch, readbuffer, &bytesread, SECTOR_SIZE);
         for (i = 0; i < bytesread; i++) {
            putchar(readbuffer[i]);
            //if (i % 76 == 0)
            //   printf("\n");
         }
      } while (res != DFS_EOF && bytesread >= SECTOR_SIZE);
   }
   return res;
}




/* NOTE: listDirStart & listDirNext use static variables - this means
 *       that only one caller can use listDirStart & listDirNext at a time. 
 *
 */

static DIRINFO sdi;
static DIRENT  sde;
static char    snm[12];

/*
 * The caller must call listDirStart once. If it returns 0 (success)
 * then that user can call listDirNext until it returns NULL.
 */

int listDirStart(char *dir) {

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

char *listDirNext(char *filter) {
      while (!DFS_GetNext(&vi, &sdi, &sde)) {
         if(sde.name[0]) {
            if (strlen(filter) > 0) {
               if (MATCH_FUNCTION(sde.name, filter) != 0) {
                  sprintf(snm, "%-11.11s",sde.name);
                  return snm;
               }
            }
            else {
               sprintf(snm, "%-11.11s",sde.name);
               return snm;
            }
         }
      }
      return NULL;
}
