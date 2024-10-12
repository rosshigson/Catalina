/*
** luaserial2 API
*/

#include "lua.h"
#include "lauxlib.h"
#include <string.h>

#ifdef __CATALINA__
#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <serial2.h>
#include "storage.h"
#endif

/* version number of the "serial2" module */
#define MODULE_VERSION_NUM 810

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "serial2", funcs );  }
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

/* serial2 function prototypes */
static int serial2_rxflush( lua_State *L );
static int serial2_rxcheck( lua_State *L );
static int serial2_rxtime( lua_State *L );
static int serial2_rxcount( lua_State *L );
static int serial2_rx( lua_State *L );
static int serial2_txflush( lua_State *L );
static int serial2_txcount( lua_State *L );
static int serial2_tx( lua_State *L );
static int serial2_str( lua_State *L );
static int serial2_decl( lua_State *L );
static int serial2_hex( lua_State *L );
static int serial2_ihex( lua_State *L );
static int serial2_bin( lua_State *L );
static int serial2_ibin( lua_State *L );
static int serial2_padchar( lua_State *L );

LUALIB_API int luaopen( lua_State *L );

/* luaserial2 function registration array */
static const struct luaL_Reg luaserial2_funcs[] = {

  { "rxflush",      serial2_rxflush },
  { "rxcheck",      serial2_rxcheck },
  { "rxtime",       serial2_rxtime },
  { "rxcount",      serial2_rxcount },
  { "rx",           serial2_rx },
  { "txflush",      serial2_txflush },
  { "txcount",      serial2_txcount },
  { "tx",           serial2_tx },
  { "str",          serial2_str },
  { "decl",         serial2_decl },
  { "hex",          serial2_hex },
  { "ihex",         serial2_ihex },
  { "bin",          serial2_bin },
  { "ibin",         serial2_ibin },
  { "padchar",      serial2_padchar },
  { NULL, NULL }
};

/***********************
 * serial2 functions *
 ***********************/

static int serial2_rxflush( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_rxflush(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_rxcheck( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_rxcheck(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_rxtime( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);
  register int ms   = luaL_checkinteger( L, 1);

  pushint(L, s2_rxtime(port, ms));
  return 1;
#else
  return 0;
#endif
}

static int serial2_rxcount( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_rxcount(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_rx( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_rx(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_txflush( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_txflush(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_txcount( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);

  pushint(L, s2_txcount(port));
  return 1;
#else
  return 0;
#endif
}

static int serial2_tx( lua_State *L ) {
#ifdef __CATALINA__
  register int port = luaL_checkinteger( L, 1);
  register int txbyte = luaL_checkinteger( L, 2);

  pushint(L, s2_tx(port, txbyte));
  return 1;
#else
  return 0;
#endif
}

static int serial2_str( lua_State *L ) {
#ifdef __CATALINA__
  register int   port = luaL_checkinteger( L, 1);
  register char *str  = (char *)luaL_checkstring( L, 2);

  s2_str(port, str);
  return 0;
#else
  return 0;
#endif
}

static int serial2_decl( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);
  register int flag   = luaL_checkinteger( L, 4);

  s2_decl(port, val, digits, flag);
  return 0;
#else
  return 0;
#endif
}

static int serial2_hex( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s2_hex(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial2_ihex( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s2_ihex(port, val, digits);
  return 0;
#else
  return 0;
#endif
}

static int serial2_bin( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s2_bin(port, val, digits);
  return 1;
#else
  return 0;
#endif
}

static int serial2_ibin( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int val    = luaL_checkinteger( L, 2);
  register int digits = luaL_checkinteger( L, 3);

  s2_ibin(port, val, digits);
  return 1;
#else
  return 0;
#endif
}

static int serial2_padchar( lua_State *L ) {
#ifdef __CATALINA__
  register int port   = luaL_checkinteger( L, 1);
  register int count  = luaL_checkinteger( L, 2);
  register int txbyte = luaL_checkinteger( L, 3);

  s2_padchar(port, count, txbyte);
  return 0;
#else
  return 0;
#endif
}


/**********************************
 * register structs and functions *
 **********************************/

LUALIB_API int luaopen_serial2( lua_State *L ) {

  /* register luaserial2 functions */
  luaL_newlib( L, luaserial2_funcs );

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


