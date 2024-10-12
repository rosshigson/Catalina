/*
** luaservice API
*/

#include "lua.h"
#include "lauxlib.h"
#include <string.h>

#ifdef __CATALINA__
#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <alloca.h>
#include "storage.h"
#endif

/* version number of the "service" module */
#define MODULE_VERSION_NUM 810

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "service", funcs );  }
#endif

#if (LUA_VERSION_NUM >= 503)
/* this version of Lua has integers, so push an integer value */
#define pushint   lua_pushinteger
#else
/* this version of Lua does not have integers, so push a number */
#define pushint   lua_pushnumber
#endif


/***********************
 * register prototypes *
 ***********************/

/* service function prototypes */
static int service_short( lua_State *L );
static int service_long( lua_State *L );
static int service_long_2( lua_State *L );
static int service_float( lua_State *L );
static int service_long_float( lua_State *L );
static int service_serial( lua_State *L );

LUALIB_API int luaopen( lua_State *L );

/* luaprop function registration array */
static const struct luaL_Reg luaservice_funcs[] = {

  { "short",      service_short },      // p1/p2
  { "long",       service_long },       // p1/p2
  { "long_2",     service_long_2 },     // p1/p2
  { "float",      service_float },      // p1/p2
  { "long_float", service_long_float }, // p1/p2
  { "serial",     service_serial },     // p1/p2
  { NULL, NULL }
};

/***********************
 * service functions *
 ***********************/

static int service_short( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  register int l   = (int) luaL_checkinteger( L, 2);

  pushint(L, _short_service(svc, (long) l));
  return 1;
#else
  return 0;
#endif
}

static int service_long( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  long tmp  = (int) luaL_checkinteger( L, 2);

  pushint(L, _long_service(svc, (long) &tmp));
  return 1;
#else
  return 0;
#endif
}

static int service_long_2( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  register long par1  = (long) luaL_checkinteger( L, 2);
  register long par2  = (long) luaL_checkinteger( L, 3);

  pushint(L, _long_service_2(svc, par1, par2));
  return 1;
#else
  return 0;
#endif
}

static int service_float( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  register lua_Number par1 = luaL_checknumber( L, 2);
  register lua_Number par2 = luaL_checknumber( L, 3);

  lua_pushnumber(L, _float_service(svc, (float)par1, (float)par2)); 
  return 1;
#else
  return 0;
#endif
}

static int service_long_float( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  register lua_Number par1 = luaL_checknumber( L, 2);
  register lua_Number par2 = luaL_checknumber( L, 3);

  pushint(L, _long_float_service(svc, (float)par1, (float)par2));
  return 1;
#else
  return 0;
#endif
}

// structure used for serial service:
typedef struct serial_in_out {
   size_t      len_in;
   const char *ser_in;
   size_t      max_out;
   size_t      len_out;
   const char *ser_out;
} serial_t;

static int service_serial( lua_State *L ) {
#ifdef __CATALINA__
  register int svc = (int) luaL_checkinteger( L, 1);
  serial_t serial;
  // the Lua string may contain nulls, so we have to include the length
  serial.ser_in = luaL_checklstring( L, 2, &serial.len_in);
  serial.max_out = luaL_checkinteger( L, 3);
  // we must allocate the maximum output space - we use alloca because the 
  // space must be in Hub RAM, and also we only need it during this function 
  // because pushing it onto the Lua stack makes a copy
  serial.ser_out = alloca(serial.max_out+1);
  // execute the call - we don't need the result, 
  // because it will be in the serial structure
  _long_service(svc, (long) &serial);
  lua_pushlstring(L, serial.ser_out, serial.len_out);
  return 1;
#else
  return 0;
#endif
}

/**********************************
 * register structs and functions *
 **********************************/

LUALIB_API int luaopen_service( lua_State *L ) {

  /* register luaservice functions */
  luaL_newlib( L, luaservice_funcs );

  return 1;
}

/******************************************************************************
* Copyright 2022 Ross Higson
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************/


