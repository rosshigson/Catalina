/*
 * Simple program to demonstrate some basic FatFs file functionality. It is 
 * intentionally very similar to the DOSFS Test program (in demos\dosfs).
 *
 * This program tests the first partition (partition 0, which is the default)
 * and should work whether or not FF_MULTI_PARTITION is set to 1 in ffconf.h
 *
 * An SD Card formatted as FAT or exFAT can be used. For the directory 
 * enumeration test, the card should contain a 'bin' directory with some 
 * files in it. The other tests create and then delete their own test files.
 *
 * This program uses the version of FatFs in this directory. It also requires 
 * the 64 bit integer support, so a stand-alone version of the int64 support
 * functions is provided. An SD Card plugin must be loaded, which can be done 
 * by either linking with the extended libraries (-lcx or -lcix) or defining 
 * the Catalina symbol SD (this is done automatically by the build script 
 * included with this test program). 
 *
 * Build the program with a command like:
 *
 *    catalina -p2 -lci -C SD -C99 test_par0.c ff.c ffsystem.c \
 *       ffunicode.c diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c \
 *       sd_ioctl.c sd_size.c crc7.c int64.c
 *
 * Then load and execute it using Catalyst, or use payload. For example:
 *
 *    payload -o2 -i test_par0
 *
 * The CLOCK symbol can be defined to perform timed tests.
 *
 */
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sd.h>
#include <prop.h>
#include <hmi.h>
#ifdef __CATALINA_CLOCK
#include <time.h>
#endif

#include "ff.h"
#include "diskio.h"

/*
 * Undefine these to disable various tests 
 */ 
#define INFO_TEST
#define WRITE_TEST
#define READ_TEST
#define RENAME_TEST
#define UNLINK_TEST
#define ENUMERATION_TEST

/*
 * Define configuration parameters for various tests
 */
#define RW_FILE         "long file name to test.txt"
#define RENAME_FILE     "long file name to test.txt"
#define UNLINK_FILE     "long file name to test.txt"
#define ENUMERATION_DIR "bin"

#define SECTORS_TO_WRITE 20

