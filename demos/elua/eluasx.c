/******************************************************************************
 *                   A general-purpose Lua Client and Server.                 *
 *                                                                            *
 * This program demonstrates executing a Lua server from XMM RAM that         *
 * provides services to a Lua client executing from Hub RAM.                  *
 *                                                                            *
 * Set the CATALINA_DEFINE environemnt variable to your platform, and then    *
 * compile this program using Catapult - for example:                         *
 *                                                                            *
 *   set CATALINA_DEFINE=P2_EDGE                                              *
 *   catapult eluasx.c                                                        *
 *                                                                            *
 * This program reads Lua programs from the files specified on the command    *
 * line. If no files are specified, it defaults to loading from the files     *
 * 'client.lux' and 'server.lux'. Both the client and the server must be      *
 * compiled Lua binary files. For example:                                    *
 *                                                                            *
 *    eluasx client.lux server.lux                                            *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-W-w -p2 -C CONST_ARGS -C SIMPLE -C VT100 -C MHZ_200 -C CLOCK -O5 -lcx -lmc -lluax xinit.c -C ENABLE_PROPELLER)

#include <catapult.h>
#include <service.h>
#include <stdlib.h>
#include <string.h>
#include <alloca.h>

#define MAX_NAMELEN   12 // for DOS 8.3 file names
#define MAX_SERVICES  20 // arbitrary

#define DEFAULT_CLIENT "client.lux"
#define DEFAULT_SERVER "server.lux"

#define DEFAULT_BG "background"

/*
 * define a type to be used for exchanging data between
 * the primary and secondary functions. Used to pass the 
 * file names and for startup synchronization.
 */
typedef struct shared_data {
   char *client;
   char *server;
   int ready;
   int start;
} shared_data_t;

/******************************************************************************
 *                                                                            *
 * The client - calls services provided by the server                         *
 *                                                                            *
 ******************************************************************************/
#pragma catapult secondary client(shared_data_t) address(0x20D9C) mode(CMM) stack(100000) 

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

void client(shared_data_t *s) {
   int result;
   lua_State *L;

   // create a Lua state and open the standard libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // put garbage collector in incremental mode, and make it more agressive
   lua_gc(L, LUA_GCINC, 105, 0);  /* GC in incremental mode */
   lua_gc(L, LUA_GCRESTART);  /* ensure GC is started */

   // load the Lua code 
   if ((result = luaL_loadfile(L, s->client)) == LUA_OK) {

     // tell the server we are ready
      s->ready = 1;

     // wait till we are told to start by the server 
      while (!s->start);

      // use lua_pcall to run it
      result = lua_pcall(L, 0, 0, 0);
   }
   if (result != LUA_OK) {
      // something went wrong
      t_printf("Unexpected result (%d) from client - '%s'\n", 
          result, lua_tostring(L, -1));
   }

   // not necessary here, but it is good practice to tidy up
   lua_close(L);

}

/******************************************************************************
 *                                                                            *
 * The server - executes a Lua dispatcher, dispatching calls to the Lua       *
 * functions offered by the server                                            *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary server binary(eluasx) mode(XMM) options(-C CACHED_64K)

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

/*
 * define a list of services, parameter profiles and service identifiers.
 * initialize it to null - the list will be loaded from the server itself.
 */
svc_entry_t Lua_service_list[MAX_SERVICES + 1] = { 
  {"", NULL, 0, 0, 0}
};

int main(int argc, char *argv[]) {

   shared_data_t shared = { NULL, NULL, 0, 0 };
   int cog;
   int result;
   lua_State *L;

   // align sbrk to 2k boundary - Lua needs this!
   _align_sbrk(11,0,0);
   
   // process command line arguments - note the
   // use of alloca to make sure the strings in 
   // the shared data structure are in Hub RAM.
   // use default names if not specified.
   if (argc > 2) {
      shared.server = alloca(strlen(argv[2]) + 1);
      strcpy(shared.server, argv[2]);
   }
   else {
      shared.server = alloca(MAX_NAMELEN + 1);
      strcpy(shared.server, DEFAULT_SERVER);
   }
   if (argc > 1) {
      shared.client = alloca(strlen(argv[1]) + 1);
      strcpy(shared.client, argv[1]);
   }
   else {
      shared.client = alloca(MAX_NAMELEN + 1);
      strcpy(shared.client, DEFAULT_CLIENT);
   }

   // re-register this cog as a server (it will already
   // be registered, but as a kernel, not a server)
   _register_plugin(_cogid(), LMM_SVR);

   // load the client - it will wait for the 'start'
   // field of the shared_data argument to be set 
   RESERVE_AND_START(client, shared, ANY_COG, cog);

   // wait till the client is loaded and ready
   while (!shared.ready);

   // create a new Lua state and open the standard Lua libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // load the Lua code and execute it so Lua knows about the
   // functions that will be called when we dispatch
   result = luaL_loadfile(L, shared.server) || lua_pcall(L, 0, 0 ,0);
   if (result != LUA_OK) {
      // something went wrong
      t_printf("Unexpected result (%d) from server\n", result);
   }

   // load the list of supported services from the Lua server
   _load_Lua_service_list(L, Lua_service_list, MAX_SERVICES);

   //register the services, so clients can find them
   _register_services(_locknew(), Lua_service_list);

   // start the client
   shared.start = 1;

   // dispatch calls to the server
   while(1) {
      _dispatch_Lua_bg(L, Lua_service_list, DEFAULT_BG);
   }
}
