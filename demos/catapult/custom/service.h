/*
 * definitions for creating services in C (or Lua) that can be called
 * via the normal registry functions.
 */
#include <plugin.h>

#if defined(__CATALINA_liblua) || defined(__CATALINA_libluax)
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#endif

#define LMM_SVR2 (LMM_RND+2)     // temporary - in case LMM_SVR is in plugin.h
#define NO_LOCK -1               // no lock required (see register_services)

// service type - identifies the profile to be used to invoke the service
typedef enum svc { 
  SHORT_SVC,        // invoke via _short_service() - int returned
  LONG_SVC,         // invoke via _long_service()  - int returned
  LONG_2_SVC,       // invoke via _long_service_2() - int returned
  FLOAT_SVC,        // invoke via _float_service()  - float returned
  LONG_FLOAT_SVC,   // invoke via _long_float_service() - float returned
  SHARED_SVC,       // invoke via _short_service() - int returned
  CHAR_2_SVC        // invoke via char_service_2 - int returned
} svc_t;

// profiles for function pointers - these match plugin.h
typedef int   (*call_SHORT_SVC)(long);
typedef int   (*call_LONG_SVC)(long);
typedef int   (*call_LONG_2_SVC)(long, long);
typedef float (*call_FLOAT_SVC)(float, float);
typedef long  (*call_LONG_FLOAT_SVC)(float, float);
// custom profile
typedef int   (*call_CHAR_2_SVC)(char *, char *);

// structure of each entry in the service list
typedef struct svc_entry {
   char  *name;    // required for Lua, otherwise for documentation only
   void  *addr;    // required for C - see "call_XXXX" types
   svc_t svc_type; // service type (defines call and return types)
   int   svc_id;   // global (public) id (0 to terminate list)
} svc_entry_t;

// the service list
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

// structure used to pass 2 char * parameters to a service
typedef struct char_param_2 {
   char *par1;
   char *par2;
} char_param_2_t;

// union used to convert float to long
typedef union sys_plugin_result {
   long l;
   float f;
} result_t;

/*
 * Custom Layer 3 (service) function:
 */
extern int char_service_2(long svc, char *par1, char *par2);

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
void my_register_services(int lock, svc_list_t list);
