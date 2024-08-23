#ifndef _SERVICE_H
#define _SERVICE_H 1

/*
 * definitions for creating services in C or Lua that can be called via the 
 * same registry functions used for plugins. To dispatch the calls to the 
 * functions that implement these services, see the files dsptch_c.h (for 
 * C functions) or dsptch_l.h (for Lua functions).
 */
#include <plugin.h>

#define NO_LOCK -1  // no lock required (see _register_services)

// service type - identifies the profile to be used to invoke the service
typedef enum svc { 
  SHORT_SVC,        // invoke via _short_service() - returns int
  LONG_SVC,         // invoke via _long_service()  - returns int
  LONG_2_SVC,       // invoke via _long_service_2() - returns int
  FLOAT_SVC,        // invoke via _float_service()  - returns float
  LONG_FLOAT_SVC,   // invoke via _long_float_service() - returns float
  SHARED_SVC        // invoke via _short_service() - returns int
} svc_t;

// profiles for function pointers - these match plugin.h
typedef int   (*call_SHORT_SVC)(long);
typedef int   (*call_LONG_SVC)(long);
typedef int   (*call_LONG_2_SVC)(long, long);
typedef float (*call_FLOAT_SVC)(float, float);
typedef long  (*call_LONG_FLOAT_SVC)(float, float);

// structure of each entry in the service list
typedef struct svc_entry {
   char  *name;    // required for Lua, otherwise for documentation only
   void  *addr;    // required for C - see "call_XXXX" types
   svc_t svc_type; // service type (defines call and return types)
   int   svc_id;   // global (public) id (0 to terminate list)
} svc_entry_t;

// the service list - terminate list with an entry with scv_id == 0
typedef svc_entry_t svc_list_t[];

// structure used to pass 2 long parameters to a service
typedef struct long_param_2 {
   long par1;
   long par2;
} long_param_2_t;

// structure used to pass 2 float parameters to a service 
typedef struct float_param_2 {
   float par1;
   float par2;
} float_param_2_t;

// union used to convert float to long
typedef union sys_plugin_result {
   long l;
   float f;
} result_t;

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
void _register_services(int lock, svc_list_t list);

#endif // _SERVICE_H
