#include <stdlib.h>
#include <plugin.h>

#include "service.h"

/*
 * Char service request (2 parameters):
 */
int char_service_2 (long svc, char *par1, char *par2) {
	struct char_param_2 tmp;
   tmp.par1 = par1;
   tmp.par2 = par2;
	return _sys_plugin (-svc, (long)&tmp);
}


/*
 * register services - regeister an array of services, which is terminated
 * by a null (zero) service. The internal id is the list index + 1. e.g.
 *
 * svc_list_t my_list[] = {
 *    {"float", NULL, SHORT_SVC, SVC_COMP}, // internal index 1
 *    {"", NULL, 0, 0}
 * };
 *
 * if the lock is specified as NO_LOCK (-1), then no lock is used to protect 
 * calls to the services - otherwise use _locknew() to allocate a suitable lock
*/
void my_register_services(int lock, svc_list_t list) {
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
