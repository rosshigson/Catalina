/******************************************************************************
 *              A simple embedded Lua script execution program.               *
 *                                                                            *
 * On the Propeller 1, this program must be compiled to use the SMALL or      *
 * LARGE memory model.                                                        *
 *                                                                            *
 * On the Propeller 2, this program can be compiled in any memory model.      *
 *                                                                            *
 * Compile this program with a command like:                                  *
 *                                                                            *
 *   catalina -lcx -lm -llua lscript.c linit.c -W-w -C SMALL                  *
 * or                                                                         *
 *   catalina -p2 -lcx -lm -llua lscript.c linit.c -W-w -C COMPACT            *
 *                                                                            *
 ******************************************************************************/

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

int main(int argc, char *argv[]) {
   int result;

   // creat a new Lua state and open the standard libraries
   lua_State *L = luaL_newstate();
   luaL_openlibs(L);

   // execute the script contained in the file "script.lua"
   result = luaL_dofile(L, "script.lua");

   if (result != LUA_OK) {
      // something went wrong
      printf("Unexpected result (%d)\n", result);
      printf("Check that 'script.lua' exists.\n", result);
   }

   // not necessary here, but it is good practice to tidy up
   lua_close(L);
}

