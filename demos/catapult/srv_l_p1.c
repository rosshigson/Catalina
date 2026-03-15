#pragma catapult common options(-W-w -C C3 -C TTY -C NO_ARGS -lc -lma)

/******************************************************************************
 *                    Using Catapult to build a Lua server.                   *
 *                                                                            *
 * This program demonstrates executing a primary server from XMM RAM that     *
 * dispatches service calls made from one or more C secondary clients to      *
 * Lua functions implemented in the primary server (i.e. from XMM RAM).       *
 *                                                                            *
 * The program uses the Catalina Registry as the mechanism, which enables     *
 * the server to offer multiple services, and also adds lock protection to    *
 * the services. Using the registry supports only a limited number of         *
 * parameter profiles - i.e. those that are required to implement Catalina    *
 * plugins (see func_1 to func_5). However, the basic "short" service can     *
 * also be used to pass a pointer to the shared data structure as the         *
 * parameter, which allows for arbitary data to be exchanged between client   *
 * and server, as usual for catapult programs (see func_6).                   *
 *                                                                            *
 * This version is for a Propeller 1 C3.                                      *
 *                                                                            *
 * Compile this program with a command like:                                  *
 *                                                                            *
 *   catapult srv_l_p1.c                                                      *
 *                                                                            *
 * Before loading, execute 'build_utilities' to build the appropriate XMM     *
 * loader (for a C3 using FLASH with a 1K cache), and then load and execute   *
 * the program with a command like:                                           *
 *                                                                            *
 *   payload -o1 -i FLASH srv_l_p1                                            *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 * This program can also be compiled 'monolitically' (i.e. without catapult)  *
 * (but not linked or executed) using a command like:                         *
 *                                                                            *
 *   catalina -c -CC3 -CTTY srv_c_p1.c                                        *
 *                                                                            *
 * See the document 'Getting Started with Catapult' for details.              *
 *                                                                            *
 ******************************************************************************/

#include <catapult.h>
#include <service.h>
#include <stdlib.h>

/*
 * Define a type to be used for exchanging data between the client and server.
 * The 'ready' and 'start' fields are used to ensure the client does not start
 * till the server is ready.
 */
typedef struct shared_data {
   int ready;
   int start;
   int data;
} shared_data_t;

/* 
 * Forward declare the client function (so the server can start it)
 */
void hub_client(shared_data_t *s);

#pragma catapult primary binary(srv_l_p1) mode(XMM) options(-llua linit.c -C FLASH -C CACHED_1K)

/******************************************************************************
 *                                                                            *
 * The server (primary) - loads the client, then executes a Lua dispatcher,   *
 * dispatching calls to the Lua functions specified in my_service_list        *
 *                                                                            *
 ******************************************************************************/

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

/*
 * Define the Lua functions implemented by the server - then use 
 * '#pragma catapult service' to identify functions that need to have 
 * proxy functions created for clients to call.
 */

char *lua_code = 
   "   function func_1(l)" // example SHORT_SVC
   "     print('Hello World (from Lua func_1!)');"
   "     print('Args: l=' .. l);"
   "     return l + 1;"
   "   end"
   ""
   "   function func_2(l)"  // example LONG_SVC
   "     print('Hello World (from Lua func_2!)');"
   "     print('Args: l=' .. l);"
   "     return l + 2;"
   "   end"
   ""
   "   function func_3(l1, l2)"  // example LONG_2_SVC
   "     print('Hello World (from Lua func_3!)');"
   "     print('Args: l1=' .. l1 .. ', l2=' .. l2);"
   "     return l1 + l2 + 3;"
   "   end"
   ""
   "   function func_4(f1, f2)" // example FLOAT_SVC
   "     print('Hello World (from Lua func_4!)');"
   "     print('Args: f1=' .. f1 .. ', f2=' .. f2);"
   "     return f1 + f2 + 4;"
   "   end"
   ""
   "   function func_5(f1, f2)" // example LONG_FLOAT_SVC
   "     print('Hello World (from Lua func_5!)');"
   "     print('Args: f1=' .. f1 .. ', f2=' .. f2);"
   "     return f1 + f2 + 5;"
   "   end"
   ""
   "   function func_6(shared)" // example SHARED_SVC
   "     print('Hello World (from Lua func_6!)');"
   "     return data(shared);"
   "   end";

