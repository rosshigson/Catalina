/******************************************************************************
 *                         Using Catapult with Lua.                           *
 *                                                                            *
 * This program demonstrates executing one Lua program from XMM RAM while     *
 * simultaneously executing another (possibly multi-threaded) Lua program     *
 * from Hub RAM, and having the two Lua programs interact. This program       *
 * requires a Propeller 2 with XMM RAM, and is configured for a P2-EC32MB.    *
 *                                                                            *
 * Compile this program using catapult with a command like:                   *
 *                                                                            *
 *   catapult lualua.c                                                        *
 *                                                                            *
 * Then copy lualua.bin, first.lua and second.lua to a Catalyst SD card       *
 * and execute it with the command:                                           *
 *                                                                            *
 *    lualua first.lua second.lua                                             *
 *                                                                            *
 * Note that if not specified, the file names default to first.lua and        *
 * second.lua, so you can also just enter:                                    *
 *                                                                            *
 *    lualua                                                                  *
 *                                                                            *
 * See the Catalina document 'Getting Started with Catapult' for details on   *
 * catapult, and 'Lua on the Propeller 2 with Catalina' for details on Lua    *
 * multi-threading support.                                                   *
 *                                                                            *
 * Note that if you modify this program, you will probably have to modify the *
 * address specified in the secondary pragma - but the program will tell you  *
 * what address to use when you compile and execute it. You can freely modify *
 * the Lua programs this program executes without recompiling this program,   *
 * unless the stack size required by the Lua programs changes as a result.    *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-p2 -C P2_EDGE -C SIMPLE -C CLOCK -lmc -lcx -llua)

#include <catapult.h>
#include <stdlib.h>
#include <string.h>
#include <string.h>
#include <prop2.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#define MAX_NAMELEN   12 // for DOS 8.3 file names

#define DEFAULT_FIRST  "first.lua"
#define DEFAULT_SECOND "second.lua"
#define DEFAULT_EXTN   ".lua"

/*
 * define a type to be used for exchanging data between
 * the first and second Lua programs. In this example
 * it is also used to pass the file names and can also
 * be used for startup synchronization (if required).
 * The shared data must be in Hub RAM, and so it is
 * recommended it be a local variable in the C main 
 * function.
 */
typedef struct shared_data {
   char first[MAX_NAMELEN + 5];
   char second[MAX_NAMELEN + 5];
   int ready;
   int start;
   int data;
} shared_data_t;

/*
 * define a C function that can be called from Lua to access the data field
 * of the shared data - it accepts either one or two parameters - the first 
 * (required) is the address of the shared data and the second (optional) 
 * is a new integer value for the data. It returns the old value of the data.
 *
 * Noe that because this function is defined in the common segment, it will 
 * be available to both the first and second Lua programs ...
 */
static int data(lua_State *L) {
   int old_data = 0;
   shared_data_t *s;
   int n = lua_gettop(L); // number of arguments

   if (n == 2) {
      // optional argument specified - update the data
      register lua_Integer new_data = luaL_checkinteger(L, 2);
      s = (shared_data_t *)lua_topointer(L, -2);
      // and return the previous data
      old_data = s->data;
      s->data = new_data;
      lua_pop(L, 2);
      lua_pushinteger(L, old_data);
      return 1;
   }
   else if (n == 1) {
      // optional argument not specified - return current data
      s = (shared_data_t *)lua_topointer(L, -1);
      old_data = s->data;
      lua_pop(L, 1);
      lua_pushinteger(L, old_data);
      return 1;
   }
   else {
      // incorrect number of arguments - return 0
      return 0;
   }
}

/******************************************************************************
 *                                                                            *
 * The secondary function - executes second.lua                               *
 *                                                                            *
 * The secondary function always executes entirely from Hub RAM, and so it    *
 * can include multi-processing - this is enabled by including the threads    *
 * library.                                                                   *
 *                                                                            *
 * We allocate 150000 bytes stack space - this can be adjusted down if this   *
 * amount is not required in the second Lua program, and/or more is required  *
 * by the first Lua program.                                                  *
 *                                                                            *
 ******************************************************************************/
#pragma catapult secondary second(shared_data_t) mode(CMM) address(0x92FC) stack(150000) options(-W-w -lthreads linit.c)

