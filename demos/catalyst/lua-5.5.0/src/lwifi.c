/*
** luawifi API
*/

#define LUA_LIB

#include "lprefix.h"

#include "lua.h"
#include "lauxlib.h"
#include <string.h>

#ifdef __CATALINA__
#include <prop.h>
#include <plugin.h>
#include <wifi.h>
#endif

/* version number of the "wifi" module */
#define MODULE_VERSION_NUM 840

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "wifi", funcs );  }
#endif

#if (LUA_VERSION_NUM >= 503)
/* this version of Lua has integers, so push an integer value */
#define pushint   lua_pushinteger
#else
/* this version of Lua does not have integers, so push a number */
#define pushint   lua_pushnumber
#endif

/* Propeller 1 specific configuration */

#ifndef __CATALINA_P2

/*
 * pin functions - these are required on the Propeller 1 only, because
 * on the Propeller 2 we have direct access to the PASM in the platform
 * configuration files, where the pins are defined. but we do not have 
 * that on the Propeller 1. If the pin is not connected, these functions 
 * should return -1:
 */

int wifi_DO_PIN() {
   return 31;
}

int wifi_DI_PIN() {
   return 30;
}

int wifi_PGM_PIN() {
   return -1; // if not used, return -1
}

int wifi_RES_PIN() {
   return -1; // if not used, return -1
}

int wifi_BRK_PIN() {
   return -1; // if not used, return -1
}

#endif


/***********************
 * register prototypes *
 ***********************/

/* wifi function prototypes */
static int lwifi_RECV( lua_State *L );
static int lwifi_SEND( lua_State *L );
static int lwifi_REPLY( lua_State *L );
static int lwifi_PATH( lua_State *L );
static int lwifi_ARG( lua_State *L );
static int lwifi_SEND_DATA( lua_State *L );
static int lwifi_SET( lua_State *L );
static int lwifi_CHECK( lua_State *L );
static int lwifi_JOIN( lua_State *L );
static int lwifi_POLL( lua_State *L );
static int lwifi_CLOSE( lua_State *L );
static int lwifi_CONNECT( lua_State *L );
static int lwifi_LISTEN( lua_State *L );
static int lwifi_PGM( lua_State *L );
static int lwifi_RESET( lua_State *L );
static int lwifi_BREAK( lua_State *L );
static int lwifi_OK( lua_State *L );
static int lwifi_AUTO( lua_State *L );
static int lwifi_INIT( lua_State *L );

LUALIB_API int luaopen( lua_State *L );

/* luawifi function registration array */
static const struct luaL_Reg luawifi_funcs[] = {

  { "RECV",      lwifi_RECV },
  { "SEND",      lwifi_SEND },
  { "REPLY",     lwifi_REPLY },
  { "PATH",      lwifi_PATH },
  { "ARG",       lwifi_ARG },
  { "SEND_DATA", lwifi_SEND_DATA },
  { "SET",       lwifi_SET },
  { "CHECK",     lwifi_CHECK },
  { "JOIN",      lwifi_JOIN },
  { "POLL",      lwifi_POLL },
  { "CLOSE",     lwifi_CLOSE },
  { "CONNECT",   lwifi_CONNECT },
  { "LISTEN",    lwifi_LISTEN },
  { "PGM",       lwifi_PGM },
  { "RESET",     lwifi_RESET },
  { "BREAK",     lwifi_BREAK },
  { "OK",        lwifi_OK },
  { "AUTO",      lwifi_AUTO },
  { "INIT",      lwifi_INIT },
  { NULL, NULL }
};

/***********************
 * wifi functions *
 ***********************/

static int lwifi_BREAK( lua_State *L ) {
#ifdef __CATALINA__
  wifi_BREAK();
#endif
  return 0;
}


static int lwifi_RESET( lua_State *L ) {
#ifdef __CATALINA__
  wifi_RESET();
#endif
  return 0;
}


static int lwifi_PGM( lua_State *L ) {
#ifdef __CATALINA__
  wifi_PGM();
#endif
  return 0;
}


static int lwifi_OK( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, wifi_OK());
  return 1;
#else
  return 0;
#endif
}


static int lwifi_INIT( lua_State *L ) {
#ifdef __CATALINA__
  register int DI  = luaL_checkinteger( L, 1);
  register int DO  = luaL_checkinteger( L, 2);
  register int BRK = luaL_checkinteger( L, 3);
  register int RES = luaL_checkinteger( L, 4);
  register int PGM = luaL_checkinteger( L, 5);
  pushint(L, wifi_INIT(DI, DO, BRK, RES, PGM));
  return 1;
#else
  return 0;
#endif
}


static int lwifi_AUTO( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, wifi_AUTO());
  return 1;
#else
  return 0;
#endif
}


static int lwifi_LISTEN( lua_State *L ) {
#ifdef __CATALINA__
  register int protocol = luaL_checkinteger( L, 1);
  register char *path   = (char *)luaL_checkstring( L, 2);
  int id;
  int result            = wifi_LISTEN(protocol, path, &id);
  pushint(L, result);
  pushint(L, id);
  return 2;
#else
  return 0;
#endif
}


