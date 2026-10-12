/*
 * Simple program to demonstrate the FatFs f_mkfs() and f_fdisk() functions.
 * 
 * A formatted or unformatted SD card can be used. The program will create
 * two partitions on the drive if FF_MULTI_PARTITION == 1 - the first can
 * be FAT32 or exFAT and the second will always be exFAT. Otherwise one 
 * partition will be created, which can be FAT32 or exFAT. The program
 * will prompt for the volume name(s) to use.
 *
 * NOTE THAT ALL DATA ON THE SD CARD WILL BE LOST!
 *
 * Build the program with a command like:
 *
 *    catalina -p2 -lci -C SD -C99 testmkfs.c ff.c ffsystem.c \
 *       ffunicode.c diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c \
 *       sd_ioctl.c sd_size.c crc7.c int64.c
 *
 * Then load and execute it using Catalyst, or use payload. For example:
 *
 *    payload -o2 -i testmkfs
 *
 */
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sd.h>
#include <prop.h>
#include <hmi.h>

#include "ff.h"
#include "diskio.h"

void press_key_to_continue() {
   t_printf("Press a key to continue ...");
   k_wait();
   t_printf("\n\n");
}

// get a valid label (for the specified format), up to 11 chars. 
// Invalid characters (apart from backspace) are ignored. 
void get_label(char *prompt, char *label, int format) {
  int n = 0;
  char ch;
  char invalid_fat32[] = "\"*+,/:;<=>?\\[]|.";
  char invalid_exfat[] = "\\/:*?\"<>|";

  t_string(1, prompt);
  while (1) {
    ch = k_wait();
    if ((ch == 8) && (n > 0)) {
      t_char(1, ch);
      t_char(1, ' ');
      t_char(1, ch);
      n -= 1;
    }
    else if ((ch == '\r') || (ch == '\n')) {
      t_char(1,'\n');
      break;
    }
    else if (isprint(ch) 
         && ((format==FM_FAT32) ? (strchr(invalid_fat32, ch) == NULL)
                                : (strchr(invalid_exfat, ch) == NULL))) {
      t_char(1, ch);
      if (n < 12) {
         label[n] = ch;
         n += 1;
      }
    }
  }
  label[n] = 0;
}

