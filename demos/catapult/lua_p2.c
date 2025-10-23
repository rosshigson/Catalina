/******************************************************************************
 *                         Using Catapult with Lua.                           *
 *                                                                            *
 * This program demonstrates executing a Lua primary function from XMM RAM    *
 * while simultaneously executing a multithreaded C secondary function from   *
 * Hub RAM, and having the two interact via a shared C data structure.        *
 *                                                                            *
 * Only one Lua function can be executing, but as many additional secondary   *
 * C functions can be executing simultaneously as there are free cogs.        *
 *                                                                            *
 * Compile this program with a command like:                                  *
 *                                                                            *
 *   catapult lua_p2.c                                                        *
 *                                                                            *
 * Before loading, execute 'build_utilities' to build the appropriate XMM     *
 * loader (for a P2_EDGE with PSRAM and an 8K cache), and then load and       *
 * execute the program with a command like:                                   *
 *                                                                            *
 *   payload -o2 -i xmm lua_p2                                                *
 *                                                                            *
 * Note that if you modify the program, you will probably have to modify the  *
 * address specified in the secondary pragma - but the program will tell you  *
 * what address to use when you compile and execute it.                       *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-p2 -C P2_EDGE -C SIMPLE -C NO_ARGS -lmc)

#include <catapult.h>
#include <stdlib.h>
#include <string.h>
#include <prop.h>
#include <prop2.h>

/*
 * define a type to be used for exchanging information between
 * the Lua primary Lua function and the secondary C function ...
 */
typedef struct shared_data {
   int go;
} shared_data_t;


/******************************************************************************
 *                                                                            *
 * The secondary function - executes multithreaded C                          *
 *                                                                            *
 ******************************************************************************/
#pragma catapult secondary hub_function(shared_data_t) mode(NMM) address(0x76468) stack(8000) options(-lci -lthreads -C NO_FLOAT)

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * define how many threads we want:
 */
#define THREAD_COUNT 10

/*
 * define the stack size each thread needs (since this number 
 * depends on the function executed by the thread, the smallest 
 * possible stack size has to be established by trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 55)

static int ping;

/*
 * function : a function that can be executed as a thread
 */
int function(int me, char *not_used[]) {

   while (1) {
      if (ping == me) {
         // print our id
         t_printf("%d ", (unsigned)me);
         ping = 0;
      }
      else {
         // nothing to do, so yield
         _thread_yield();
      }
   }
   return 0;
}

/*
 * hub_function : start THREAD_COUNT threads, then ping each one in turn
 */
void hub_function(shared_data_t *s) {

   int i = 0;
   void *thread_id;
   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   // wait till we are told to go (by Lua!) before proceeding
   while (s->go == 0);

   t_printf("... C executes multiple threads using cog %d\n\n", _cogid());

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
      t_printf("thread %d ", i);
      if (thread_id == (void *)0) {
         t_printf(" failed to start\n");
         while (1) { };
      }
      else {
         t_printf(" started, id = %d\n", (unsigned)thread_id);
      }
   }

   // now loop forever, pinging each thread in turn
   while (1) {
      t_printf("\n\nPress a key to ping all threads\n");
      k_wait();
      for (i = 1; i <= THREAD_COUNT; i++) {
         t_printf("%d:", i);
         // ping the thread
         ping = i;
         // wait till thread responds
         while (ping) {
            // nothing to do, so yield
            _thread_yield();
         };
      }
   }

}


/******************************************************************************
 *                                                                            *
 * The primary function - executes Lua                                        *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary binary(lua_p2) mode(XMM) options(-lcx -W-w -C CLOCK -llua linit.c)

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

/*
 * Define the Lua code - here it is defined using a string, but it could
 * just as easily be loaded from a file. 
 *
 * The function "flash" prints a friendly message, then initiates the 
 * multi-threading by setting the "go" flag in the shared data, then 
 * flashes the specified LED just to indicate it is still executing ...
 */
char *lua_code = 
   "   LED = 38; --[[ suitable for P2 EDGE ]]"
   "   function flash(shared)"
   "     print('Hello World (from Lua!)\\n');"
   "     print('Lua will flash LED ' .. LED .. "
   "           ' using cog ' .. cogid() .. ' while ...');"
   "     go(shared, 1);"
   "     x = 0;"
   "     while (true) do"
   "       propeller.setpin(LED, x);"
   "       x = x ~ 1;"
   "       propeller.msleep(500);"
   "     end"
   "   end";

/*
 * define a C function that can be called from Lua to return the current cogid
 */
static int cogid(lua_State *L) {
   lua_pushinteger(L, _cogid());
   return 1;
}

/*
 * define a C function that can be called from Lua to access the go field
 * of the shared data - it accepts either one or two parameters - the first 
 * (required) is the address of the shared data and the second (optional) 
 * is a new value for go. It returns the old value of go ...
 */
static int go(lua_State *L) {
   int old_go = 0;
   shared_data_t *s;
   int n = lua_gettop(L); // number of arguments

   if (n == 2) {
      // optional argument specified
      register lua_Integer new_go = luaL_checkinteger(L, 2);
      s = (shared_data_t *)lua_topointer(L, -2);
      old_go = s->go;
      s->go = new_go;
      lua_pop(L, 2);
      lua_pushinteger(L, old_go);
      return 1;
   }
   else if (n == 1) {
      // optional argument not specified
      s = (shared_data_t *)lua_topointer(L, -1);
      old_go = s->go;
      lua_pop(L, 1);
      lua_pushinteger(L, old_go);
      return 1;
   }
   else {
      // incorrect number of arguments
      return 0;
   }
}

void main(int argc, char *argv[]) {

   shared_data_t shared = { 0 };
   int cog;
   int result;

   // creat a new Lua state 
   lua_State *L = luaL_newstate();

   // open the standard Lua libraries
   luaL_openlibs(L);

   // start the multi-threading program - it will wait
   // for the 'go' field of the shared_data argument to 
   // be set before starting the threads
   RESERVE_AND_START(hub_function, shared, ANY_COG, cog);

   t_printf("Press a key to start Lua ...\n\n");
   k_wait();

   // load the Lua code and execute it
   result = luaL_loadstring(L, lua_code) || lua_pcall(L, 0, 0 ,0);
   if (result == LUA_OK) {
      // set up the C 'cogid' function, so it can can be 
      // called from Lua to return the current cog id
      lua_pushcfunction(L, cogid);
      lua_setglobal(L, "cogid");
      // set up the C 'go' function, so it can can be 
      // called from Lua to start the multi-threading
      lua_pushcfunction(L, go);
      lua_setglobal(L, "go");
      // call Lua "flash" - i.e. flash(&shared)
      lua_getglobal(L, "flash");
      lua_pushlightuserdata(L, &shared);
      result = lua_pcall(L, 1, 1, 0);
   }
   if (result != LUA_OK) {
      // something went wrong
      t_printf("Unexpected result (%d)\n", result);
   }

   // not necessary here, but it is good practice to tidy up
   lua_close(L);
}

