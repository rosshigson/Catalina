#pragma catapult common options(-W-w -p2 -C P2_EDGE -C SIMPLE -C NO_ARGS -lc -lmc)

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
 *   payload -o2 -i XMM srv_c_p2                                              *
 *                                                                            *
 * Note that if you modify the program, you may have to modify the address    *
 * specified in the secondary pragma - but the program will tell you what     *
 * address to use when you compile and execute it.                            *
 *                                                                            *
 * This program can also be compiled 'monolitically' (i.e. without catapult)  *
 * and then executed using commands like:                                     *
 *                                                                            *
 *   catalina -p2 -CP2_EDGE -lc -lm srv_c_p2.c                                *
 *   payload -o2 -i srv_c_p2                                                  *
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

#pragma catapult primary binary(srv_c_p2) mode(XMM)

/******************************************************************************
 *                                                                            *
 * The server (primary) - loads the client, then executes a C dispatcher,     *
 * dispatching calls to the C functions specified in my_service_list          *
 *                                                                            *
 ******************************************************************************/

/*
 * Define the C functions implemented by the server - note the use of 
 * '#pragma catapult service' to identify functions that need to have 
 * proxy functions created for clients to call.
 */

#pragma catapult service func_1 type(short)
int func_1(long l) { // example SHORT_SVC
   t_printf("Hello, World (from C func_1!)\n");
   t_printf("Args: l=%ld\n", l);
   return l + 1;
}

#pragma catapult service func_2 type(long)
int func_2(long l) { // example LONG_SVC
   t_printf("Hello, World (from C func_2!)\n");
   t_printf("Args: l=%ld\n", l);
   return l + 2;
}

#pragma catapult service func_3 type(long_2)
int func_3(long l1, long l2) { // example LONG_2_SVC
   t_printf("Hello, World (from C func_3!)\n");
   t_printf("Args: l1=%ld, l2=%ld\n", l1, l2);
   return l1 + l2 + 3;
}

#pragma catapult service func_4 type(float)
float func_4(float f1, float f2) { // example FLOAT_SVC
   t_printf("Hello, World (from C func_4!)\n");
   t_printf("Args: f1=%f, f2=%f\n", f1, f2);
   return f1 + f2 + 4;
}

#pragma catapult service func_5 type(long_float)
long func_5(float f1, float f2) { // example LONG_FLOAT_SVC
   t_printf("Hello, World (from C func_5!)\n");
   t_printf("Args: f1=%f, f2=%f\n", f1, f2);
   return (long)(f1 + f2) + 5;
}

#pragma catapult service func_6 type(shared)
long func_6(shared_data_t *shared) { // example SHARED_SVC
   t_printf("Hello, World (from C func_6!)\n");
   shared->data++;
   return shared->data;
}

/* 
 * Define a service list to use for dispatching calls to the server. 
 * We can autofill the list by using #pragma catapult service_list,
 * specifying type C.  Note that the list must be terminated with
 * a null entry -i.e. {"", NULL, 0}
 */
svc_list_t my_service_list = {
   #pragma catapult service_list type(C)
   {"", NULL, 0}
};

/*
 * the main function does all the initialization
 */
void main() {

   shared_data_t shared = { 0, 0, 0 };
   int cog;

   // re-register this cog as a server (it will already
   // be registered, but as a kernel, not a server)
   _register_plugin(_cogid(), LMM_SVR);

   // register the services, so clients can find them
   _register_services(_locknew(), my_service_list);

   // load the client function - it will wait for the 
   // 'start' field of the shared_data argument to be set 
   RESERVE_AND_START(hub_client, shared, ANY_COG, cog);

#ifdef __CATAPULTED
   // wait for the client to be ready (required if the client 
   // prints messages, to prevent garbled output, and only if we 
   // have been processed by Catapult, otherwise this blocks!)
   while (!shared.ready);
#endif

   // the server is ready - start the client
   t_printf("Server ready - press a key to begin ...\n");
   k_wait();
   shared.start = 1;

   // dispatch calls made to the services in my_service_list
   DISPATCH_C(my_service_list);
}

#pragma catapult secondary hub_client(shared_data_t) address(0x77178) mode(NMM) stack(500)

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

#ifdef __CATAPULTED
   // wait till we are told to start by the server before proceeding
   // (only if we have been processed by Catapult, otherwise this blocks!)
   while (s->start == 0);
#endif

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

