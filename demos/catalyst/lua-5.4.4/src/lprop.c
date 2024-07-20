/*
** luapropeller API
*/

#include "lua.h"
#include "lauxlib.h"

#ifdef __CATALINA__
#include <prop.h>
#include <prop2.h>
#include "storage.h"
#endif

/* version number of the "propeller" module */
#define MODULE_VERSION_NUM 640

/* housekeeping to cater for different Lua versions */
#if (LUA_VERSION_NUM == 501)
#define luaL_newlib( L, funcs )     { lua_newtable( L ); \
  luaL_register( L, "propeller", funcs );  }
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

/* propeller function prototypes */
static int propeller_setenv( lua_State *L );
static int propeller_unsetenv( lua_State *L );
static int propeller_getpin( lua_State *L );
static int propeller_setpin( lua_State *L );
static int propeller_togglepin( lua_State *L );
static int propeller_sleep( lua_State *L );
static int propeller_msleep( lua_State *L );
static int propeller_sbrk( lua_State *L );
static int propeller_version( lua_State *L );
static int propeller_mount( lua_State *L );
static int propeller_scan( lua_State *L );
static int propeller_execute( lua_State *L );
static int propeller_k_get( lua_State *L );
static int propeller_k_wait( lua_State *L );
static int propeller_k_new( lua_State *L );
static int propeller_k_ready( lua_State *L );
static int propeller_k_clear( lua_State *L );
#ifndef __CATALINA_NO_MOUSE
static int propeller_m_button( lua_State *L );
static int propeller_m_abs_x( lua_State *L );
static int propeller_m_abs_y( lua_State *L );
static int propeller_m_delta_x( lua_State *L );
static int propeller_m_delta_y( lua_State *L );
static int propeller_m_reset( lua_State *L );
static int propeller_m_bound_limits( lua_State *L );
static int propeller_m_bound_scales( lua_State *L );
static int propeller_m_bound_x( lua_State *L );
static int propeller_m_bound_y( lua_State *L );
#endif
static int propeller_t_geometry( lua_State * L );
static int propeller_t_char( lua_State * L );
static int propeller_t_mode( lua_State * L );
static int propeller_t_setpos( lua_State * L );
static int propeller_t_getpos( lua_State * L );
static int propeller_t_scroll( lua_State * L );
static int propeller_t_color( lua_State * L );
static int propeller_t_color_fg( lua_State * L );
static int propeller_t_color_bg( lua_State * L );

LUALIB_API int luaopen_propeller( lua_State *L );

/* luaprop function registration array */
static const struct luaL_Reg luapropeller_funcs[] = {

  { "setenv",         propeller_setenv },
  { "unsetenv",       propeller_unsetenv },
  { "getpin",         propeller_getpin },
  { "setpin",         propeller_setpin },
  { "togglepin",      propeller_togglepin },
  { "sleep",          propeller_sleep },
  { "msleep",         propeller_msleep },
  { "sbrk",           propeller_sbrk },
  { "version",        propeller_version },
  { "mount",          propeller_mount },
  { "scan",           propeller_scan },
  { "execute",        propeller_execute },
  { "k_get",          propeller_k_get },
  { "k_wait",         propeller_k_wait },
  { "k_new",          propeller_k_new },
  { "k_ready",        propeller_k_ready },
  { "k_clear",        propeller_k_clear },
#ifndef __CATALINA_NO_MOUSE
  { "m_button",       propeller_m_button },
  { "m_abs_x",        propeller_m_abs_x },
  { "m_abs_y",        propeller_m_abs_y },
  { "m_delta_x",      propeller_m_delta_x },
  { "m_delta_y",      propeller_m_delta_y },
  { "m_reset",        propeller_m_reset },
  { "m_bound_limits", propeller_m_bound_limits },
  { "m_bound_scales", propeller_m_bound_scales },
  { "m_bound_x",      propeller_m_bound_x },
  { "m_bound_y",      propeller_m_bound_y },
#endif
  { "t_geometry",     propeller_t_geometry },
  { "t_char",         propeller_t_char },
  { "t_mode",         propeller_t_mode },
  { "t_setpos",       propeller_t_setpos },
  { "t_getpos",       propeller_t_getpos },
  { "t_scroll",       propeller_t_scroll },
  { "t_color",        propeller_t_color },
  { "t_color_fg",     propeller_t_color_fg },
  { "t_color_bg",     propeller_t_color_bg },
  { NULL, NULL }
};

