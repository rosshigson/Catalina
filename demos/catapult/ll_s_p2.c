/*
 * ll_s_p2.c : run multiple parallelized secondary programs.
 *             
 * NOTES: This file is configured for a Propeller 2 P2_EDGE board  
 *        using catapult pragmas. The primary program is an XMM program, 
 *        so must be loaded and executed using the xmm loader, built with 
 *        the 'build_utilities' script, and specifying a P2_EDGE platform
 *        and an 8k cache size.
 *
 *        The output from the two secondary programs will be garbled. This
 *        is intentional - it demonstrates that each secondary is executing
 *        its workers in parallel, and therefore all the characters printed
 *        from each worker are being intermingled.
 *
 *        The -C SIMPLE and -C NO_FLOAT options are required, or the program
 *        will not have enough cogs. Parallelized secondary functions require
 *        at least two cogs each - one for the main function, and one (or more)
 *        for the factory that executes the workers. 
 *
 *        Specifying the number of cogs each factory in a parallelized 
 *        secondary function should use is required, or the first factory 
 *        started will use all available cogs.
 *                   
 *        Parallelized secondary functions should explicitly stop their 
 *        factories before terminating - otherwise those cogs will never 
 *        be released. Explicitly starting the factories is NOT required, 
 *        but is done in this program so that when the registry is displayed,
 *        all the cogs used by the program are shown correctly.
 *
 */

#pragma catapult common options(-C P2_EDGE -C SIMPLE -p2 -lci -C NO_ARGS -C NO_FLOAT)

// any common includes or types here ...

#include "catapult.h"
#include <stdlib.h>
#include <prop.h>

typedef struct func_1 {
   int go;
} func_1_t;

typedef struct func_2 {
   int go;
} func_2_t;

#pragma catapult secondary func_1 mode(CMM) address(0x6FC4C) stack(20000) options (-Z -lthreads)

// any includes or functions required by secondary here ...

#pragma propeller factory _factory cogs(1)

#pragma propeller worker(void)

void func_1(func_1_t *s) {
    int i;

    // start the factory now so that the cog usage will be shown
    // (if display_registry is enabled in the primary program)
    #pragma propeller start

    t_printf("Hello, world from func_1 on cog %d!\n", _cogid());


    // wait till we are told to go
    while (!s->go);

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin
       t_printf("a simple test ");
       #pragma propeller end

    }

    // wait for all workers to finish
    #pragma propeller wait

    // stop the factory cogs (recommended!)
    #pragma propeller stop

    // give characters a chance to be output, so the
    // following print will not be garbled,
    msleep(500); 

    t_printf("\nGoodbye, world from func_1!\n");

}
 
#pragma catapult secondary func_2 mode(LMM) address(0x65CD0) stack(20000) options(-Z -lthreads)

// any includes or functions required by secondary here ...

#pragma propeller factory _factory cogs(1)

#pragma propeller worker(void) 

void func_2(func_2_t *s) {
    int i;

    // start the factory now so that the cog usage will be shown
    // (if display_registry is enabled in the primary program)
    #pragma propeller start

    t_printf("Hello, world from func_2 on cog %d!\n", _cogid());

    // wait till we are told to go
    while (!s->go);

    for (i = 1; i <= 10; i++) {

       #pragma propeller begin
       t_printf("A SIMPLE TEST ");
       #pragma propeller end

    }

    // wait for all workers to finish
    #pragma propeller wait

    // stop the factory cogs (recommended!)
    #pragma propeller stop

    // give characters a chance to be output, so the
    // following print will not be garbled,
    msleep(1000); 

    t_printf("Goodbye, world from func_2!\n");

}

#pragma catapult primary mode(XMM SMALL) binary(ll_s_p2) options(-C CACHED_8K)

// any includes or functions required by primary here ...

// display_registry - decode and display registry
void display_registry(int cogs) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   printf("\nRegistry:\n");
   while (i < cogs) {
      printf("   %2d: ", i);
      // display plugin type name
      printf("%-24.24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      printf("$%08x ", *(a_ptr +1));     
      printf("\n");
      i++;
   };
   printf("\n");
}

void main() {
   func_1_t args_1 = { 0 };
   func_2_t args_2 = { 0 };
   int cog;

   RESERVE_SPACE(func_1);
   RESERVE_SPACE(func_2);

   RESERVED_START(func_1, args_1, ANY_COG, cog);
   RESERVED_START(func_2, args_2, ANY_COG, cog);

   msleep(500); 

   // display the registry to see the cog usage before starting
   // display_registry(8);

   args_1.go = 1;
   args_2.go = 1;

   while(1);

}
