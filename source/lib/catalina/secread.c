#include <plugin.h>

int sd_sectread(char *buffer, long sector) {
   char local[512];
   int i;
   int retval;

   retval = _long_service_2(SVC_SD_INIT, 0, 0);
   if (retval != 0) {
      return retval;
   }

   retval = _long_service_2(SVC_SD_READ, (long)local, sector);
   for (i = 0; i < 512; i++) {
      buffer[i] = local[i];
   }
   return retval;
}