/***********************
 * propeller functions *
 ***********************/

static int propeller_setenv( lua_State *L ) {
#ifdef __CATALINA__
  const char *name = luaL_checkstring(L, 1);
  const char *value = luaL_checkstring(L, 2);
  int overwrite = (int) luaL_checkinteger( L, 3);
  pushint(L, setenv(name, value, overwrite));
  return 1;
#else
  return 0;
#endif
}

static int propeller_unsetenv( lua_State *L ) {
#ifdef __CATALINA__
  const char *name = luaL_checkstring(L, 1);
  pushint(L, unsetenv(name));
  return 1;
#else
  return 0;
#endif
}

static int propeller_getpin( lua_State *L ) {
#ifdef __CATALINA__
  lua_Integer pin = luaL_checkinteger( L, 1 );
#ifdef __CATALINA_P2
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 63)), 1, "pin not in range 0 .. 63" );
#else
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 31)), 1, "pin not in range 0 .. 31" );
#endif
  lua_settop(L, 0); // pop all
  pushint( L, getpin(pin) );
  return 1;
#else
  return 0;
#endif
}

static int propeller_setpin( lua_State *L ) {
#ifdef __CATALINA__
  lua_Integer pin = luaL_checkinteger( L, 1 );
  lua_Integer state = luaL_checkinteger( L, 2 );
#ifdef __CATALINA_P2
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 63)), 1, "pin not in range 0 .. 63" );
#else
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 31)), 1, "pin not in range 0 .. 31" );
#endif
  luaL_argcheck( L, ((state == 0)||(state == 1)), 2, "state not 0 or 1" );
  lua_settop(L, 0); // pop all
  setpin(pin, state);
  return 0;
#else
  return 0;
#endif
}

static int propeller_togglepin( lua_State *L ) {
#ifdef __CATALINA__
  lua_Integer pin = luaL_checkinteger( L, 1 );
#ifdef __CATALINA_P2
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 63)), 1, "pin not in range 0 .. 63" );
#else
  luaL_argcheck( L, ((pin >= 0)&&(pin <= 31)), 1, "pin not in range 0 .. 31" );
#endif
  lua_settop(L, 0); // pop all
  togglepin(pin);
  return 0;
#else
  return 0;
#endif
}

/* sleep for a specified number of seconds. */
static int propeller_sleep( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate parameter is a positive number */
     register lua_Integer secs = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, secs >= 0, 1, "secs must be zero or positive" );
     lua_settop(L, 0); // pop all
     if (secs > 0) {
       _waitsec(secs);
     }
  }
#endif
  return 0;
}

/* sleep for a specified number of microseconds. */
static int propeller_msleep( lua_State *L ) {
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     /* validate parameter is a positive number */
     register lua_Integer msecs = luaL_checkinteger( L, 1 );
     luaL_argcheck( L, msecs >= 0, 1, "msecs must be zero or positive" );
     lua_settop(L, 0); // pop all
     if (msecs > 0) {
       _waitms(msecs);
     }
  }
#endif
  return 0;
}

/* return the current value of the C system break (sbrk) 
 * Also, if the parameter is true, defragment the heap memory
 * NOTE: THIS VERSION IS NOT THREAD-SAFE - USE THE VERSION IN
 *       THE "threads" MODULE IN MULTI-PROCESS PROGRAMS */
