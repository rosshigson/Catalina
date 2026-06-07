#include <sd.h>
#include <stdint.h>
#include <prop.h>
#ifdef __CATALINA_LARGE
#include <hmalloc.h>
#endif

#define SD_SERVICE_TIMEOUT_SPINS 10000000u

#ifdef __CATALINA_LARGE
static char *sd_sector_read_buffer;
static volatile long *sd_service_params;

static char *sd_sector_read_buffer_get(void)
{
   if (sd_sector_read_buffer == 0) {
      sd_sector_read_buffer = (char *)hub_malloc(__CATALINA_SECTOR_SIZE);
   }
   return sd_sector_read_buffer;
}

static volatile long *sd_service_params_get(void)
{
   if (sd_service_params == 0) {
      sd_service_params = (volatile long *)hub_malloc(2 * sizeof(long));
   }
   return sd_service_params;
}
#endif

static unsigned long sd_service_2_timed(long svc, long par1, long par2)
{
   unsigned short entry;
   unsigned int code;
   unsigned int cog;
   unsigned int lock;
   unsigned int spins;
   int have_lock = 0;
   volatile request_t *request;
   volatile long *params;
#ifndef __CATALINA_LARGE
   static volatile long params_storage[2];
#endif

   entry = *SERVICE_POINTER(svc);
   code = (unsigned int)(entry & 0x7fu);
   if (code == 0) {
      return (unsigned long)-1;
   }

   cog = ((unsigned int)entry >> 12) & 0x0fu;
   lock = ((unsigned int)entry >> 7) & 0x1fu;
   request = REQUEST_BLOCK(cog);
   if (request == 0) {
      return (unsigned long)-1;
   }
   if (request->request != 0) {
      return (unsigned long)-2;
   }

   if (lock < LOCK_MAX) {
      if (!_locktry((int)lock)) {
         return (unsigned long)-2;
      }
      have_lock = 1;
   }

#ifdef __CATALINA_LARGE
   params = sd_service_params_get();
   if (params == 0) {
      if (have_lock) {
         _lockrel((int)lock);
      }
      return (unsigned long)-1;
   }
#else
   params = params_storage;
#endif
   params[0] = par1;
   params[1] = par2;
   request->response = 0;
   request->request = (code << 24) | ((unsigned int)(uintptr_t)params & 0x00ffffffu);

   spins = SD_SERVICE_TIMEOUT_SPINS;
   while (request->request != 0) {
      if (--spins == 0) {
         request->request = 0;
         if (have_lock) {
            _lockrel((int)lock);
         }
         return (unsigned long)-3;
      }
   }

   if (have_lock) {
      _lockrel((int)lock);
   }
   return (unsigned long)request->response;
}

/*
 * SD calls : read a sector
 */
unsigned long sd_sectread(char * buffer, long sector) {

#ifdef __CATALINA_LARGE

   int i;
   int retval;
   char *bounce;

   bounce = sd_sector_read_buffer_get();
   if (bounce == 0) {
      return (unsigned long)-1;
   }

   retval = sd_service_2_timed(SVC_SD_READ, (long)bounce, sector);
   for (i = 0; i < __CATALINA_SECTOR_SIZE; i++) {
      buffer[i] = bounce[i];
   }
   return retval;

#else

   return sd_service_2_timed(SVC_SD_READ, (long)buffer, sector);

#endif

}
