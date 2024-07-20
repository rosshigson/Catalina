#include <sd.h>

/*
 * SD calls : write a sector
 */
unsigned long sd_sectwrite(char * buffer, long sector) {

#ifdef __CATALINA_LARGE

   int i;
   int retval;
   char local[__CATALINA_SECTOR_SIZE];

   for (i = 0; i < __CATALINA_SECTOR_SIZE; i++) {
      local[i] = buffer[i];;
   }
	retval = _long_service_2(SVC_SD_WRITE, (long)local, sector);
   return retval;

#else

	return _long_service_2(SVC_SD_WRITE, (long)buffer, sector);

#endif

}
