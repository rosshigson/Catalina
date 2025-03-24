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

#pragma catapult common options(-W-w -p2 -C CONST_ARGS -C SIMPLE -C VT100 -O5 -C MHZ_200 -C CLOCK -lcx -lmc -lserial2 -lluax xinit.c -C ENABLE_PROPELLER -C ENABLE_HMI aloha.c)

#include <catapult.h>
#include <service.h>
#include <stdlib.h>
#include <string.h>
#include <alloca.h>

#define MAX_NAMELEN   12 // for DOS 8.3 file names
#define MAX_SERVICES  20 // arbitrary

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
#pragma catapult secondary client(shared_data_t) address(0x168DC) mode(CMM) stack(150000) options(-lthreads)

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

int main(int argc, char *argv[]) {

   shared_data_t shared = { NULL, NULL, 0, 0 };
   int cog;
   int result;
   lua_State *L;

   // process command line arguments - note the
   // use of alloca to make sure the strings in 
   // the shared data structure are in Hub RAM.
   if (argc > 2) {
      if (strchr(argv[2], '.') == NULL) {
         shared.server = alloca(strlen(argv[2]) + 5);
         strcpy(shared.server, argv[2]);
         strcat(shared.server, DEFAULT_EXTN);
      }
      else {
         shared.server = alloca(strlen(argv[2]) + 1);
         strcpy(shared.server, argv[2]);
      }
   }
   if (argc > 1) {
      if (strchr(argv[1], '.') == NULL) {
         shared.client = alloca(strlen(argv[1]) + 5);
         strcpy(shared.client, argv[1]);
         strcat(shared.client, DEFAULT_EXTN);
      }
      else {
         shared.client = alloca(strlen(argv[1]) + 1);
         strcpy(shared.client, argv[1]);
      }
   }
   // use default names if no arguments specified
   if (shared.client == NULL) {
      shared.client = alloca(MAX_NAMELEN + 1);
      strcpy(shared.client, DEFAULT_CLIENT);
   }
   if (shared.server == NULL) {
      shared.server = alloca(MAX_NAMELEN + 1);
      strcpy(shared.server, DEFAULT_SERVER);
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
