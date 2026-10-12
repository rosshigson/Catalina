#include <stdint.h>
#include <cog.h>
#include <sd.h>
#include "ff.h"
#include "diskio.h"
#include <string.h>
#include <stdio.h>

unsigned SD_get_kilobytes();

// NOTE: This code supports only FAT32 and exFAT volumes 
//       up to 2^32-1 kilobytes, and a sector size of 512 bytes
int SD_disk_ioctl(BYTE *buff, BYTE pdrv, BYTE cmd) {
   char sector_buff[SECTOR_SIZE]; // In Catalina sectors are always 512 bytes!
   WORD sign;
   BYTE b;
   WORD sector_size;
#if FF_LBA64
   QWORD maxlba;
#else
   DWORD maxlba;
#endif  
   int i;
   unsigned size_in_kb;

   switch (cmd) {
      case GET_SECTOR_COUNT:
         if ((size_in_kb = SD_get_kilobytes()) == 0) {
            return RES_ERROR;
         }
#if FF_LBA64
         maxlba = _mul(_uint32(size_in_kb), _uint32(2));
         *(QWORD *)(buff) = maxlba;
#else
         maxlba = size_in_kb*2;
         *(DWORD *)(buff) = maxlba;
#endif           
         break;
      case GET_SECTOR_SIZE:
         *(WORD*)buff = SECTOR_SIZE;
         break;
      case GET_BLOCK_SIZE:
         *(DWORD*)buff = 1; // not known
         break;
      default:
         break;
   }
   return RES_OK;
}

