/*
** luahmi  API
*/

#include "lua.h"
#include "lauxlib.h"
#include <string.h>

#ifdef __CATALINA__
#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <hmi.h>
#include "storage.h"
#endif

/* version number of the "hmi" module */
#define MODULE_VERSION_NUM 810

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "hmi", funcs );  }
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

/* hmi function prototypes */
static int hmi_version( lua_State *L );
static int hmi_k_get( lua_State *L );
static int hmi_k_wait( lua_State *L );
static int hmi_k_new( lua_State *L );
static int hmi_k_ready( lua_State *L );
static int hmi_k_clear( lua_State *L );
#ifndef __CATALINA_NO_MOUSE
static int hmi_m_button( lua_State *L );
static int hmi_m_abs_x( lua_State *L );
static int hmi_m_abs_y( lua_State *L );
static int hmi_m_delta_x( lua_State *L );
static int hmi_m_delta_y( lua_State *L );
static int hmi_m_reset( lua_State *L );
static int hmi_m_bound_limits( lua_State *L );
static int hmi_m_bound_scales( lua_State *L );
static int hmi_m_bound_x( lua_State *L );
static int hmi_m_bound_y( lua_State *L );
#endif
static int hmi_t_geometry( lua_State * L );
static int hmi_t_char( lua_State * L );
static int hmi_t_mode( lua_State * L );
static int hmi_t_setpos( lua_State * L );
static int hmi_t_getpos( lua_State * L );
static int hmi_t_scroll( lua_State * L );
static int hmi_t_color( lua_State * L );
static int hmi_t_color_fg( lua_State * L );
static int hmi_t_color_bg( lua_State * L );
static int hmi_t_string( lua_State *L );

LUALIB_API int luaopen_hmi( lua_State *L );

/* luaprop function registration array */
static const struct luaL_Reg luahmi_funcs[] = {

  { "version",        hmi_version },
  { "k_get",          hmi_k_get },
  { "k_wait",         hmi_k_wait },
  { "k_new",          hmi_k_new },
  { "k_ready",        hmi_k_ready },
  { "k_clear",        hmi_k_clear },
#ifndef __CATALINA_NO_MOUSE
  { "m_button",       hmi_m_button },
  { "m_abs_x",        hmi_m_abs_x },
  { "m_abs_y",        hmi_m_abs_y },
  { "m_delta_x",      hmi_m_delta_x },
  { "m_delta_y",      hmi_m_delta_y },
  { "m_reset",        hmi_m_reset },
  { "m_bound_limits", hmi_m_bound_limits },
  { "m_bound_scales", hmi_m_bound_scales },
  { "m_bound_x",      hmi_m_bound_x },
  { "m_bound_y",      hmi_m_bound_y },
#endif
  { "t_geometry",     hmi_t_geometry },
  { "t_char",         hmi_t_char },
  { "t_mode",         hmi_t_mode },
  { "t_setpos",       hmi_t_setpos },
  { "t_getpos",       hmi_t_getpos },
  { "t_scroll",       hmi_t_scroll },
  { "t_color",        hmi_t_color },
  { "t_color_fg",     hmi_t_color_fg },
  { "t_color_bg",     hmi_t_color_bg },
  { "t_string",       hmi_t_string }, // p1/p2
  { NULL, NULL }
};

/*****************
 * hmi functions *
 *****************/

static int hmi_t_string( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register const char *value = luaL_checkstring( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_string(((unsigned)curs), (char *)value) );
     return 1;
  }
#else
  return 0;
#endif
}

/* get a version number - default is the LUA_VERSION_NUM */
static int hmi_version( lua_State *L ) {
   if (lua_gettop(L) > 0) {
     register const char *str = luaL_checkstring( L, 1 );
     lua_settop(L, 0); // pop all
     if (strcmp(str, "lua") == 0) {
       pushint( L, LUA_VERSION_NUM);
     }
     else if (strcmp(str, "hardware") == 0) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
       pushint( L, 2); // Propeller 2
#else
       pushint( L, 1); // Propeller 1
#endif
#else
       pushint( L, 0); // not a Propeller
#endif
     }
     else {
        pushint( L, MODULE_VERSION_NUM);
     }
   }
   else {
      lua_settop(L, 0); // pop all
      pushint( L, LUA_VERSION_NUM);
   }
   return 1;
}

/* k_get - the Catalina k_get function */
static int hmi_k_get( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_get() );
  return 1;
#else
  return 0;
#endif
}

/* k_wait - the Catalina k_wait function */
static int hmi_k_wait( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_wait() );
  return 1;
#else
  return 0;
#endif
}

/* k_new - the Catalina k_new function */
static int hmi_k_new( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_new() );
  return 1;
#else
  return 0;
#endif
}

/* k_ready - the Catalina k_ready function */
static int hmi_k_ready( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_ready() );
  return 1;
