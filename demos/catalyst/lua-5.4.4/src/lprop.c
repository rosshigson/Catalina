/*
** luapropeller API
*/

#include "lua.h"
#include "lauxlib.h"
#include <string.h>
#include <stdlib.h>

#ifdef __CATALINA__
#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <hmi.h>
#include "storage.h"
#endif

/* version number of the "propeller" module */
#define MODULE_VERSION_NUM 810

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
static int propeller_cogid( lua_State *L );
static int propeller_locknew( lua_State *L );
static int propeller_lockclr( lua_State *L );
static int propeller_lockset( lua_State *L );
static int propeller_lockret( lua_State *L );
static int propeller_locktry( lua_State *L );
static int propeller_lockrel( lua_State *L );
static int propeller_clkfreq( lua_State *L );
static int propeller_clkmode( lua_State *L );
static int propeller_getcnt( lua_State *L );
static int propeller_muldiv64( lua_State *L );
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

LUALIB_API int luaopen_propeller( lua_State *L );

/* luaprop function registration array */
static const struct luaL_Reg luapropeller_funcs[] = {

  { "cogid",          propeller_cogid },    // p1/p2
  { "locknew",        propeller_locknew },  // p1/p2
  { "lockclr",        propeller_lockclr },  // p1/p2
  { "lockset",        propeller_lockset },  // p1/p2
  { "lockret",        propeller_lockret },  // p1/p2
  { "locktry",        propeller_locktry },  // p2 only
  { "lockrel",        propeller_lockrel },  // p2 only
  { "clockfreq",      propeller_clkfreq },  // p1/p2
  { "clockmode",      propeller_clkmode },  // p1/p2 - result p1/p2 dependent
  { "getcnt",         propeller_getcnt },   // return 1 int on p1, 2 int on p2
  { "muldiv64",       propeller_muldiv64 }, // p2 only
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
  { NULL, NULL }
};

/***********************
 * propeller functions *
 ***********************/

static int propeller_cogid( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, _cogid());
  return 1;
#else
  return 0;
#endif
}

static int propeller_locknew( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, _locknew());
  return 1;
#else
  return 0;
#endif
}

static int propeller_lockclr( lua_State *L ) {
#ifdef __CATALINA__
  int lock = (int) luaL_checkinteger( L, 1);
  pushint(L, _lockclr(lock));
  return 1;
#else
  return 0;
#endif
}

static int propeller_lockset( lua_State *L ) {
#ifdef __CATALINA__
  int lock = (int) luaL_checkinteger( L, 1);
  pushint(L, _lockset(lock));
  return 1;
#else
  return 0;
#endif
}

static int propeller_lockret( lua_State *L ) {
#ifdef __CATALINA__
  int lock = (int) luaL_checkinteger( L, 1);
  _lockret(lock);
  return 0;
#else
  return 0;
#endif
}

static int propeller_locktry( lua_State *L ) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
  int lock = (int) luaL_checkinteger( L, 1);
  pushint(L, _locktry(lock));
  return 1;
#else
  return 0;
#endif
#else
  return 0;
#endif
}

static int propeller_lockrel( lua_State *L ) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
  int lock = (int) luaL_checkinteger( L, 1);
  _lockrel(lock);
  return 0;
#else
  return 0;
#endif
#else
  return 0;
#endif
}

static int propeller_clkfreq( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, _clockfreq());
  return 1;
#else
  return 0;
#endif
}

static int propeller_clkmode( lua_State *L ) {
#ifdef __CATALINA__
  pushint(L, _clockmode());
  return 1;
#else
  return 0;
#endif
}

static int propeller_getcnt( lua_State *L ) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
  counter64_t count64;
  count64 = _cnthl();
  pushint(L, count64.low);
  pushint(L, count64.high);
#else
  pushint(L, _cnt());
  pushint(L, 0);
#endif
  return 2;
#else
  return 0;
#endif
}

static int propeller_muldiv64( lua_State *L ) {
#ifdef __CATALINA__
#ifdef __CATALINA_P2
  int mul1 = (int) luaL_checkinteger( L, 1);
  int mul2 = (int) luaL_checkinteger( L, 2);
  int div  = (int) luaL_checkinteger( L, 3);
  pushint(L, _muldiv64((uint32_t) mul1, (uint32_t) mul2, (uint32_t) div));
  return 1;
#else
  return 0;
#endif
#else
  return 0;
#endif
}

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


