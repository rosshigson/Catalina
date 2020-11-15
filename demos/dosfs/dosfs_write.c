#include "stdint.h"
#include <catalina_cog.h>
#include <catalina_sd.h>
#include <dosfs.h>

#define WRITE_RETRIES 10

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

uint32_t DOSFS_WriteSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int result;
   int i, j;

#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDSF_WriteSector ");
   t_integer(1, sector);
   t_string(1, "\n");
   press_to_continue();
#endif

#if DOSFS_CAN_COUNT
   if (count == 1) {
      for (j = 0; j < WRITE_RETRIES; j++) {
         if (result = sd_sectwrite((char *)buffer, sector) == 0) {
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
            if ((result = sd_sectwrite((char *)(buffer + 512*i), sector + i)) == 0) {
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
#else
   for (j = 0; j < WRITE_RETRIES; j++) {
      if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
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
