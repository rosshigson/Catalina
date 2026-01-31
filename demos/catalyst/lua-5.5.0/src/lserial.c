/*
** luaserial API
*/

#define LUA_LIB

#include "lprefix.h"

#include "lua.h"
#include "lauxlib.h"
#include <string.h>

#ifdef __CATALINA__
#include <prop.h>
#include <plugin.h>
#include <serial.h>
#endif

/* version number of the "serial" module */
#define MODULE_VERSION_NUM 810

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "serial", funcs );  }
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

/* serial function prototypes */
static int serial_rxflush( lua_State *L );
static int serial_rxcheck( lua_State *L );
static int serial_rxtime( lua_State *L );
static int serial_rxcount( lua_State *L );
static int serial_rx( lua_State *L );
static int serial_txflush( lua_State *L );
static int serial_txcount( lua_State *L );
static int serial_tx( lua_State *L );
static int serial_str( lua_State *L );
static int serial_decl( lua_State *L );
static int serial_hex( lua_State *L );
static int serial_ihex( lua_State *L );
static int serial_bin( lua_State *L );
static int serial_ibin( lua_State *L );
static int serial_padchar( lua_State *L );

LUALIB_API int luaopen( lua_State *L );

/* luaserial function registration array */
static const struct luaL_Reg luaserial_funcs[] = {

  { "rxflush",      serial_rxflush },
  { "rxcheck",      serial_rxcheck },
  { "rxtime",       serial_rxtime },
  { "rxcount",      serial_rxcount },
  { "rx",           serial_rx },
  { "txflush",      serial_txflush },
  { "txcount",      serial_txcount },
  { "tx",           serial_tx },
  { "str",          serial_str },
  { "decl",         serial_decl },
  { "hex",          serial_hex },
  { "ihex",         serial_ihex },
  { "bin",          serial_bin },
  { "ibin",         serial_ibin },
  { "padchar",      serial_padchar },
  { NULL, NULL }
};

/***********************
 * serial functions *
 ***********************/

static int serial_rxflush( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_rxflush(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_rxcheck( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_rxcheck(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_rxtime( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);
  register int ms   = luaL_checkinteger( L, 1);

  pushint(L, s_rxtime(port, ms));
  return 1;
#else
  return 0;
#endif
}

static int serial_rxcount( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_rxcount(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_rx( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_rx(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_txflush( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_txflush(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_txcount( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s_txcount(port));
  return 1;
#else
  return 0;
#endif
}

static int serial_tx( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);
  register int txbyte = luaL_checkinteger( L, 2);

  pushint(L, s_tx(port, txbyte));
  return 1;
#else
  return 0;
#endif
}

static int serial_str( lua_State *L ) {
#ifdef __CATALINA__
  register int   port = luaL_checkinteger( L, 1);
  register char *str  = (char *)luaL_checkstring( L, 2);

  s_str(port, str);
  return 0;
#else
  return 0;
#endif
}

static int serial_decl( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);
  register int flag   = luaL_checkinteger( L, 4);

  s_decl(port, val, digits, flag);
  return 0;
#else
  return 0;
#endif
}

static int serial_hex( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s_hex(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial_ihex( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s_ihex(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial_bin( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s_bin(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial_ibin( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s_ibin(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial_padchar( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int count  = luaL_checkinteger( L, 2);
  register int txbyte = luaL_checkinteger( L, 3);

  s_padchar(port, count, txbyte);
  return 0;
#else
  return 0;
#endif
}


/**********************************
 * register structs and functions *
 **********************************/

LUALIB_API int luaopen_serial( lua_State *L ) {

  /* register luaserial functions */
  luaL_newlib( L, luaserial_funcs );

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