#if FF_MULTI_PARTITION

   /* Volume mapping table defined by user (required when FF_MULTI_PARTITION == 1) */
   PARTITION VolToPart[] = {
       {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
       {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
   };

#endif

void press_key_to_continue() {
   t_printf("Press a key to continue ...");
   k_wait();
   t_printf("\n\n");
}

// SD_get_kilobytes can be used to detect if a formatted SD card is present
unsigned SD_get_kilobytes();
  
void main() {

   uint8_t sector[SECTOR_SIZE];
   UINT i, j;
   FATFS fs;
   FRESULT result;
   DIR  dp;
   FIL  fp;
   FILINFO fi;
   UINT fsize;
   uint8_t *p;
   char ch;
   char str[128];
   DWORD free_clust;
   FATFS *f;
#ifdef __CATALINA_CLOCK
   int start_time, stop_time;
#endif

   _waitsec(1); // delay for terminal emulator

   t_printf("FatFs Test Program\n\n");
   t_printf("Insert a suitably formatted SD card\n");
   press_key_to_continue();

   if (SD_get_kilobytes() == 0) {
     t_printf("SD card not detected - Aborting\n");
     exit(1);
   }

   while(1) {

   // mount the file system
   result = f_mount(&fs, "", 1); // force mount the first partition
   if (result != FR_OK) {
      t_printf("f_mount() returned %d\n\n", result);
      t_printf("Cannot mount SD card - is an SD card inserted?\n");
   }

#ifdef INFO_TEST  
//------------------------------------------------------------
// Information Test
   t_printf("\nInformation test\n");
   press_key_to_continue();

   /* Get volume label of the default drive */
   result = f_getlabel("", str, NULL);
   if (result == FR_OK) {
      t_printf("Volume label is \"%s\"\n", str);
   }
   else {
      t_printf("Error fetching volume label\n");
   }

   t_printf("Filesystem Type is ");
   if (fs.fs_type == FS_FAT12)
      t_printf("FAT12.\n");
   else if (fs.fs_type == FS_FAT16)
      t_printf("FAT16.\n");
   else if (fs.fs_type == FS_FAT32)
      t_printf("FAT32.\n");
   else if (fs.fs_type == FS_EXFAT)
      t_printf("exFAT.\n");
   else
      t_printf("[unknown]\n");

   t_printf("%d FATs\n", fs.n_fats);
   t_printf("%d Cluster size (sectors)\n", fs.csize);
   t_printf("%d Current directory start cluster\n", fs.cdir);
   t_printf("%d FAT entries (number of clusters + 2)\n", fs.n_fatent);
   t_printf("%d Sectors per FAT\n", fs.fsize);
   result = f_getfree("",&free_clust, &f);
   if (result == FR_OK) {
      t_printf("%d free sectors\n", free_clust*fs.csize);
   }
   else {
      t_printf("Cannot determine free space, result=%d\n", result);
   }
#endif

#ifdef WRITE_TEST   
//------------------------------------------------------------
// File write test
   t_printf("\nFile Write test\n");
   press_key_to_continue();

   result = f_open(&fp, RW_FILE, FA_WRITE | FA_OPEN_ALWAYS);
   if (result != FR_OK) {
      t_printf("Error opening file \"%s\"\n", RW_FILE);
   }
   else {
#ifdef __CATALINA_CLOCK
      start_time = clock();
#endif
      for (i = 0; i < SECTORS_TO_WRITE; i++) {
         memset(sector, (128+i)%256, SECTOR_SIZE);
         result = f_write(&fp, sector, SECTOR_SIZE/2, &j);
         if (result != FR_OK) {
            t_printf("f_write result = %d\n", result);
         }
         if (j != SECTOR_SIZE/2) {
            t_printf("f_printf wrote only %d bytes (expected to write %d)\n", j, SECTOR_SIZE/2);
         }
         memset(sector+256, (255-i)%256, SECTOR_SIZE/2);
         result = f_write(&fp, sector+256, SECTOR_SIZE/2, &j);
         if (result != FR_OK) {
           t_printf("f_write result = %d\n", result);
         }
         if (j != SECTOR_SIZE/2) {
            t_printf("f_printf wrote only %d bytes (expected to write %d)\n", j, SECTOR_SIZE/2);
         }
#ifndef __CATALINA_CLOCK
         t_printf("sector %d\n",i);
#endif
      }
#ifdef __CATALINA_CLOCK
      stop_time = clock();
      t_printf("file writing took %d ms\n", stop_time - start_time);
#endif

      result = f_printf(&fp, "test string at the end...");
      f_close(&fp);
   }

#endif

#ifdef READ_TEST   
//------------------------------------------------------------
// File read test
   t_printf("\nFile Read test\n");
   press_key_to_continue();

   result = f_stat(RW_FILE, &fi);
   if (result != FR_OK) {
      t_printf("Error getting file stats\n");
   }
   else {
     fsize = _low(fi.fsize);
   }

   result = f_open(&fp, RW_FILE, FA_READ);
   if (result != FR_OK) {
      t_printf("Error opening file \"%s\"\n", RW_FILE);
   }
   else { 
      t_printf("File opened, length = %d\n", fsize);
      p = (void *) malloc(fsize+SECTOR_SIZE);
      if (p == NULL) {
         t_printf("Error allocating buffer\n");
      }
      else {
         memset(p, 0xaa, fsize+SECTOR_SIZE);
#ifdef __CATALINA_CLOCK
         start_time = clock();
#endif
         f_read(&fp, p, fsize, &i);
         t_printf("Read complete %d bytes (expected %d)\n\n", i, fsize);
         for (i = 0; i < SECTORS_TO_WRITE; i++) {
            for (j = 0; j < 256; j++) {
                if (p[SECTOR_SIZE*i + j] != (128+i)%256) {
                   t_printf("error in read at %d - expected %d, got %d\n", SECTOR_SIZE*i + j, (128+i)%256, (p[SECTOR_SIZE*i + j]));
                   break;
                }
            }
            for (j = 256; j < SECTOR_SIZE; j++) {
                if (p[SECTOR_SIZE*i + j] != (255-i)%256) {
                   t_printf("error in read at %d - expected %d, got %d\n", SECTOR_SIZE*i + j, (255-i)%256, (p[SECTOR_SIZE*i + j]));
                   break;
                }
            }
         }
#ifdef __CATALINA_CLOCK
         stop_time = clock();
         t_printf("file reading took %d ms\n\n", stop_time - start_time);
#endif
         if (strncmp((const char *)&p[SECTOR_SIZE*i], "test string at the end...", 25) == 0) {
            t_printf("Test string at end of file is ok.\n");
         }
         else {
            t_printf("Test string at end of file INCORRECT.\n");
         }
      }
      free(p);
   }

#endif
   
#ifdef RENAME_TEST
//------------------------------------------------------------
// Simple rename test
   t_printf("\nRename test\n");
   press_key_to_continue();

   result = f_rename(RENAME_FILE, "Ross Higson.txt");
   if (result == FR_OK) {
      t_printf("File renamed ok\n");
   }
   else {
      t_printf("Rename failed, result = %d\n", result);
   }
   result = f_rename("Ross Higson.txt", RENAME_FILE);
   if (result == FR_OK) {
      t_printf("File renamed ok\n");
   }
   else {
      t_printf("Rename failed, result = %d\n", result);
   }

#endif
   
#ifdef ENUMERATION_TEST   
//------------------------------------------------------------
// Directory enumeration test
   t_printf("\nDirectory Enumeration test\n");
   press_key_to_continue();

   result = f_findfirst(&dp, &fi, "", "*");
   if (result != FR_OK) {
      t_printf("Error opening root directory\n");
   }
   else {
      t_printf("\nRoot directory:\n");
      do {
         if (strlen(fi.fname) != 0) {
            t_printf("file: \"%s\"\n", fi.fname);
         }
         else {
            break; // a null name means we are finished
         }
         result = f_findnext(&dp, &fi);
      } while (result == FR_OK);
   }
   result = f_findfirst(&dp, &fi, ENUMERATION_DIR, "*");
   if (result != FR_OK) {
      t_printf("Error opening directory \"%s\"\n", ENUMERATION_DIR);
   }
   else {
      t_printf("\nDirectory %s:\n", ENUMERATION_DIR);
      do {
         if (strlen(fi.fname) != 0) {
            t_printf("file: %s\n", fi.fname);
         }
         else {
            break; // a null name means we are finished
         }
         result = f_findnext(&dp, &fi);
      } while (result == FR_OK);
   }

#endif

#ifdef UNLINK_TEST
//------------------------------------------------------------
// Unlink test
   t_printf("\nUnlink test\n");
   press_key_to_continue();

   result = f_unlink(UNLINK_FILE);
   if (result == FR_OK) {
      t_printf("File deleted ok\n");
   }
   else {
      t_printf("Error unlinking file, result = %d\n", result);
   }
#endif

   t_printf("\nAll tests done - restart [Y/n]?\n");
   ch = toupper(k_wait());
   if (ch == 'N') {
      t_printf("Exiting ... \n\n\n");
      exit(0);
   }
   else {
      t_printf("Restarting ... \n\n\n");
   }

   f_unmount(""); // unmount the partition

   } 

}
