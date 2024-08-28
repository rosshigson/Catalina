/******************************************************************************
 *                    Using Catapult to build a C server.                     *
 *                                                                            *
 * This program demonstrates executing a primary server from XMM RAM that     *
 * dispatches service calls made from one or more C secondary clients to      *
 * C functions implemented in the primary server (i.e. from XMM RAM).         *
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
 *   catapult srv_c_p2.c                                                      *
 *                                                                            *
 * Before loading, execute 'build_utilities' to build the appropriate XMM     *
 * loader (for a P2_EDGE with PSRAM and an 8K cache), and then load and       *
 * execute the program with a command like:                                   *
 *                                                                            *
 *   payload -o2 -i xmm srv_c_p2                                              *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 ******************************************************************************/

#pragma catapult common options(-W-w -p2 -C P2_EDGE -C SIMPLE -lc -lmc)

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
#pragma catapult secondary hub_client(shared_data_t) address(0x77168) mode(NMM) stack(500)

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
 * The primary server - executes a C dispatcher, dispatching calls            *
 * to the C functions specified in my_service_list                            *
 *                                                                            *
 ******************************************************************************/
#pragma catapult primary binary(srv_c_p2) mode(XMM)

/*
 * define our services as C functions
 */

int func_1(long l) { // example SHORT_SVC
   t_printf("Hello, World (from C func_1!)\n");
   t_printf("Args: l=%ld\n", l);
   return l + 1;
}

int func_2(long l) { // example LONG_SVC
   t_printf("Hello, World (from C func_2!)\n");
   t_printf("Args: l=%ld\n", l);
   return l + 2;
}

int func_3(long l1, long l2) { // example LONG_2_SVC
   t_printf("Hello, World (from C func_3!)\n");
   t_printf("Args: l1=%ld, l2=%ld\n", l1, l2);
   return l1 + l2 + 3;
}

float func_4(float f1, float f2) { // example FLOAT_SVC
   t_printf("Hello, World (from C func_4!)\n");
   t_printf("Args: f1=%f, f2=%f\n", f1, f2);
   return f1 + f2 + 4;
}

long func_5(float f1, float f2) { // example LONG_FLOAT_SVC
   t_printf("Hello, World (from C func_5!)\n");
   t_printf("Args: f1=%f, f2=%f\n", f1, f2);
   return (long)(f1 + f2) + 5;
}

long func_6(shared_data_t *shared) { // example SHARED_SVC
   t_printf("Hello, World (from C func_6!)\n");
   shared->data++;
   return shared->data;
}

/*
 * define a list of services, parameter profiles and service identifiers
 * - note that C services require the address of the functions, the names 
 * are for information only
 */
svc_list_t my_service_list = {
   {"func_1", func_1, SHORT_SVC, MY_SVC_1},
   {"func_2", func_2, LONG_SVC, MY_SVC_2},
   {"func_3", func_3, LONG_2_SVC, MY_SVC_3},
   {"func_4", func_4, FLOAT_SVC, MY_SVC_4},
   {"func_5", func_5, LONG_FLOAT_SVC, MY_SVC_5},
   {"func_6", func_6, SHARED_SVC, MY_SVC_6},
   {"", NULL, 0, 0}
};

void main() {

   shared_data_t shared = { 0, 0, 0 };
   int cog;

   // re-register this cog as a server (it will already
   // be registered, but as a kernel, not a server)
   _register_plugin(_cogid(), LMM_SVR);

   //register the services, so clients can find them
   _register_services(_locknew(), my_service_list);

   // load the secondary client - it will wait for the 
   // 'start' field of the shared_data argument to be set 
   RESERVE_AND_START(hub_client, shared, ANY_COG, cog);

   // wait for the secondary to be ready (required if the 
   // secondary print messages, to prevent garbled output)
   while (!shared.ready);

   // start the secondary client
   t_printf("Server ready - press a key to begin ...\n");
   k_wait();
   shared.start = 1;

   // dispatch service calls
   while(1) {
      _dispatch_C(my_service_list);
   }
}
