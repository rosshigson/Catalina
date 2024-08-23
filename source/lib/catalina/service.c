#include <stdlib.h>
#include <plugin.h>

#include "service.h"

/*
 * register services - regeister an array of services, which is terminated
 * by a null service (i.e. svc_id == 0). 
 *
 * The internal id is the list index + 1. e.g.
 *
 * svc_list_t my_list[] = {
 *    {"float", NULL, SHORT_SVC, SVC_COMP}, // internal index 1
 *    {"", NULL, 0, 0}
 * };
 *
 * if the lock is specified as NO_LOCK (-1), then no lock is used to protect 
 * calls to the services - otherwise use _locknew() to allocate a suitable lock
*/
void _register_services(int lock, svc_list_t list) {
   unsigned short *svc_ptr;
   int cog = _cogid();
   int n = 0;

   while (list[n].svc_id != 0) {
      svc_ptr = SERVICE_POINTER(list[n].svc_id);
      *svc_ptr =  (cog &0x0F) << 12; // 4 bits for cog
      *svc_ptr |= lock & 0x1F << 7;  // 5 bits for lock id
      *svc_ptr |= ((n+1) & 0x7F);    // 7 bits for internal id
      n++;
   }
}