#if FF_MULTI_PARTITION
   /* Volume mapping table defined by user (required when FF_MULTI_PARTITION == 1) */
   PARTITION VolToPart[] = {
       {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
       {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
   };

#endif

void main() {

   int format;
   int key;
   char label0[14] = "0:";
   char label1[14] = "1:";
   FATFS fs;

   _waitsec(1); // delay for terminal emulator

   t_printf("FatFs Format Test Program\n\n");
   t_printf("Insert an SD card to be formatted - NOTE THAT ALL DATA WILL BE LOST!\n");
   press_key_to_continue();

   while (key == 0) {
      t_printf("Press 1 to format partition 0 as FAT32, or 2 to format it as exFAT\n");
      key = k_wait();
      if (key == '1') {
         format = FM_FAT32;
      }
      else if (key == '2') {
         format = FM_EXFAT;
      }
      else {
         t_printf("Invalid response - try again\n");
         key = 0;
      }
   }
   t_printf("\n");

   BYTE work[FF_MAX_SS*10];         /* Working buffer */

   FRESULT result;

#if FF_MULTI_PARTITION

   /* Initialize a brand-new disk drive mapped to physical drive 0 */
   LBA_t plist[] = 
      // 4Gb 1st partition, remainder for 2nd partition ...
      // Note - the first partition must be >= 4Gb, otherwise 
      //        f_disk() creates a FAT16 partition, not FAT32
      {LL_INIT(0, 0x800000), LL_INIT(0, 100), LL_INIT(0, 0)}; 

      // some other possibilities ...

      // Divide the drive into 2 ...
      // {LL_INIT(0, 50), LL_INIT(0, 50), LL_INIT(0, 0)}; 
 
      // 256M sectors for 1st partition,  remainder for 2nd partition ...
      // {LL_INIT(0, 0x10000000), LL_INIT(0, 100), LL_INIT(0, 0)}; 
 
      // 20% for 2 partitions each, remainder not allocated ...
      // {LL_INIT(0, 20), LL_INIT(0, 20), LL_INIT(0, 0)}; 

   // use 32k cluster size if FAT32, otherwise use default ...
   MKFS_PARM params1 = {format, 2, 0, 0, (format == FM_FAT32 ? 32*1024 : 0)}; 
   MKFS_PARM params2 = {FM_EXFAT, 2, 0, 0, 0};

   get_label("Label for partition 0: ", label0+2, format);
   get_label("Label for partition 1: ", label1+2, FM_EXFAT);
   t_printf("\n");

   result = f_fdisk(0, plist, work);  /* Divide the physical drive 0 */
   if (result == FR_OK) {
      t_printf("Disk Partitioned ok\n");
   }
   else {
      t_printf("Disk Partitioning failed\n");
      t_printf("f_fdisk() returned %d\n", result);
      t_printf("\nCannot continue - exiting\n");
      exit(1);
   }

   t_printf("\nFormatting - NOTE THAT THIS OPERATION MAY TAKE A LONG TIME! ...\n\n");

   /* Create volume on the partition 0 */
   result = f_mkfs("0:", &params1, work, sizeof work);
   if (result != FR_OK) {
      t_printf("Formatting failed\n");
      t_printf("First f_mkfs() returned %d\n", result);
      t_printf("\nCannot continue - exiting\n");
      exit(1);
   }
   
   /* Create exFAT volume on the partition 1 */
   result = f_mkfs("1:", &params2, work, sizeof work);
   if (result == FR_OK) {
      t_printf("Formatting completed ok\n");
   }
   else {
      t_printf("Formatting failed\n");
      t_printf("Second f_mkfs() returned %d\n", result);
      t_printf("\nCannot continue - exiting\n");
      exit(1);
   }
   t_printf("\n");

   /* set volume labels */
   if (strlen(label0) > 2) {
      result = f_mount(&fs, "0:", 1); // force mount the first partition
      if (result != FR_OK) {
         t_printf("f_mount() returned %d\n\n", result);
      }
      else {
         t_string(1,"Setting Label: \"");
         t_string(1, label0);
         t_string(1,"\"\n\n");
         result = f_setlabel(label0);
         if (result != FR_OK) {
            t_printf("Failed to set label of partition 0, result %d\n", result);
         }
         f_unmount("0:");
      }
   }
   if (strlen(label1) > 2) {
      result = f_mount(&fs, "1:", 1); // force mount the first partition
      if (result != FR_OK) {
         t_printf("f_mount() returned %d\n\n", result);
      }
      else {
         t_string(1,"Setting Label: \"");
         t_string(1, label1);
         t_string(1,"\"\n\n");
         result = f_setlabel(label1);
         if (result != FR_OK) {
            t_printf("Failed to set label of partition 1, result %d\n", result);
         }
         f_unmount("1:");
      }
   }

#else

   MKFS_PARM params = {format, 2, 0, 0, 0};

   get_label("Label for partition 0: ", label0+2, format);
  
   t_printf("\nFormatting - NOTE THAT THIS OPERATION MAY TAKE A LONG TIME! ...\n\n");

   /* Create volume on partition 0 */
   result = f_mkfs("", &params, work, sizeof work);
   if (result == FR_OK) {
      t_printf("Formatting completed OK\n");
   }
   else {
      t_printf("f_mkfs() returned %d\n", result);
      t_printf("\nCannot continue - exiting\n");
      exit(1);
   }

   /* set volume labels */
   if (strlen(label0) > 2) {
      result = f_mount(&fs, "0:", 1); // force mount the first partition
      if (result != FR_OK) {
         t_printf("f_mount() returned %d\n\n", result);
      }
      else {
         t_string(1,"Setting Label: \"");
         t_string(1, label0);
         t_string(1,"\"\n\n");
         result = f_setlabel(label0);
         if (result != FR_OK) {
            t_printf("Failed to set label of partition 0, result %d\n", result);
         }
         f_unmount("0:");
      }
   }

#endif

   t_printf("\nAll operations complete - exiting\n");
   exit(0);
}
