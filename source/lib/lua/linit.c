/*
** $Id: linit.c $
** Initialization of libraries for lua.c and other clients
** See Copyright Notice in lua.h
*/


#define linit_c
#define LUA_LIB

/*
** If you embed Lua in your program and need to open the standard
** libraries, call luaL_openlibs in your program. If you need a
** different set of libraries, copy this file to your project and edit
** it to suit your needs.
**
** You can also *preload* libraries, so that a later 'require' can
** open the library, which is already linked to the application.
** For that, do the following code:
**
**  luaL_getsubtable(L, LUA_REGISTRYINDEX, LUA_PRELOAD_TABLE);
**  lua_pushcfunction(L, luaopen_modname);
**  lua_setfield(L, -2, modname);
**  lua_pop(L, 1);  // remove PRELOAD table
*/

#include "lprefix.h"


#include <stddef.h>

#include "lua.h"

#include "lualib.h"
#include "lauxlib.h"

#if defined(LUA_PROPELLER)
#define LUA_PROPELLERLIBNAME	"propeller"
LUALIB_API int (luaopen_propeller) (lua_State *L);
#define LUA_HMILIBNAME	"hmi"
LUALIB_API int (luaopen_hmi) (lua_State *L);
#endif

#if defined(LUA_THREADS)
#define LUA_THREADSLIBNAME	"threads"
LUALIB_API int (luaopen_threads) (lua_State *L);
#endif

#if defined(__CATALINA_ENABLE_LINENOISE)
#define LUA_LINENOISELIBNAME	"linenoise"
LUALIB_API int (luaopen_linenoise) (lua_State *L);
#endif

/*
** these libs are loaded by lua.c and are readily available to any Lua
** program
*/
static const luaL_Reg loadedlibs[] = {
  {LUA_GNAME, luaopen_base},
  {LUA_LOADLIBNAME, luaopen_package},
  {LUA_COLIBNAME, luaopen_coroutine},
  {LUA_TABLIBNAME, luaopen_table},
  {LUA_IOLIBNAME, luaopen_io},
  {LUA_OSLIBNAME, luaopen_os},
  {LUA_STRLIBNAME, luaopen_string},
  {LUA_MATHLIBNAME, luaopen_math},
#if defined(LUA_THREADS)
  {LUA_THREADSLIBNAME, luaopen_threads},
#else
  {LUA_UTF8LIBNAME, luaopen_utf8},
  {LUA_DBLIBNAME, luaopen_debug},
#endif
#if defined(LUA_PROPELLER)
  {LUA_PROPELLERLIBNAME, luaopen_propeller},
  {LUA_HMILIBNAME, luaopen_hmi},
#endif
#if defined(__CATALINA_ENABLE_LINENOISE)
  {LUA_LINENOISELIBNAME, luaopen_linenoise},
#endif
  {NULL, NULL}
};


LUALIB_API void luaL_openlibs (lua_State *L) {
  const luaL_Reg *lib;
  /* "require" functions from 'loadedlibs' and set results to global table */
  for (lib = loadedlibs; lib->func; lib++) {
    luaL_requiref(L, lib->name, lib->func, 1);
    lua_pop(L, 1);  /* remove lib */
  }
}

