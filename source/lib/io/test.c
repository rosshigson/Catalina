/*
 * Simple program to demonstrate some basic DOSFS functionality.
 *
 * Be sure to compile with the extended library, to make sure the DOSFS 
 * functions are available, and also that the SD Card plugin is loaded. 
 *
 * Also, if too many tests are enabled, the program will be too large to 
 * execute correctly as a TINY or COMPACT program, and will have to be 
 * compiled and loaded as a SMALL or LARGE program. For example (asuming 
 * you are using a DRACBLADE and have built the utilities for the DRACBLADE 
 * using the 'build_utilies' command):
 *
 *    catalina test_dosfs.c -lcix -C DRACBLADE -C TTY -C LARGE
 *    payload xmm test_dosfs
 *
 */
#include "stdint.h"
#include <stdio.h>
#include <string.h>
#include <dosfs.h>
#include <hmi.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

/*
 * Undefine these to disable various tests 
 */ 
#define INFO_TEST
#define ENUMERATION_TEST
#define RENAME_TEST
#define UNLINK_TEST
#define WRITE_TEST
#define READ_TEST


/*
 * Define configiration parameters for various tests
 */
#define RW_FILE         "test.txt"
#define ENUMERATION_DIR "bin"
#define RENAME_FILE     "test.txt"
#define UNLINK_FILE     "test.txt"


void press_key_to_continue() {
   t_printf("Press a key to continue ...");
   k_wait();
   t_printf("\n\n");
}

/*
 * return a pointer to a formatted filename
 */
char * filename(uint8_t *entry) {
   static char name[12];
   int i;
   int j;
  
   j = 0;

   if (entry[0] != 0) {
      for (i = 0; i < 11; i++) {
         if (entry[i] != ' ') {
            name[j++] = entry[i];
         }
         if ((i == 7) && (strncmp((char *)&entry[8],"   ", 3) != 0)) {
            name[j++] = '.';
         }
      }
   }
   name[j] = 0;
   return name;

}
   

