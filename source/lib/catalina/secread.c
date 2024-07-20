#include <sd.h>

/*
 * SD calls : read a sector
 */
unsigned long sd_sectread(char * buffer, long sector) {

#ifdef __CATALINA_LARGE

   int i;
   int retval;
   char local[__CATALINA_SECTOR_SIZE];

	retval = _long_service_2(SVC_SD_READ, (long)local, sector);
   for (i = 0; i < __CATALINA_SECTOR_SIZE; i++) {
      buffer[i] = local[i];
   }
   return retval;

#else

	return _long_service_2(SVC_SD_READ, (long) buffer, sector);

#endif

}
