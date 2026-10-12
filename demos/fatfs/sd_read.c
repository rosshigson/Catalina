#include <stdint.h>
#include <cog.h>
#include <sd.h>
#include "ff.h"
#include <hmi.h>
#include <ctype.h>

#define READ_RETRIES 10

//#define DEBUG_READSECTOR 1

#if DEBUG_READSECTOR

static char xdigit(int i) {
   if (i >= 10) {
      return i - 10 + 'A';
   }
   else {
      return i + '0';
   }
}

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}

#endif

static void wait100ms() {
   _waitcnt(_cnt() + _clockfreq()/10);
}

int SD_disk_read(BYTE *buffer, LBA_t sect64, UINT count)
{
   int i, j, k;
   int result;
   int sector;

   if (_high(sect64) != 0) {
     t_string(1, "\nsector num > 32 bits!\n");
   }
   sector = _low(sect64);

   for (i = 0; i < count; i++) {
      for (j = 0; j < READ_RETRIES; j++) {
         if ((result = sd_sectread((char *)(buffer + SECTOR_SIZE*i), sector + i)) == 0) {
#if DEBUG_READSECTOR
            t_string(1, "\nReadSector ");
            t_integer(1, sector + i);
            t_string(1, "\n");
            for (k = 0; k < SECTOR_SIZE; k++) {
               t_char(1, xdigit((buffer[SECTOR_SIZE*i+k]>>4) & 0xf));
               t_char(1, xdigit(buffer[SECTOR_SIZE*i+k] & 0xf));
               if (((k+1)&0x1f) == 0) {
                  t_char(1, '\n'); // 32 entries, then newline
               }
               else {
                  t_char(1, ' ');
               }
            }
            t_char(1, '\n');
            press_to_continue();
#endif
            break;
         }
         else {
#if DEBUG_READSECTOR
            t_printf("READ ERROR = %X\n", result);
#endif
            wait100ms();
         }
      }
   }
   return result;
}


