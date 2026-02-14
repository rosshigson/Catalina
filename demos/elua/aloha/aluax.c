/******************************************************************************
 *        A general-purpose Lua Client and Server for ALOHA services.         *
 *                                                                            *
 * This program demonstrates executing a Lua server from XMM RAM that         *
 * dispatches service calls made from a Lua secondary client executing        * 
 * from Hub RAM.                                                              *
 *                                                                            *
 * Set the CATALINA_DEFINE environemnt variable to the appropriate platform   *
 * and then compile this program using Catapult - for example:                *
 *                                                                            *
 *   set CATALINA_DEFINE=P2_MASTER                                            *
 *   catapult aluax.c                                                         *
 * or                                                                         *
 *   set CATALINA_DEFINE=P2_SLAVE                                             *
 *   catapult aluax.c                                                         *
 *                                                                            *
 * This program reads Lua programs from the files specified on the command    *
 * line. If no files are specified, it defaults to loading from the files     *
 * 'client.lux' and 'server.lux'.                                             *
 *                                                                            *
 * To use ALOHA services, the program must be executed on TWO Propellers,     *
 * connected via a serial link. For example, on one Propeller execute:        *
 *                                                                            *
 *    aluax client.lux remote.lux                                             *
 *                                                                            *
 * And on the other Propeller, execute:                                       *
 *                                                                            *
 *    aluax remote.lux server.lux                                             *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-W-w -p2 -C CONST_ARGS -C SIMPLE -C VT100 -O5 -C MHZ_200 -C CLOCK -lcx -lmc -lserial2 -lluax linit.c -C LUA_SERVICE aloha.c)

#include <catapult.h>
#include <service.h>
#include <stdlib.h>
#include <string.h>
#include <hmi.h>

#define MAX_NAMELEN   12 // for DOS 8.3 file names
#define MAX_SERVICES  50 // arbitrary

#define DEFAULT_CLIENT "client.lux"
#define DEFAULT_SERVER "server.lux"
#define DEFAULT_EXTN   ".lux"

#define DEFAULT_BG "background"

/*
 * define a type to be used for exchanging data between
 * the primary and secondary functions. In this program
 * it is used to pass the file names and for startup 
 * synchronization.
 */
typedef struct shared_data {
   char client[MAX_NAMELEN + 5];
   char server[MAX_NAMELEN + 5];
   int ready;
   int start;
} shared_data_t;

/******************************************************************************
 *                                                                            *
 * The client - calls services provided by the server                         *
 *                                                                            *
 ******************************************************************************/
#pragma catapult secondary client(shared_data_t) address(0x1CD54) mode(CMM) stack(120000) options(-lthreads)

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
 * The server - executes a Lua dispatcher, dispatching calls                  *
 * to the Lua functions specified in Lua_service_list                          *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary server binary(aluax) mode(XMM) options(dsptch_l.c)

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
   shared_data_t shared;

   memset(&shared, 0, sizeof(shared));

   // process command line arguments
   if (argc > 2) {
      if (strchr(argv[2], '.') == NULL) {
         strncpy(shared.server, argv[2], MAX_NAMELEN);
         strcat(shared.server, DEFAULT_EXTN);
      }
      else {
         strncpy(shared.server, argv[2], MAX_NAMELEN);
      }
   }
   if (argc > 1) {
      if (strchr(argv[1], '.') == NULL) {
         strncpy(shared.client, argv[1], MAX_NAMELEN);
         strcat(shared.client, DEFAULT_EXTN);
      }
      else {
         strncpy(shared.client, argv[1], MAX_NAMELEN);
      }
   }
   // use default names if no arguments specified
   if (strlen(shared.client) == 0) {
      strncpy(shared.client, DEFAULT_CLIENT, MAX_NAMELEN);
   }
   if (strlen(shared.server) == 0) {
      strncpy(shared.server, DEFAULT_SERVER, MAX_NAMELEN);
   }
   //t_printf("client = %s\n", shared.client);
   //t_printf("server = %s\n", shared.server);

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
      t_printf("Unexpected result (%d) from server - '%s'\n", 
          result, lua_tostring(L, -1));
   }

   // load the list of supported services from the Lua server
   my_load_Lua_service_list(L, Lua_service_list, MAX_SERVICES);

   //register the services, so clients can find them
   _register_services(_locknew(), Lua_service_list);

   // start the client
   shared.start = 1;

   // dispatch service calls
   while(1) {
      my_dispatch_Lua_bg(L, Lua_service_list, DEFAULT_BG);
   }
}
