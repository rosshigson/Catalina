#include <sd.h>

volatile int berry_p2_sd_read_diag_phase;
volatile int berry_p2_sd_read_diag_response;
volatile int berry_p2_sd_read_diag_token;

/*
 * SD calls : read a sector
 */
unsigned long sd_sectread(char * buffer, long sector) {

#ifdef __CATALINA_LARGE

   int i;
   int retval;
   char local[__CATALINA_SECTOR_SIZE];

	berry_p2_sd_read_diag_phase = SVC_SD_READ;
	berry_p2_sd_read_diag_token = 1;
	retval = _long_service_2(SVC_SD_READ, (long)local, sector);
	berry_p2_sd_read_diag_response = retval;
	berry_p2_sd_read_diag_token = 0;
   for (i = 0; i < __CATALINA_SECTOR_SIZE; i++) {
      buffer[i] = local[i];
   }
   return retval;

#else

	berry_p2_sd_read_diag_phase = SVC_SD_READ;
	berry_p2_sd_read_diag_token = 1;
	berry_p2_sd_read_diag_response = _long_service_2(SVC_SD_READ, (long) buffer, sector);
	berry_p2_sd_read_diag_token = 0;
	return berry_p2_sd_read_diag_response;

#endif

}