static int propeller_sbrk( lua_State *L ) {
  register lua_Integer s;
#ifdef __CATALINA__
  if (lua_gettop(L) > 0) {
     if (lua_toboolean( L, 1) ) { /* defragment flag */
       malloc_defragment();
     }
  }
  s = sbrk(0);
  lua_settop(L, 0); // pop all
  pushint( L, s);
#else
  lua_settop(L, 0); // pop all
  pushint( L, 0);
#endif
  return 1;
}

/* get a version number - default is the LUA_VERSION_NUM */
static int propeller_version( lua_State *L ) {
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

/*
 * mount - mount a FAT directory for scanning with "scan" - note that 
 *         this uses static C variables, so only one Lua thread can
 *         scan at a time. 
 *
 * Returns the result of mountFatVolume:
 *
 *   -1 error (e.g. could not read sector or partition table)
 *    0 Unknown file system or no partition found
 *    1 FAT12
 *    2 FAT16
 *    3 FAT32
 */
static int propeller_mount( lua_State *L ) {
#ifdef __CATALINA__
   pushint( L, mountFatVolume() );
   return 1;
#else
   return -1;
#endif
}

#ifdef __CATALINA__
static char nulldir[] = "/";
static char nullpattern[] = "*";
static int  match_function = LUA_NOREF;
static lua_State *match_state = NULL;

static void match_callback(unsigned char *name, 
                           unsigned int   attr, 
                           unsigned long  size) {
   //retrieve function and call it
   if ((match_function != 0) && (match_state != NULL)) { 
      lua_rawgeti(match_state, LUA_REGISTRYINDEX, match_function);
      //push the name as a Lua string
      lua_pushstring(match_state, (const char *)name); 
      // push the attributes as an integer
      pushint(match_state, attr); 
      // push the size as an integer
      pushint(match_state, size); 
      lua_call(match_state, 3, 0); 
   }
   else {
      printf("no match function!\n");
   }
}
#endif

/*
 * scan - scan a directory for a pattern, calling a Lua 
 *        function on each matching file in the directory
 * 
 * The parameters are:
 *
 *    1. The lua function to call (no default)
 *    2. The directory to open (default is "/")
 *    3. The pattern to match (default is "*")
 * 
 * Returns:
 *    always returns 0
 *     
 */
static int propeller_scan( lua_State *L ) {
#ifdef __CATALINA__
   register int n = lua_gettop(L);
   register const char *dirname;
   register const char *pattern;

   if (n >= 1) {
      if (!lua_isfunction( L, 1 ) || lua_iscfunction( L, 1) ) {
         luaL_error( L, "first argument must be a Lua function");
      }
   }
   if (n >= 2) {
      dirname = lua_tostring( L, 2 );
      if (dirname == NULL) {
         dirname = nulldir;
      }
   }
   if (n >= 3) {
      pattern = lua_tostring( L, 3 );
      if (pattern == NULL) {
         pattern = nullpattern;
      }
   }
   if (n > 0) {
      lua_pop( L, n - 1); // pop all except function
      // save our state and function
      match_function = luaL_ref( L, LUA_REGISTRYINDEX);
      match_state = L;
      doDir((unsigned char *)dirname, (unsigned char *)pattern, &match_callback);
      luaL_unref( L, LUA_REGISTRYINDEX, match_function); 
      match_function = LUA_NOREF;
      match_state = NULL;
   }
#endif
   return 0;
}

/*
 * execute - execute a Catalyst command by writing the command
 *           to the file and then rebooting the propeller - if 
 *           successful, NEVER RETURNS.
 * 
 * The parameters are:
 *
 *    1. The Catalyst command to execute (no default)
 *    2. The file to write the command to (default is "EXECONCE.TXT")
 * 
 * Returns:
 *    -1 cannot open file for write
 *    -2 cannot write to file
 *    -3 invalid command (not a string?)
 *    -4 other error
 *     
 */
static int propeller_execute( lua_State *L ) {
#ifdef __CATALINA__
   register int n = lua_gettop(L);
   register const char *command = NULL;
   register const char *filename = NULL;
   register FILE *file = NULL;
   register int len = 0;

   if (n < 1) {
      return -4; // no command to execute
   }
   command = lua_tostring( L, 1 );
   if (n >= 2) {
      filename = lua_tostring( L, 2 );
   }
   lua_settop(L, 0); // pop all
      
   if (command == NULL) {
      return -3;
   }
   if (filename == NULL) {
      filename = "EXECONCE.TXT";
   }
   remove(filename); // in case file exists
   file = fopen(filename, "w"); // open new file
   if (file != NULL) {
      len = strlen(command);
      if (fwrite(command, 1, len, file) == len) {
         fclose(file);
         exit(0);
         return -4; // should never get here!
      }
      fclose(file);
      return -2; // cannot write to file
   }
   return -1; // cannot open file
#else
   return -4;
#endif
}

/* k_get - the Catalina k_get function */
static int propeller_k_get( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_get() );
  return 1;
#else
  return 0;
#endif
}

