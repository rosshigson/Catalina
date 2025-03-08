#ifndef _SERVICE_H
#define _SERVICE_H 1

/*
 * definitions for creating services in C or Lua that can be called via the 
 * same registry functions used for plugins. To dispatch the calls to the 
 * functions that implement these services, see the files dsptch_c.h (for 
 * C functions) or dsptch_l.h (for Lua functions).
 */
#include <stdlib.h>
#include <plugin.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#define NO_LOCK -1  // no lock required (see _register_services)

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

// structure used to pass a string with a length 
// (e.g. if the string may contain internal zeroes)
// and return same in a pre-allocated string buffer
// of a specified maximum size (which includes the
// terminating zero).
typedef struct serial_in_out {
   size_t  len_in;
   char   *ser_in;
   size_t  max_out;
   size_t  len_out;
   char   *ser_out;
} serial_t;

// union used to convert float to long
typedef union sys_plugin_result {
   long l;
   float f;
} result_t;

// service type - identifies the profile to be used to invoke the service
typedef enum svc { 
  SHORT_SVC,        // invoke via _short_service() - returns int
  LONG_SVC,         // invoke via _long_service()  - returns int
  LONG_2_SVC,       // invoke via _long_service_2() - returns int
  FLOAT_SVC,        // invoke via _float_service()  - returns float
  LONG_FLOAT_SVC,   // invoke via _long_float_service() - returns float
  SHARED_SVC,       // invoke via _short_service() - returns int
  SERIAL_SVC,       // invoke via _long_service() - returns serial_t *
  REMOTE_SVC,       // invoke via _long_service() - returns serial_t *
  RPC_SVC,          // invoke via _long_service() - returns serial_t *
} svc_t;

// profiles for function pointers
// // these profiles match plugin.h
typedef int   (*call_SHORT_SVC)(long);
typedef int   (*call_LONG_SVC)(long);
typedef int   (*call_LONG_2_SVC)(long, long);
typedef float (*call_FLOAT_SVC)(float, float);
typedef long  (*call_LONG_FLOAT_SVC)(float, float);
// these serial profiles are for Lua
typedef long  (*call_SERIAL_SVC)(serial_t *);
typedef long  (*call_REMOTE_SVC)(serial_t *);
typedef long  (*call_RPC_SVC)(serial_t *);

// dispatch functions:

// structure of each entry in the service list
typedef struct svc_entry {
   char  *name;      // required for Lua, otherwise for documentation only
   void  *addr;      // required for C - see "call_XXXX" types
   svc_t svc_type;   // service type (defines call and return types)
   int   svc_id;     // global (public) id (0 to terminate list)
   int   svc_port;   // global (public) remote serial port
   char  *svc_ip;    // global (public) remote IP address
   int   svc_handle; // service listen handle (server listens on /rpc/name)
} svc_entry_t;

// the service list - terminate list with an entry with scv_id == 0
typedef svc_entry_t svc_list_t[];

/*
 * serial service function:
 */
extern long _serial_service(long svc, serial_t *serial);

/*
 * register services - regeister an array of services, which is terminated
 * by a null (zero) service. The internal id is the list index + 1. e.g.
 *
 * svc_list_t my_list[] = {
 *    {"name", NULL, SHORT_SVC, SVC_COMP, 0, NULL, 0}, // internal index 1
 *    {"", NULL, 0, 0, 0, NULL, 0}
 * };
 *
 * if the lock is specified as NO_LOCK (-1), then no lock is used to protect 
 * calls to the services - otherwise use _locknew() to allocate a suitable lock
*/
void _register_services(int lock, svc_list_t list);

/*
 * dispatchers for C and Lua - with or without a "background" task, which
 * is a function that takes no parameters and returns no values, but is 
 * called repeatedly when there is no service being called. The backgound
 * function should return regularly to allow service calls to be dispatched.
 */

// profile for background task C function pointer (Lua uses a string)
typedef void (*background)(void);

// use _dispatch_C if no C background task is required
#define _dispatch_C(list) _dispatch_C_bg(list, (bg)NULL)

// use _dispatch_C_bg if a C background task is required
void _dispatch_C_bg(svc_list_t list, background bg);

// use _dispatch_Lua if no Lua background task is required
#define _dispatch_Lua(L, list) _dispatch_Lua_bg(L, list, NULL)

// use _dispatch_Lua_bg if a Lua background task is required
void _dispatch_Lua_bg(lua_State *L, svc_list_t list, char *bg);


#endif // _SERVICE_H
