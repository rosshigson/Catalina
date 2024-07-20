/******************************************************************************
 *                A simple embedded Lua "hello world" program.                *
 *                                                                            *
 * On the Propeller 1, this program must be compiled to use the SMALL or      *
 * LARGE memory model.                                                        *
 *                                                                            *
 * On the Propeller 2, this program can be compiled in any memory model.      *
 *                                                                            *
 * Compile this program with a command like:                                  *
 *                                                                            *
 *   catalina -lcx -lm -llua lhello.c linit.c -W-w -C SMALL                   *
 * or                                                                         *
 *   catalina -p2 -lcx -lm -llua lhello.c linit.c -W-w -C COMPACT             *
 *                                                                            *
 ******************************************************************************/

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

void main(int argc, char *argv[]) {

   // Lua code to execute - print a friendly message
   char *code = "print('Hello, World (from Lua!)')";
   int result;

   // creat a new Lua state and open the standard libraries
   lua_State *L = luaL_newstate();
   luaL_openlibs(L);

   // load the string and use lua_pcall to run the code
   if ((result = luaL_loadstring(L, code)) == LUA_OK) {
      result = lua_pcall(L, 0, 0, 0);
   }
   if (result != LUA_OK) {
      // something went wrong
      printf("Unexpected result (%d)\n", result);
   }

   // not necessary here, but it is good practice to tidy up
   lua_close(L);
}