/* k_wait - the Catalina k_wait function */
static int propeller_k_wait( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_wait() );
  return 1;
#else
  return 0;
#endif
}

/* k_new - the Catalina k_new function */
static int propeller_k_new( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_new() );
  return 1;
#else
  return 0;
#endif
}

/* k_ready - the Catalina k_ready function */
static int propeller_k_ready( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_ready() );
  return 1;
#else
  return 0;
#endif
}

/* k_clear - the Catalina k_clear function */
static int propeller_k_clear( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, k_clear() );
  return 1;
#else
  return 0;
#endif
}

#ifndef __CATALINA_NO_MOUSE

/* m_button - the Catalina m_button function */
static int propeller_m_button( lua_State *L ) {
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
static int propeller_m_abs_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_abs_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_abs_y - the Catalina m_abs_y function */
static int propeller_m_abs_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_abs_y() );
  return 1;
#else
  return 0;
#endif
}

/* m_delta_x - the Catalina m_delta_x function */
static int propeller_m_delta_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_delta_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_delta_y - the Catalina m_delta_y function */
static int propeller_m_delta_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_delta_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_reset - the Catalina m_reset function */
static int propeller_m_reset( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_reset() );
  return 1;
#else
  return 0;
#endif
}

/* m_bound_limits - the Catalina m_bound_limits function */
static int propeller_m_bound_limits( lua_State *L ) {
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
static int propeller_m_bound_scales( lua_State *L ) {
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
static int propeller_m_bound_x( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_bound_x() );
  return 1;
#else
  return 0;
#endif
}

/* m_bound_y - the Catalina m_bound_y function */
static int propeller_m_bound_y( lua_State *L ) {
#ifdef __CATALINA__
  pushint( L, m_bound_y() );
  return 1;
#else
  return 0;
#endif
}

#endif // __CATALINA_NO_MOUSE

/* t_geometry - the Catalina t_geometry function */
static int propeller_t_geometry( lua_State * L ) {
#ifdef __CATALINA__
  pushint( L, t_geometry() );
  return 1;
#else
  return 0;
#endif
}

/* t_char - the Catalina t_char function */
static int propeller_t_char( lua_State * L ) {
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
static int propeller_t_mode( lua_State * L ) {
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
static int propeller_t_setpos( lua_State * L ) {
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
static int propeller_t_getpos( lua_State * L ) {
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
static int propeller_t_scroll( lua_State * L ) {
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
static int propeller_t_color( lua_State * L ) {
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
static int propeller_t_color_fg( lua_State * L ) {
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
static int propeller_t_color_bg( lua_State * L ) {
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

LUALIB_API int luaopen_propeller( lua_State *L ) {

  /* register luapropeller functions */
  luaL_newlib( L, luapropeller_funcs );

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


