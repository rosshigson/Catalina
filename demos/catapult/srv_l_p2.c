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
 * This version is for a Propeller 2 P2_EDGE with PSRAM (i.e. a P2-EC32MB).   *
 *                                                                            *
 * Compile this program with a command like:                                  *
 *                                                                            *
 *   catapult srv_l_p2.c                                                      *
 *                                                                            *
 * Before loading, execute 'build_utilities' to build the appropriate XMM     *
 * loader (for a P2_EDGE with PSRAM and an 8K cache), and then load and       *
 * execute the program with a command like:                                   *
 *                                                                            *
 *   payload -o2 -i xmm srv_l_p2                                              *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-W-w -p2 -C P2_EDGE -C SIMPLE -C NO_ARGS -lc -lmc)

#include <catapult.h>
#include <service.h>
#include <stdlib.h>

/*
 * define global service identifiers for our services 
 * (can be any unused service ids, but must be unique)
 */
#define MY_SVC_1 (SVC_RESERVED+1)
#define MY_SVC_2 (SVC_RESERVED+2)
#define MY_SVC_3 (SVC_RESERVED+3)
#define MY_SVC_4 (SVC_RESERVED+4)
#define MY_SVC_5 (SVC_RESERVED+5)
#define MY_SVC_6 (SVC_RESERVED+6)

/*
 * define a type to be used for exchanging data between
 * the primary and secondary functions
 */
typedef struct shared_data {
   int ready;
   int start;
   int data;
} shared_data_t;

/******************************************************************************
 *                                                                            *
 * The secondary client - calls services provided by the primary server       *
 *                                                                            *
 ******************************************************************************/
#pragma catapult secondary hub_client(shared_data_t) address(0x77164) mode(NMM) stack(500)

/*
 * define proxy functions, which use Catalina's pre-defined 
 * service functions to call the real server functions via
 * the Registry
 */

int func_1(long l) {
   return _short_service(MY_SVC_1, l);
}

int func_2(long l) {
   return _long_service(MY_SVC_2, l);
}

int func_3(long l1, long l2) {
   return _long_service_2(MY_SVC_3, l1, l2);
}

float func_4(float f1, float f2) {
   return _float_service(MY_SVC_4, f1, f2);
}

long func_5(float f1, float f2) {
   return _long_float_service(MY_SVC_5, f1, f2);
}

int func_6(shared_data_t *shared) {
    return _short_service(MY_SVC_6, (long)shared);
}

/*
 * hub_client : call the services offered by the primary function
 *              by calling the proxy functions defined above
 */
void hub_client(shared_data_t *s) {

   int i = 0;
   long l = 0;
   float f = 0.0;

   t_printf("Client ready - press a key to start the server ...\n");
   k_wait();

   // tell the primary server we are ready 
   s->ready = 1;

   // wait till we are told to start by the primary before proceeding
   while (s->start == 0);

   t_printf("The secondary client calls from cog %d ...\n", _cogid());
   t_printf("... to the primary server on cog %d\n", _locate_plugin(LMM_SVR));

   // call the services using the proxy functions
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

/******************************************************************************
 *                                                                            *
 * The primary server - executes a Lua dispatcher, dispatching calls          *
 * to the Lua functions specified in my_service_list                          *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary binary(srv_l_p2) mode(XMM) options(-llua linit.c)

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

/*
 * define our services as Lua functions
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

/*
 * define a list of services, parameter profiles and service identifiers
 * - note that Lua services require only the names of the functions, and
 * their addresses should be NULL
 */
svc_list_t my_service_list = {
   {"func_1", NULL, SHORT_SVC, MY_SVC_1, 0},
   {"func_2", NULL, LONG_SVC, MY_SVC_2, 0},
   {"func_3", NULL, LONG_2_SVC, MY_SVC_3, 0},
   {"func_4", NULL, FLOAT_SVC, MY_SVC_4, 0},
   {"func_5", NULL, LONG_FLOAT_SVC, MY_SVC_5, 0},
   {"func_6", NULL, SHARED_SVC, MY_SVC_6, 0},
   {"", NULL, 0, 0, 0}
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

   // load the secondary client - it will wait for the 
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

   // wait for the secondary to be ready (required if the 
   // secondary print messages, to prevent garbled output)
   while (!shared.ready);

   // start the secondary client
   t_printf("Server ready - press a key to begin ...\n");
   k_wait();
   shared.start = 1;

   // dispatch service calls
   while(1) {
      _dispatch_Lua(L, my_service_list);
   }
}
