/*
 * A simple MBR/Boot Sector/Directory Table  dump program.
 *
 * Compile with a command like:
 *
 *   catalina -p2 -lcix2 -lint64 read_mbr.c -C SD2
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <prop2.h>
#include <hmi.h>
#include <ctype.h>

#include "ff.h"         /* Declarations of sector size */
#include "diskio.h"     /* Declarations of disk functions */

// MBR offsets ...

#define MBR_Table     446    /* MBR: Offset of partition table in the MBR */
#define SZ_PTE         16    /* MBR: Size of a partition table entry */
#define PTE_Boot        0    /* MBR PTE: Boot indicator */
#define PTE_StHead      1    /* MBR PTE: Start head in CHS */
#define PTE_StSec       2    /* MBR PTE: Start sector in CHS */
#define PTE_StCyl       3    /* MBR PTE: Start cylinder in CHS */
#define PTE_System      4    /* MBR PTE: System ID */
#define PTE_EdHead      5    /* MBR PTE: End head in CHS */
#define PTE_EdSec       6    /* MBR PTE: End sector in CHS */
#define PTE_EdCyl       7    /* MBR PTE: End cylinder in CHS */
#define PTE_StLba       8    /* MBR PTE: Start in LBA */
#define PTE_SizLba     12    /* MBR PTE: Size in LBA */

// FAT32 boot record offsets ...
#define BOOT_BPS     0x0b /* BOOT bytes per sector (1 word) */
#define BOOT_SPC     0x0d /* BOOT sectors per cluster (1 byte) */
#define BOOT_RSV     0x0e /* BOOT reserved sectors (1 word) */
#define BOOT_n_FAT   0x10 /* BOOT number of FATs   (1 byte) */
#define BOOT_SPF     0x24 /* BOOT sectors per FAT  (4 byte) */
#define BOOT_FIL     0x30 /* BOOT sector offset of file information */

void press_key_to_continue() {
   printf("Press a key to continue ...");
   k_wait();
   printf("\n\n");
}


// SD_get_kilobytes can be used to detect if a formatted SD card is present
unsigned SD_get_kilobytes();

DRESULT SD_disk_read (BYTE* buff, LBA_t sector, UINT count);

// read sector 'lba' to buffer and dump it
DRESULT dump_sector(BYTE *buff, Int64 lba) {
   DRESULT dr;
   int i, j;

   /* read sector */
   dr = SD_disk_read(buff, lba, 1);

   if (dr) {
       printf("Failed to read sector %lu, result = %d\n\n", _low(lba), dr);
   } 
   else {
       printf("Sector %lu\n", _low(lba));
       for (i = 0; i < FF_MAX_SS; i += 16) {
         printf("%04X: ", i);
         for (j = 0; j < 16; j++) {
            printf("%02X ", buff[i + j]);
          }
         for (j = 0; j < 16; j++) {
            if (isprint(buff[i + j])) {
               printf("%c", buff[i + j]);
            }
            else {
               printf(".");
            }
          }
          printf("\n");
       }
   }
   _waitms(250);
   return dr;
}

static BYTE EXFAT_OEM[] = {'\xEB','\x76','\x90','E','X','F','A','T',' ',' ',' '};

int main(int argc, char* argv[])
{
   DRESULT dr;
   unsigned size = 0;
   unsigned short sign;
   BYTE mbr[FF_MAX_SS];
   BYTE par[FF_MAX_SS];
   BYTE fil[FF_MAX_SS];
   BYTE root[FF_MAX_SS];

   _waitsec(1); // delay for terminal emulator

   printf("SD Card MBR Reader\n\n");
   printf("Insert a suitably formatted SD card\n");
   press_key_to_continue();

   size = SD_get_kilobytes();
   if (size == 0) {
     printf("SD card not detected - Aborting\n\n");
     exit(1);
   }
   else {
     printf("SD card size is %d kb\n\n", size);
   }
  
   /* read MBR sector */
   printf("Master Boot Record: ");
   dr = dump_sector(mbr, _uint32(0));

   if (dr == 0) {
      unsigned lba;
      unsigned spc;
      unsigned fil_lba;
      unsigned root_lba;
      int type;
      int i, j;

      /* check MBR signature */
      sign = *(unsigned short*)(mbr + 510);
      if (sign == 0xAA55) {
         printf("MBR signature Valid\n");
      }
      else {
         printf("WARNING! : MBR signature Invalid\n");
      }
      /* read up to 4 partition entries */
      for (i = 0; i < 4; i++) {
         type = *(mbr + MBR_Table + SZ_PTE*i + PTE_System);
         lba = *(unsigned *)(mbr + MBR_Table + SZ_PTE*i + PTE_StLba);
         if ((type > 0) && (lba > 0)) {
            printf("\nPartition %d (type %d): ", i, type);
            /* dump boot sector */
            dr = dump_sector(par, _uint32(lba));
            if (type == 1) {
               printf("Partition is FAT12\n");
            }
            else if (type == 4) {
               printf("Partition is FAT16\n");
            }
            else if (type == 6) {
               printf("Partition is FAT12 or FAT16\n");
            }
            else if (type == 12) {
               unsigned rsv, spf,nmf;
               printf("Partition is FAT32\n");
               /* get sectors per cluster */
               spc = *(unsigned char *)(par + BOOT_SPC);
               printf("%d sectors per cluster\n", spc);
               /* get sector number of file system information from boot sector */
               fil_lba = lba + *(unsigned short *)(par + BOOT_FIL);
               /* dump file system information sector */
               printf("FAT32 File System information: ");
               dr = dump_sector(fil, _uint32(fil_lba));
               //printf("lba=%d\n", lba);
               rsv = *(unsigned short *)(par + BOOT_RSV);
               //printf("rsv=%d\n",rsv);
               nmf = *(unsigned char *)(par + BOOT_n_FAT);
               //printf("nmf=%d\n",nmf);
               spf = *(unsigned long *)(par + BOOT_SPF);
               //printf("spf=%d\n",spf);
               root_lba = lba+rsv+nmf*spf;
               //printf("Base sector of Root Directory is %ld\n", root_lba);
               /* dump root directory */
               for (j = 0; j < spc; j++) {
                  int k;
                  printf("FAT32 Root directory: ");
                  dr = dump_sector(root, _uint32(root_lba + j));
                  printf("Continue dumping Root directory? [y/N]\n");
                  k = toupper(k_wait());
                  if (k != 'Y') {
                     break;
                  }
               }
            }
            else if ((type == 7)
                 && (!memcmp(par, EXFAT_OEM, sizeof EXFAT_OEM))) {
               printf("Partition is exFAT\n");
            }
         }
      }
   }
   
   _waitsec(1); // delay for terminal emulator

   return dr;
}