void second(shared_data_t *s) {

   int result;
   lua_State *L;

   // create a new Lua state and open the standard Lua libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // put garbage collector in incremental mode, and make it more agressive
   lua_gc(L, LUA_GCINC, 105, 0);  /* GC in incremental mode */
   lua_gc(L, LUA_GCRESTART);  /* ensure GC is started */
   
   // load the second Lua program, and execute it - note that we have to 
   // execute it before the individual functions the file contains can
   // be called (such as "main")
   result = luaL_loadfile(L, s->second) || lua_pcall(L, 0, 0 ,0);
   if (result == LUA_OK) {

      // tell the primary we are ready, then wait to be told to start 
      // (in this example, no synchronization is required)
      s->ready = 1;
      while (!s->start);

      // set up the C 'data' function, so it can can be called from Lua 
      lua_pushcfunction(L, data);
      lua_setglobal(L, "data");
      // Execute the "main" function in the second Lua program - we do
      // this so that we can pass the address of the shared data to it 
      // (as light userdata) - i.e. main(&shared). We could pass other
      // parameters as well if required.
      lua_getglobal(L, "main");
      lua_pushlightuserdata(L, s);
      result = lua_pcall(L, 1, 1, 0);
      if (result != LUA_OK) {
         // something went wrong
         t_printf("Unexpected result (%d) calling second Lua - '%s'\n", 
            result, lua_tostring(L, -1));
      }
   }
   else {
     // something went wrong
     t_printf("Unexpected result (%d) loading second Lua - '%s'\n", 
        result, lua_tostring(L, -1));
   }
   lua_close(L);
}


/******************************************************************************
 *                                                                            *
 * The primary function - executes first.lua                                  *
 *                                                                            *
 * The primary function executes from XMM RAM. After processing the command   *
 * line arguments, it loads the secondary function into Hub RAM, which (in    *
 * this program) executes an instance of Lua. Then this functions executes    *
 * another instance of Lua from XMMM RAM.                                     *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary binary(lualua) mode(XMM) options(-W-w linit.c)

void main(int argc, char *argv[]) {

   int cog;
   int result;
   lua_State *L;
   shared_data_t shared;

   memset(&shared, 0, sizeof(shared));

   // process command line arguments
   if (argc > 2) {
      if (strchr(argv[2], '.') == NULL) {
         strncpy(shared.second, argv[2], MAX_NAMELEN);
         strcat(shared.second, DEFAULT_EXTN);
      }
      else {
         strncpy(shared.second, argv[2], MAX_NAMELEN);
      }
   }
   if (argc > 1) {
      if (strchr(argv[1], '.') == NULL) {
         strncpy(shared.first, argv[1], MAX_NAMELEN);
         strcat(shared.first, DEFAULT_EXTN);
      }
      else {
         strncpy(shared.first, argv[1], MAX_NAMELEN);
      }
   }
   // use default names if no arguments specified
   if (strlen(shared.first) == 0) {
      strncpy(shared.first, DEFAULT_FIRST, MAX_NAMELEN);
   }
   if (strlen(shared.second) == 0) {
      strncpy(shared.second, DEFAULT_SECOND, MAX_NAMELEN);
   }

   // start the secondary function, which loads the second Lua program
   RESERVE_AND_START(second, shared, ANY_COG, cog);

   // create a new Lua state and open the standard Lua libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // put garbage collector in incremental mode, and make it more agressive
   lua_gc(L, LUA_GCINC, 105, 0);  /* GC in incremental mode */
   lua_gc(L, LUA_GCRESTART);  /* ensure GC is started */
   
   // load the first Lua program, and execute it - note that we have to 
   // execute it before the individual functions the file contains can
   // be called (such as "main")
   result = luaL_loadfile(L, shared.first) || lua_pcall(L, 0, 0 ,0);
   if (result == LUA_OK) {
     
      // wait till the secondary is ready to start, then start it
      // (in this example, no synchronization is required)
      while (!shared.ready);
      shared.start = 1;

      // set up the C 'data' function, so it can can be called from Lua 
      lua_pushcfunction(L, data);
      lua_setglobal(L, "data");
      // Execute the "main" function in the first Lua program - we do
      // this so that we can pass the address of the shared data to it 
      // (as light userdata) - i.e. main(&shared). We could pass other
      // parameters as well if required.
      lua_getglobal(L, "main");
      lua_pushlightuserdata(L, &shared);
      result = lua_pcall(L, 1, 1, 0);
      if (result != LUA_OK) {
         // something went wrong
         t_printf("Unexpected result (%d) calling first Lua - '%s'\n", 
            result, lua_tostring(L, -1));
      }
   }
   else {
      // something went wrong
      t_printf("Unexpected result (%d) loading first Lua - '%s'\n", 
         result, lua_tostring(L, -1));
   }
   lua_close(L);
}

