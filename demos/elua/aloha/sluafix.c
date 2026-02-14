#pragma catapult primary server binary(sluafix) mode(NMM) options(-W-w -p2 -O5 -lluax linit.c -C LUA_SERVICE dsptch_l.c aloha.c -lcix -lmc -lserial2 -C SIMPLE -C VT100 -C MHZ_200 -C CLOCK -C LUA_NO_OPT)
/******************************************************************************
 *        A general-purpose Lua Server (no client) for remote services.       *
 *                                                                            *
 * This program demonstrates executing a Lua server that dispatches service   *
 * calls made from a remote Lua secondary client. This program contains no    *
 * client of its own. Therefore it is not a multi-model program, and is able  *
 * to execute from Hub RAM.                                                   *
 *                                                                            *
 * NOTE: This program uses the integer version of the extended C library      *
 * (i.e. -lcix). This means that while the program can use floating point     *
 * it has no floating point I/O capability. It also disables the Lua 'math',  *
 * 'os', 'utf8' and 'debug' libraries to save space, so the functions         *
 * provided by those libraries will be unavailable in Lua.                    *
 *                                                                            *
 * Set the CATALINA_DEFINE environemnt variable to the appropriate platform   *
 * and then compile this program using Catapult - for example:                *
 *                                                                            *
 *   set CATALINA_DEFINE=P2_SLAVE                                             *
 *   catapult sluafix.c                                                       *
 *                                                                            *
 * This program reads Lua programs from the files specified on the command    *
 * line. If no files are specified, it defaults to loading from the files     *
 * 'server.lux', which must be a compiled Lua binary file. For example:       *
 *                                                                            *
 *    sluafix server                                                          *
 *                                                                            *
 ******************************************************************************/

#include <service.h>
#include <stdlib.h>
#include <string.h>
#include <hmi.h>

#define MAX_NAMELEN   12 // for DOS 8.3 file names
#define MAX_SERVICES  50 // arbitrary

#define DEFAULT_SERVER "server.lux"
#define DEFAULT_EXTN   ".lux"

#define DEFAULT_BG "background"

/******************************************************************************
 *                                                                            *
 * The server - executes a Lua dispatcher, dispatching calls                  *
 * to the Lua functions specified in Lua_service_list                          *
 *                                                                            *
 ******************************************************************************/

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

/*
 * define a list of services, parameter profiles and service identifiers
 * - note that Lua services require only the names of the functions, and
 * their addresses should be NULL. Initialize the list with a NULL entry,
 * because we load the actual list from the server itself.
 */
svc_entry_t Lua_service_list[MAX_SERVICES + 1] = { 
  {"", NULL, 0, 0, 0, NULL, 0}
};

extern void my_dispatch_Lua_bg(lua_State *L, svc_list_t list, char *bg);

extern int my_load_Lua_service_list(lua_State *L, svc_list_t services, int max);

int main(int argc, char *argv[]) {

   int cog;
   int result;
   lua_State *L;
   char server[MAX_NAMELEN + 5];

   // process command line arguments
   memset(server, 0, sizeof(server));
   if (argc > 1) {
      if (strchr(argv[1], '.') == NULL) {
         strncpy(server, argv[1], MAX_NAMELEN);
         strcat(server, DEFAULT_EXTN);
      }
      else {
         strncpy(server, argv[1], MAX_NAMELEN);
      }
   }
   // use default name if no arguments specified
   if (strlen(server) == 0) {
      strncpy(server, DEFAULT_SERVER, MAX_NAMELEN);
   }
   //t_printf("server = %s\n", server);

   // re-register this cog as a server (it will already
   // be registered, but as a kernel, not a server)
   _register_plugin(_cogid(), LMM_SVR);

   // create a new Lua state and open the standard Lua libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // put garbage collector in incremental mode, and make it more agressive
   lua_gc(L, LUA_GCINC, 105, 0);  /* GC in incremental mode */
   lua_gc(L, LUA_GCRESTART);  /* ensure GC is started */

   // load the Lua code and execute it so Lua knows about the
   // functions that will be called when we dispatch
   result = luaL_loadfile(L, server) || lua_pcall(L, 0, 0 ,0);
   if (result != LUA_OK) {
      // something went wrong
      t_printf("Unexpected result (%d) from server - '%s'\n", 
          result, lua_tostring(L, -1));
   }

   // load the list of supported services from the Lua server
   my_load_Lua_service_list(L, Lua_service_list, MAX_SERVICES);

   //register the services, so clients can find them
   _register_services(_locknew(), Lua_service_list);

   // dispatch service calls
   while(1) {
      my_dispatch_Lua_bg(L, Lua_service_list, DEFAULT_BG);
   }
}
