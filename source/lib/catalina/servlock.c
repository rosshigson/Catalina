#include <cog.h>
#include <plugin.h>

/*
 * set one or more service locks. If lock >= 0, it will be used for 
 * all services. Otherwise a different lock will be allocated for
 * each plugin. 
 *
 * Returns 0 on success, or -1 on error (e.g. if there are not enough 
 * locks available).
 */
int _set_service_lock(int new_lock) {
   int i, svc;
   unsigned short *entry;
   int cog, old_lock, code;
   int lock_used[COG_MAX];

   for (i = 0; i < COG_MAX; i++) {
      lock_used[i] = -1;
   }

   for (svc = 1; svc <= SVC_MAX; svc++) {
      entry = SERVICE_POINTER(svc);
      code  = SERVICE_CODE(svc);
      if (code > 0) {
         // this service is in use
         old_lock = SERVICE_LOCK(svc);
         if (old_lock >= LOCK_MAX) {
            // no lock allocated for this service
            cog = SERVICE_COG(svc);
            if (lock_used[cog] == -1) {
               if (new_lock >= 0) {
                  // use the lock we were given
                  lock_used[cog] = new_lock;
               }
               else {
                  // allocate a lock for the cog providing this service
                  lock_used[cog] = _locknew();
                  if (lock_used[cog] == -1) {
                     // no more locks available
                     return -1; 
                  }
               }
            }
            // update the service entry with the lock
            *entry = (unsigned short)((cog<<12) | (lock_used[cog]<<7) | code);
         }
      }
   }
   return 0;
}