int main() {

   uint8_t sector[SECTOR_SIZE], sector2[SECTOR_SIZE];
   uint32_t pstart, psize, i;
   uint8_t pactive, ptype;
   VOLINFO vi;
   DIRINFO di;
   DIRENT de;
   uint32_t cache;
   FILEINFO fi;
   uint8_t *p;
 
   t_printf("DOSFS Test Program\n");
   press_key_to_continue();

   // Obtain pointer to first partition on first (only) unit
   pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
   if (pstart == 0xffffffff) {
      t_printf("Cannot find first partition\n");
      return -1;
   }

   t_printf("Partition 0 start sector 0x%X active %X type %X size %X\n", pstart, pactive, ptype, psize);

   if (DFS_GetVolInfo(0, sector, pstart, &vi)) {
      t_printf("Error getting volume information\n");
      return -1;
   }

#ifdef INFO_TEST  
//------------------------------------------------------------
// Information Test
   t_printf("\nInformation test\n");
   press_key_to_continue();

   t_printf("Volume label '%s'\n", vi.label);
   t_printf("%d sector/s per cluster, %d reserved sector/s, volume total %d sectors.\n", vi.secperclus, vi.reservedsecs, vi.numsecs);
   t_printf("%d sectors per FAT, first FAT at sector #%d, root dir at #%d.\n",vi.secperfat,vi.fat1,vi.rootdir);
   t_printf("(For FAT32, the root dir is a CLUSTER number, FAT12/16 it is a SECTOR number)\n");
   t_printf("%d root dir entries, data area commences at sector #%d.\n",vi.rootentries,vi.dataarea);
   t_printf("%u clusters (%u bytes) in data area, filesystem is ", vi.numclusters, vi.numclusters * vi.secperclus * SECTOR_SIZE);
   if (vi.filesystem == FAT12)
      t_printf("FAT12.\n");
   else if (vi.filesystem == FAT16)
      t_printf("FAT16.\n");
   else if (vi.filesystem == FAT32)
      t_printf("FAT32.\n");
   else
      t_printf("[unknown]\n");

#endif

#ifdef RENAME_TEST
//------------------------------------------------------------
// Simple rename test
   t_printf("\nRename test\n");
   press_key_to_continue();

   i = DFS_RenameFile(&vi, (unsigned char *)RENAME_FILE, (unsigned char *)"ROSS.TXT",sector);
   t_printf("Rename result = %d\n", i);
   i = DFS_RenameFile(&vi, (unsigned char *)"ROSS.TXT", (unsigned char *)RENAME_FILE,sector);
   t_printf("Rename result = %d\n", i);

#endif
   
#ifdef ENUMERATION_TEST   

//------------------------------------------------------------
// Directory enumeration test
   t_printf("\nDirectory Enumeration test\n");
   press_key_to_continue();

   di.scratch = sector;
   if (DFS_OpenDir(&vi, (uint8_t *)"", &di)) {
      t_printf("Error opening root directory\n");
   }
   else {
      t_printf("\nRoot directory:\n");
      while (!DFS_GetNext(&vi, &di, &de)) {
         if (de.name[0] != 0)
            t_printf("file: %s\n", filename(de.name));
      }
   }
      t_printf("\nDirectory %s:\n", ENUMERATION_DIR);
   if (DFS_OpenDir(&vi, (uint8_t *)ENUMERATION_DIR, &di)) {
      t_printf("Error opening subdirectory\n");
   }
   else {
      while (!DFS_GetNext(&vi, &di, &de)) {
         if (de.name[0])
            t_printf("file: %s\n", filename(de.name));
      }
   }

#endif

#ifdef UNLINK_TEST
//------------------------------------------------------------
// Unlink test
   t_printf("\nUnlink test\n");
   press_key_to_continue();

   cache = 0;
   //t_printf("*** FAT BEFORE ***\n");
   //for (i=0;i<vi.numclusters;i++) {
      //t_printf("entry %x, %X\n", i, DFS_GetFAT(&vi, sector, &cache, i));
   //}
   if (DFS_UnlinkFile(&vi, (uint8_t *)UNLINK_FILE, sector)) {
      t_printf("error unlinking file\n");
   }
   //t_printf("*** FAT AFTER ***\n");
   //for (i=0;i<vi.numclusters;i++) {
      //t_printf("entry %x, %X\n", i, DFS_GetFAT(&vi, sector, &cache, i));
   //}
   di.scratch = sector;
   if (DFS_OpenDir(&vi, (uint8_t *)"", &di)) {
      t_printf("Error opening root directory\n");
   }
   else {
      while (!DFS_GetNext(&vi, &di, &de)) {
         if (de.name[0] != 0)
            t_printf("file: %s\n", filename(de.name));
      }
   }
#endif

#ifdef WRITE_TEST   
//------------------------------------------------------------
// File write test
   t_printf("\nFile Write test\n");
   press_key_to_continue();

   if (DFS_OpenFile(&vi, (uint8_t *)RW_FILE, DFS_WRITE, sector, &fi)) {
      t_printf("error opening file\n");
   }
   else {
      for (i=0;i<18;i++) {
         memset(sector2, 128+i, SECTOR_SIZE);
         DFS_WriteFile(&fi, sector, sector2, &cache, SECTOR_SIZE/2);
         memset(sector2+256, 255-i, SECTOR_SIZE/2);
         DFS_WriteFile(&fi, sector, sector2+256, &cache, SECTOR_SIZE/2);
         t_printf("sector %d\n",i);
      }
      memcpy(sector2, "test string at the end...\0", 26);
      DFS_WriteFile(&fi, sector, sector2, &cache, 26);
   }

#endif

#ifdef READ_TEST   

//------------------------------------------------------------
// File read test
   t_printf("\nFile Read test\n");
   press_key_to_continue();

   if (DFS_OpenFile(&vi, (uint8_t *)RW_FILE, DFS_READ, sector, &fi)) {
      t_printf("error opening file\n");
      p = (void *) malloc(512);
      memset(p, 0xaa, 512);
   }
   else { 
      p = (void *) malloc(fi.filelen+512);
      memset(p, 0xaa, fi.filelen+512);

      DFS_ReadFile(&fi, sector, p, &i, fi.filelen);
      t_printf("read complete %d bytes (expected %d) pointer %d\n", i, fi.filelen, fi.pointer);
   }

#endif
   
   t_printf("\nAll tests done!\n");

   while(1) ;

   return 0;
}
