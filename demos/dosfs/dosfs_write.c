#include "stdint.h"
#include <cog.h>
#include <sd.h>
#include <dosfs.h>

#define WRITE_RETRIES 10

#if DEBUG_WRITESECTOR

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}
#endif

static void wait100ms() {
   _waitcnt(_cnt() + _clockfreq()/10);
}

char xdigit(int i) {
   if (i >= 10) {
      return i - 10 + 'A';
   }
   else {
      return i + '0';
   }
}

uint32_t DOSFS_WriteSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int result;
   int i, j;

#if DEBUG_WRITESECTOR
   t_string(1, "\nDOSFS_WriteSector ");
   t_integer(1, sector);
   t_string(1, "\n");
   for (i = 0; i < SECTOR_SIZE; i++) {
      t_char(1, xdigit((buffer[i]>>4) & 0xf));
      t_char(1, xdigit(buffer[i] & 0xf));
      if (((i+1)&0x1f) == 0) {
         t_char(1, '\n'); // 32 entries, then newline
      }
      else {
         t_char(1, ' ');
      }
   }
   t_char(1, '\n');
   press_to_continue();
#endif

#if DOSFS_CAN_COUNT
   if (count == 1) {
      for (j = 0; j < WRITE_RETRIES; j++) {
         if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
            break;
         }
         else {
#if DEBUG_WRITESECTOR
            t_printf("WRITE ERROR = %X\n", result);
#endif
            wait100ms();
         }
      }
   }
   else {
      for (i = 0; i < count; i++) {
         for (j = 0; j < WRITE_RETRIES; j++) {
            if ((result = sd_sectwrite((char *)(buffer + 512*i), sector + i)) == 0) {
               break;
            }
            else {
#if DEBUG_WRITESECTOR
               t_printf("WRITE ERROR = %X\n", result);
#endif
               wait100ms();
            }
      }
   }
#else
   for (j = 0; j < WRITE_RETRIES; j++) {
      if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
          break;
      }
      else {
#if DEBUG_WRITESECTOR
         t_printf("WRITE ERROR = %X\n", result);
#endif
         wait100ms();
      }

   }
#endif
   return result;
}
