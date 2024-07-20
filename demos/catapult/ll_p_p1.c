/*
 * ll_p_p2.c : run a parallelized primary program.
 *             
 * NOTES: This file is configured for a Propeller 2 C3 board with a serial
 *        HMI using catapult pragmas. 
 *                   
 *        The output from the parallelized primary will be garbled. This is 
 *        intentional - it demonstrates that the primary program is executing 
 *        its workers in parallel with the secondary, and therefore all the 
 *        characters printed from each worker are being intermingled with any 
 *        other prints occuring at the same time.
 *
 *        Specifying the number of cogs each factory in a parallelized 
 *        function should use is recommended, or the first factory started 
 *        will use all available cogs.
 *
 *        Explicitly starting the factories is NOT required, but is done in 
 *        this program so that when the registry is displayed, all the cogs 
 *        used by the program are shown correctly.
 *                   
 */

#pragma catapult common options(-C C3 -C TTY -lci -C NO_FLOAT -O5)

// any common includes or types here ...

#include "catapult.h"
#include <stdlib.h>
#include <prop.h>

typedef struct func_1 {
   int go;
} func_1_t;

#pragma catapult secondary func_1 mode(CMM) address(0x71AC) stack(1000)

// any includes or functions required by secondary here ...

void func_1(func_1_t *s) {
    int i;

    t_printf("Hello, world from func_1 on cog %d\n", _cogid());

    // wait for signal to go
    while (!s->go);

    for (i = 1; i <= 10; i++) {

       t_printf("hello! ");
       msleep(20); 

    }

    t_printf("\nGoodbye, world, from func_1!\n");
    msleep(1000); 

}
 
#pragma catapult primary mode(CMM) binary(ll_p_p1) options(-Z -lthreads)

// any includes or functions required by primary here ...

#include <stdio.h>

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

#pragma propeller factory _factory cogs(2)

#pragma propeller worker(void)

void main() {
   func_1_t args_1 = { 0 };
   int cog;
   int i;

   RESERVE_SPACE(func_1);

   RESERVED_START(func_1, args_1, ANY_COG, cog);

   // start the factory now so that the cog usage will be shown
   // (if display_registry is enabled in the primary program)
   #pragma propeller start

   msleep(100);

   // display the registry to see the cog usage before starting
   // display_registry(8);

   msleep(100);
   args_1.go = 1;

   //msleep(500);
   t_printf("Hello, world from primary on cog %d\n", _cogid());

   for (i = 1; i <= 5; i++) {

      #pragma propeller begin
      t_printf("A SIMPLE TEST ");
      #pragma propeller end

   }

   // wait for all workers to finish
   #pragma propeller wait

   // give characters a chance to be output, so the
   // following print will not be garbled,
   msleep(500); 

   t_printf("\nGoodbye world, from primary!\n");

   while(1);

}
