#include <dosfs.h>
#include <time.h>

/*
  Get time in 32 bit FAT format
*/
uint32_t DFS_FATtime() {
   time_t t;
   struct tm *stm;

   t = time(NULL);

   /* IMPORTANT NOTE: We really should call localtime() here, so that the
    * file stamps are always in the local time as determined by the
    * current time zone - but doing so pulls in too much additional code 
    * to be practical on the Propeller 1, so instead we call gmtime(), 
    * which means all file stamps will be in the raw CLOCK or RTC time.
    * In practice, it should make no difference, since it is unlikely
    * that the clock would be set to UTC and then the C time zone would
    * be used to adjust that to local time.
    */
   //stm = localtime(&t);
   stm = gmtime(&t);

   if (stm->tm_year < 100) {
      // no RTC or CLOCK not set, so use DOSFS default time
      return (0x34210820); // 01:01:00am, Jan 1, 2006.
   }
   else {
      return (
         // assume RTC or that CLOCK has been set, so use it
         (uint32_t)(stm->tm_year - 80) << 25 |
         (uint32_t)(stm->tm_mon + 1) << 21 |
         (uint32_t)stm->tm_mday << 16 |
         (uint32_t)stm->tm_hour << 11 |
         (uint32_t)stm->tm_min << 5 |
         (uint32_t)stm->tm_sec >> 1
      );
   }
}


