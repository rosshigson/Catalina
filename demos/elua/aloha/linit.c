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

#if defined(__CATALINA_libluax)
/* if we are compiled with the luax library, define a dummy parser */
#include "llex.h"
#include "lparser.h"
#include "lzio.h"

LUAI_FUNC void luaX_init (lua_State *L) {
  UNUSED(L);
}

LUAI_FUNC LClosure *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff,
                                 Dyndata *dyd, const char *name, int firstchar) {
  UNUSED(z);
  UNUSED(buff);
  UNUSED(name);
  UNUSED(dyd);
  UNUSED(firstchar);
  lua_pushliteral(L,"parser not loaded");
  lua_error(L);
  return NULL;
}
#endif

#if defined(LUA_PROP)
#define LUA_PROPELLERLIBNAME	"propeller"
LUALIB_API int (luaopen_propeller) (lua_State *L);
#endif

#if defined(LUA_HMI)
#define LUA_HMILIBNAME	"hmi"
LUALIB_API int (luaopen_hmi) (lua_State *L);
#endif

#if defined(LUA_THREADS)
#define LUA_THREADSLIBNAME	"threads"
LUALIB_API int (luaopen_threads) (lua_State *L);
#endif

#if defined(__CATALINA_LUA_LINENOISE)
#define LUA_LINENOISELIBNAME	"linenoise"
LUALIB_API int (luaopen_linenoise) (lua_State *L);
#endif

#if defined(__CATALINA_LUA_SERVICE)
#define LUA_SERVICELIBNAME	"service"
LUALIB_API int (luaopen_service) (lua_State *L);
#endif

#if defined(__CATALINA_libserial2) || defined(__CATALINA_libserial8)
#define LUA_SERIALLIBNAME	"serial"
LUALIB_API int (luaopen_serial) (lua_State *L);
#endif

#if defined(__CATALINA_libwifi)
#define LUA_WIFILIBNAME	"wifi"
LUALIB_API int (luaopen_wifi) (lua_State *L);
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
  {LUA_STRLIBNAME, luaopen_string},
#if !defined(__CATALINA_LUA_NO_MATH)
  {LUA_MATHLIBNAME, luaopen_math},
#endif
#if !defined(__CATALINA_LUA_NO_OPT)
  {LUA_OSLIBNAME, luaopen_os},
  {LUA_UTF8LIBNAME, luaopen_utf8},
  {LUA_DBLIBNAME, luaopen_debug},
#endif
#if defined(LUA_THREADS)
  {LUA_THREADSLIBNAME, luaopen_threads},
#endif
#if defined(LUA_PROP)
  {LUA_PROPELLERLIBNAME, luaopen_propeller},
#endif
#if defined(LUA_HMI)
  {LUA_HMILIBNAME, luaopen_hmi},
#endif
#if defined(__CATALINA_LUA_LINENOISE)
  {LUA_LINENOISELIBNAME, luaopen_linenoise},
#endif
#if defined(__CATALINA_libserial2) || defined(__CATALINA_libserial8)
  {LUA_SERIALLIBNAME, luaopen_serial},
#endif
#if defined(__CATALINA_libwifi)
  {LUA_WIFILIBNAME, luaopen_wifi},
#endif
#if defined(__CATALINA_LUA_SERVICE)
  {LUA_SERVICELIBNAME, luaopen_service},
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