#else
  return 0;
#endif
}

/* k_clear - the Catalina k_clear function */
static int hmi_k_clear( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_clear() );
  return 1;
#else
  return 0;
#endif
}

#ifndef __CATALINA_NO_MOUSE

/* m_button - the Catalina m_button function */
static int hmi_m_button( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate argument */
     register lua_Integer b = luaL_checkinteger( L, 1 );
     lua_settop(L, 0);
     pushint( L, m_button((unsigned long)b) );
     return 1;
  }
#endif
  return 0;
}

/* m_abs_x - the Catalina m_abs_x function */
static int hmi_m_abs_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_abs_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_abs_y - the Catalina m_abs_y function */
static int hmi_m_abs_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_abs_y() );
  return 1;
#else
  return 0;
#endif
}

/* m_delta_x - the Catalina m_delta_x function */
static int hmi_m_delta_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_delta_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_delta_y - the Catalina m_delta_y function */
static int hmi_m_delta_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_delta_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_reset - the Catalina m_reset function */
static int hmi_m_reset( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_reset() );
  return 1;
#else
  return 0;
#endif
}

/* m_bound_limits - the Catalina m_bound_limits function */
static int hmi_m_bound_limits( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer xmin = luaL_checkinteger( L, 1 );
     register lua_Integer ymin = luaL_checkinteger( L, 2 );
     register lua_Integer xmax = luaL_checkinteger( L, 3 );
     register lua_Integer ymax = luaL_checkinteger( L, 4 );
     lua_settop(L, 0);
     pushint( L, m_bound_limits(xmin, ymin, 0, xmax, ymax, 0) );
     return 1;
  }
#endif
  return 0;
}

/* m_bound_scales - the Catalina m_bound_scales function */
static int hmi_m_bound_scales( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer xscale = luaL_checkinteger( L, 1 );
     register lua_Integer yscale = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, m_bound_scales(xscale, yscale, 0) );
     return 1;
  }
#endif
  return 0;
}

/* m_bound_x - the Catalina m_bound_x function */
static int hmi_m_bound_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_bound_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_bound_y - the Catalina m_bound_y function */
static int hmi_m_bound_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_bound_y() );
  return 1;
#else
  return 0;
#endif
}

#endif // __CATALINA_NO_MOUSE

/* t_geometry - the Catalina t_geometry function */
static int hmi_t_geometry( lua_State * L ) {
#ifdef __CATALINA__
  pushint( L, t_geometry() );
  return 1;
#else
  return 0;
#endif
}

/* t_char - the Catalina t_char function */
static int hmi_t_char( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer ch = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_char(((unsigned)curs), (unsigned)ch) );
     return 1;
  }
#endif
  return 0;
}

/* t_mode - the Catalina t_mode function */
static int hmi_t_mode( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer mode = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_mode(((unsigned)curs), (unsigned)mode) );
     return 1;
  }
#endif
}

/* t_setpos - the Catalina t_setpos function */
static int hmi_t_setpos( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer col = luaL_checkinteger( L, 2 );
     register lua_Integer row = luaL_checkinteger( L, 3 );
     lua_settop(L, 0);
     pushint( L, t_setpos(((unsigned)curs), (unsigned)col, (unsigned)row) );
     return 1;
  }
#endif
}

/* t_getpos - the Catalina t_getpos function */
static int hmi_t_getpos( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     lua_settop(L, 0);
     pushint( L, t_getpos((unsigned)curs) );
     return 1;
  }
#endif
}

/* t_scroll - the Catalina t_scroll function */
static int hmi_t_scroll( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer first = luaL_checkinteger( L, 2 );
     register lua_Integer last = luaL_checkinteger( L, 3 );
     lua_settop(L, 0);
     pushint( L, t_scroll(((unsigned)curs), (unsigned)first, (unsigned)last) );
     return 1;
  }
#endif
}

/* t_color - the Catalina t_color function */
static int hmi_t_color( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer color = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_color(((unsigned)curs), (unsigned)color) );
     return 1;
  }
#endif
}

/* t_color_fg - the Catalina t_color_bg function */
static int hmi_t_color_fg( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer color = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_color_fg(((unsigned)curs), (unsigned)color) );
     return 1;
  }
#endif
}

/* t_color_bg - the Catalina t_color_bg function */
static int hmi_t_color_bg( lua_State * L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate arguments */
     register lua_Integer curs = luaL_checkinteger( L, 1 );
     register lua_Integer color = luaL_checkinteger( L, 2 );
     lua_settop(L, 0);
     pushint( L, t_color_bg(((unsigned)curs), (unsigned)color) );
     return 1;
  }
#endif
}


/**********************************
 * register structs and functions *
 **********************************/

LUALIB_API int luaopen_hmi( lua_State *L ) {

  /* register luahmi functions */
  luaL_newlib( L, luahmi_funcs );

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


