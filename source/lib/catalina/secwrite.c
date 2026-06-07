#include <plugin.h>

int sd_sectwrite(char *buffer, long sector) {
   char local[512];
   int i;
   int retval;

   retval = _long_service_2(SVC_SD_INIT, 0, 0);
   if (retval != 0) {
      return retval;
   }

   for (i = 0; i < 512; i++) {
      local[i] = buffer[i];
   }
   retval = _long_service_2(SVC_SD_WRITE, (long)local, sector);
   return (retval == 3) ? 0 : retval;
}