static int lwifi_CONNECT( lua_State *L ) {
#ifdef __CATALINA__
  register char *address = (char *)luaL_checkstring( L, 1);
  register int port      = luaL_checkinteger( L, 2);
  int handle;
  int result             = wifi_CONNECT(address, port, &handle);
  pushint(L, result);
  pushint(L, handle);
  return 2;
#else
  return 0;
#endif
}


static int lwifi_CLOSE( lua_State *L ) {
#ifdef __CATALINA__
  register int handle_id = luaL_checkinteger( L, 1);
  pushint(L, wifi_CLOSE(handle_id));
  return 1;
#else
  return 0;
#endif
}


static int lwifi_POLL( lua_State *L ) {
#ifdef __CATALINA__
  register int mask = luaL_checkinteger( L, 1);
  int handle;
  int value;
  char event[2];
  int result = wifi_POLL(mask, &event[0], &handle, &value);
  event[1] = 0; // zero terminate 
  pushint(L, result);
  lua_pushstring(L, event);
  pushint(L, handle);
  pushint(L, value);
  return 4;
#else
  return 0;
#endif
}


static int lwifi_RECV( lua_State *L ) {
#ifdef __CATALINA__
  register int handle = luaL_checkinteger( L, 1);
  register int max    = luaL_checkinteger( L, 2);
  int size;
  char data[wifi_DATA_SIZE];
  int result = wifi_RECV(handle, max, data, &size);
  pushint(L, result);
  lua_pushlstring(L, data, size);
  pushint(L, size);
  return 3;
#else
  return 0;
#endif
}

static int lwifi_SEND( lua_State *L ) {
#ifdef __CATALINA__
  register int handle = luaL_checkinteger( L, 1);
  register int size   = luaL_checkinteger( L, 2);
  register char *data = (char *)luaL_checkstring( L, 3);
  int result = wifi_SEND(handle, size, data);
  pushint(L, result);
  return 1;
#else
  return 0;
#endif
}


static int lwifi_REPLY( lua_State *L ) {
#ifdef __CATALINA__
  register int handle    = luaL_checkinteger( L, 1);
  register int rcode     = luaL_checkinteger( L, 2);
  register int total     = luaL_checkinteger( L, 3);
  register int size      = luaL_checkinteger( L, 4);
  register char *data    = (char *)luaL_checkstring( L, 5);
  int result = wifi_REPLY(handle, rcode, total, size, data);
  pushint(L, result);
  return 1;
#else
  return 0;
#endif
}


static int lwifi_PATH( lua_State *L ) {
#ifdef __CATALINA__
  register int handle = luaL_checkinteger( L, 1);
  char path[wifi_DATA_SIZE];
  int result = wifi_PATH(handle, path);
  pushint(L, result);
  lua_pushstring(L, path);
  return 2;
#else
  return 0;
#endif
}


static int lwifi_ARG( lua_State *L ) {
#ifdef __CATALINA__
  register int handle = luaL_checkinteger( L, 1);
  register char *name = (char *)luaL_checkstring( L, 2);
  char value[wifi_DATA_SIZE];
  int result = wifi_ARG(handle, name, value);
  pushint(L, result);
  lua_pushstring(L, value);
  return 2;
#else
  return 0;
#endif
}


static int lwifi_SEND_DATA( lua_State *L ) {
#ifdef __CATALINA__
  register int handle = luaL_checkinteger( L, 1);
  register int rcode  = luaL_checkinteger( L, 2);
  register int total  = luaL_checkinteger( L, 3);
  register char *data = (char *)luaL_checkstring( L, 4);
  int result = wifi_SEND_DATA(handle, rcode, total, data);
  pushint(L, result);
  return 1;
#else
  return 0;
#endif
}


static int lwifi_SET( lua_State *L ) {
#ifdef __CATALINA__
  register char *setting = (char *)luaL_checkstring( L, 1);
  register char *value   = (char *)luaL_checkstring( L, 2);
  int result = wifi_SET(setting, value);
  pushint(L, result);
  return 1;
#else
  return 0;
#endif
}


static int lwifi_CHECK( lua_State *L ) {
#ifdef __CATALINA__
  register char *setting = (char *)luaL_checkstring( L, 1);
  char value[wifi_DATA_SIZE];
  int result = wifi_CHECK(setting, value);
  pushint(L, result);
  lua_pushstring(L, value);
  return 2;
#else
  return 0;
#endif
}


static int lwifi_JOIN( lua_State *L ) {
#ifdef __CATALINA__
  register char *ssid       = (char *)luaL_checkstring( L, 1);
  register char *passphrase = (char *)luaL_checkstring( L, 2);
  int result = wifi_JOIN(ssid, passphrase);
  pushint(L, result);
  return 1;
#else
  return 0;
#endif
}


/**********************************
 * register structs and functions *
 **********************************/

LUAMOD_API int luaopen_wifi( lua_State *L ) {

  /* register luawifi functions */
  luaL_newlib( L, luawifi_funcs );
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


