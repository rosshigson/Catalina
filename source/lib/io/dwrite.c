#include "stdint.h"
#include <cog.h>
#include <dosfs.h>

#if defined(__CATALINA_PSRAM) || defined(__CATALINA_HYPER)
#include <cache_sd.h>
#define WRITE_RETRIES 1 // retries are handled within the cache
#define sectwrite cached_sectwrite
#else
#include <sd.h>
#define WRITE_RETRIES 10
#define sectwrite sd_sectwrite
#endif

#if __CATALINA_DEBUG_DOSFS

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}
#endif

static void wait100ms() {
   _waitcnt(_cnt() + _clockfreq()/10);
}

static char xdigit(int i) {
   if (i >= 10) {
      return i - 10 + 'A';
   }
   else {
      return i + '0';
   }
}

uint32_t DFS_WriteSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int result;
   int i, j, k;

#if DOSFS_CAN_COUNT
   if (count == 1) {
      for (j = 0; j < WRITE_RETRIES; j++) {
         if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
#if __CATALINA_DEBUG_DOSFS
            t_string(1, "\nDFS_WriteSector ");
            t_integer(1, sector);
            t_string(1, "\n");
            for (k = 0; k < SECTOR_SIZE; k++) {
               t_char(1, xdigit((buffer[k]>>4) & 0xf));
               t_char(1, xdigit(buffer[k] & 0xf));
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
#if __CATALINA_DEBUG_DOSFS
            t_printf("WRITE ERROR = %X\n", result);
#endif
            wait100ms();
         }
      }
   }
   else {
      for (i = 0; i < count; i++) {
         for (j = 0; j < WRITE_RETRIES; j++) {
            if ((result = sectwrite((char *)(buffer + SECTOR_SIZE*i), sector + i)) == 0) {
#if __CATALINA_DEBUG_DOSFS
               t_string(1, "\nDFS_WriteSector ");
               t_integer(1, sector);
               t_string(1, "\n");
               for (k = 0; k < SECTOR_SIZE; k++) {
                  t_char(1, xdigit((buffer[sector_buffer*i+k]>>4) & 0xf));
                  t_char(1, xdigit(buffer[sector_buffer*i+k] & 0xf));
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
#if __CATALINA_DEBUG_DOSFS
               t_printf("WRITE ERROR = %X\n", result);
#endif
               wait100ms();
            }
         }
      }
   }
#else
   for (j = 0; j < WRITE_RETRIES; j++) {
      if ((result = sectwrite((char *)buffer, sector)) == 0) {
#if __CATALINA_DEBUG_DOSFS
         t_string(1, "\nDFS_WriteSector ");
         t_integer(1, sector);
         t_string(1, "\n");
         for (k = 0; k < SECTOR_SIZE; k++) {
            t_char(1, xdigit((buffer[k]>>4) & 0xf));
            t_char(1, xdigit(buffer[k] & 0xf));
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
#if __CATALINA_DEBUG_DOSFS
         t_printf("WRITE ERROR = %X\n", result);
#endif
         wait100ms();
      }

   }
#endif
   return result;
}
