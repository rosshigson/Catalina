#include <stdint.h>
#include <cog.h>
#include <sd.h>
#include "dosfs.h"

#define READ_RETRIES 10

#if DEBUG_READSECTOR

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}
#endif

static void wait100ms() {
   _waitcnt(_cnt() + _clockfreq()/10);
}

uint32_t DOSFS_ReadSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int i, j;
   int result;

#if DEBUG_READSECTOR
   t_string(1, "\nDOSFS_ReadSector ");
   t_integer(1, sector);
   t_string(1, "\n");
#endif

#if DOSFS_CAN_COUNT
   if (count == 1) {
      for (j = 0; j < READ_RETRIES; j++) {
         if ((result = sd_sectread((char *)buffer, sector)) == 0) {
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
   else {
      for (i = 0; i < count; i++) {
         for (j = 0; i < READ_RETRIES; i++) {
            if ((result = sd_sectread((char *)(buffer + 512*i), sector + i)) == 0) {
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
   }
#else
   for (j = 0; j < READ_RETRIES; j++) {
      if ((result = sd_sectread((char *)buffer, sector)) == 0) {
#if DEBUG_READSECTOR
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
          break;
      }
      else {
#if DEBUG_READSECTOR
         t_printf("READ ERROR = %X\n", result);
#endif
         wait100ms();
      }
   }
#endif
   return result;
}