#pragma catapult service func_1 type(short)
#pragma catapult service func_2 type(long)
#pragma catapult service func_3 type(long_2)
#pragma catapult service func_4 type(float)
#pragma catapult service func_5 type(long_float)
#pragma catapult service func_6 type(shared)

/* 
 * Define a service list to use for dispatching calls to the server.
 * We can autofill the list by using #pragma catapult service_list,
 * specifying type Lua.  Note that the list must be terminated with
 * a null entry -i.e. {"", NULL, 0}
 */

svc_list_t my_service_list = {
   #pragma catapult service_list type(Lua)
   {"", NULL, 0}
};

/*
 * define a C function that can be called from Lua to access the shared data
 * - it accepts one parameter, which is the address of the shared data, and 
 * then increments and returns the value of the shared data "data" field, 
 * just as a demo (it is used in Lua func_6, defined above).
 */
static int data(lua_State *L) {
   shared_data_t *s;

   if (lua_gettop(L) == 1) {
      s = (shared_data_t *)lua_topointer(L, -1);
      lua_pop(L, 1);
      s->data++;
      lua_pushinteger(L, s->data);
      return 1;
   }
   else {
      // incorrect number of arguments
      return luaL_error(L, "expected 1 argument");
   }
}

/*
 * the main function does all the initialization
 */
void main() {

   shared_data_t shared = { 0, 0, 0 };
   int cog;
   int result;
   lua_State *L;

   // re-register this cog as a server (it will already
   // be registered, but as a kernel, not a server)
   _register_plugin(_cogid(), LMM_SVR);

   //register the services, so clients can find them
   _register_services(_locknew(), my_service_list);

   // load the client function - it will wait for the 
   // 'start' field of the shared_data argument to be set 
   RESERVE_AND_START(hub_client, shared, ANY_COG, cog);

   // create a new Lua state and open the standard Lua libraries
   L = luaL_newstate();
   luaL_openlibs(L);

   // load the Lua code and execute it so Lua knows about the
   // functions that can be called
   result = luaL_loadstring(L, lua_code) || lua_pcall(L, 0, 0 ,0);
   if (result != LUA_OK) {
      // something went wrong
      t_printf("Unexpected result (%d)\n", result);
   }

   // tell Lua about the 'data' function, so it can can be called 
   // from Lua to demonstrate Lua accessing the shared data
   lua_pushcfunction(L, data);
   lua_setglobal(L, "data");

   // wait for the client to be ready (required if the 
   // secondary print messages, to prevent garbled output)
   while (!shared.ready);

   // the server is ready - start the client
   t_printf("Server ready - press a key to begin ...\n");
   k_wait();
   shared.start = 1;

   // dispatch calls made to the services in my_service_list
   DISPATCH_LUA(L, my_service_list);
}

#pragma catapult secondary hub_client(shared_data_t) address(0x61AC) mode(CMM) stack(500)

/******************************************************************************
 *                                                                            *
 * The client (secondary) - calls services provided by the server (primary)   *
 *                                                                            *
 ******************************************************************************/

void hub_client(shared_data_t *s) {

   int i = 0;
   long l = 0;
   float f = 0.0;

   t_printf("Client ready - press a key to start the server ...\n");
   k_wait();

   // tell the server we are ready 
   s->ready = 1;

   // wait till we are told to start by the server before proceeding
   while (s->start == 0);

   t_printf("The client calls from cog %d ...\n", _cogid());
   t_printf("... to the server on cog %d\n", _locate_plugin(LMM_SVR));

   // call the services ...
   while(1) {
      t_printf("\nPress a key to continue ...\n");
      k_wait();

      i = func_1(1000);
      t_printf("result of func_1 = %d\n", i);
      i = func_2(2000);
      t_printf("result of func_2 = %d\n", i);
      i = func_3(3000, 4000);
      t_printf("result of func_3 = %d\n", i);
      f = func_4(5000.0, 6000.0);
      t_printf("result of func_4 = %f\n", f);
      l = func_5(7000.0, 8000.0);
      t_printf("result of func_5 = %ld\n", l);
      i = func_6(s);
      t_printf("result of func_6 = %d\n", i);

   }
}

