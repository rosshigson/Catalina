/******************************************************************************
 *                                                                            *
 *   This primary program runs two subsidiary programs - sub1 and sub2.       *
 *   One of these is compiled as a CMM program, and one as an LMM program.    *
 *   The subsidiary programs must be compiled by catalina, and then turned    *
 *   into blobs suitable for inclusion in this program, by the spinc utility. *
 *                                                                            *
 *   Each subsidiary program uses a structure to exchange information with    *
 *   the primary program. These structures are different for each program     *
 *   and are defined in header files for inclusion by both the primary and    *
 *   the subsidiary programs. Note that the shared variables themselves       *
 *   should be created as local variables in the main function - this         *
 *   assures they will always be in Hub RAM even if the primary program       *
 *   is compled as XMM LARGE, where global variables are in XMM RAM (and      *
 *   hence would be inaccessible to CMM and LMM programs).                    *
 *                                                                            *
 *   This program does trivial memory management. A local array created in    *
 *   the main function is used as space for each subsidary program to run,    *
 *   and the subsidiary  programs must be compiled to be loaded and run at    *
 *   the correct addresses. The program itself checks whether the included    *
 *   subsidiary program "blobs" have been compiled to run at the appropriate  *
 *   addresses, and print a message if this is not the case. If the message   *
 *   is displayed, simply edit the Makefile and replace 0x7BAC with the       *
 *   correct address (which will be displayed by this program when run).      *
 *   Then rebuild the program and run it again. You may need to do this for   *
 *   each subsidiary program.                                                 *
 *                                                                            *
 *   This primary program can be compiled as a CMM, LMM, XMM SMALL or XMM     *
 *   LARGE program.                                                           *
 *                                                                            *
 *   See the Makefile for more details.                                       *
 *                                                                            *
 ******************************************************************************/

#include <prop.h>
#include <cog.h>
#include <hmi.h>
#include <plugin.h>

#include "shared_1.h"
#include "shared_2.h"

#include "subsidiary_1.inc"
#include "subsidiary_2.inc"

void main(int argc, char *argv[]) {

   // Allocate Hub RAM areas for the subsidiary programs to run. By
   // allocating them here, we guarantee they will always be in Hub RAM.
   // Also, note that we round up the reserved space to the
   // next 128 byte boundary (to allow for small changes in 
   // the code size).
   #define ROUND 128
   char SUB1_RESERVED_SPACE[ROUND*((SUB1_RUNTIME_SIZE + ROUND - 1)/ROUND)];
   char SUB2_RESERVED_SPACE[ROUND*((SUB2_RUNTIME_SIZE + ROUND - 1)/ROUND)];

   // allocate shared variables to use with each subsidiary program. By 
   // allocating them here, we guarantee they will always be in Hub RAM.
   shared_1_t shared_1 = {0, 0};
   shared_2_t shared_2 = {0.0, 0.0};

   int i;
   int cog;

   t_printf("Primary program started.\n");

   // check the address of the compiled subsidiary CMM program
   if (SUB1_CODE_ADDRESS != (int)&SUB1_RESERVED_SPACE) {
       t_printf("Error: Subsidiary 1 not compiled to run\n");
       t_printf("at addr 0x%X - edit the Makefile\n",  
              &SUB1_RESERVED_SPACE); 
       while (1);
   }

   // check the address of the compiled subsidiary LMM program
   if (SUB2_CODE_ADDRESS != (int)&SUB2_RESERVED_SPACE) {
       t_printf("Error: Subsidiary 2 not compiled to run\n");
       t_printf("at addr 0x%X - edit the Makefile\n",  
              &SUB2_RESERVED_SPACE); 
       while (1);
   }

   t_printf("Both programs have been compiled at the\n");
   t_printf("correct addresses, which are:\n");
   t_printf("   Subsidiary 1: 0x%X\n", &SUB1_RESERVED_SPACE);
   t_printf("   Subsidiary 2: 0x%X\n\n", &SUB2_RESERVED_SPACE);

   msleep(500);

   t_printf("Starting Subsidiary 1\n");
   msleep(250);
   cog = start_SUB1(&shared_1, ANY_COG);
   msleep(250);
   
   t_printf("Starting Subsidiary 2\n");
   msleep(250);
   cog = start_SUB2(&shared_2, ANY_COG);
   msleep(250);

   t_printf("\n\n");
   
   // Now request each subsidiary, using the appropriate shared variable.

   // Note that the request/response protocol is simple - the subsidiary 
   // waits till the input variable is non-zero, then puts the response 
   // in the output variable. Then it waits for the output variable to be 
   // zero (by way of acknowledgment) and then waits for another request.

   for (i = 1; i < 100; i++) {

     // request subsidiary 1 to do some work ...
     t_printf("Subsidiary 1 input is  %d\n", i);
     shared_1.input = i;
     // wait for the response ...
     while (shared_1.output == 0);
     t_printf("Subsidiary 1 output is %d\n\n", shared_1.output);
     // acknowledge the response ...
     shared_1.input = 0;
     shared_1.output = 0;
     msleep(500);

     // request subsidiary 2 to do some work ...
     t_printf("Subsidiary 2 input is  %f\n", (float)i);
     shared_2.input = (float)i;
     // wait for the response ...
     while (shared_2.output == 0.0);
     t_printf("Subsidiary 2 output is %f\n\n", shared_2.output);
     // acknowledge the response ...
     shared_2.input = 0.0;
     shared_2.output = 0.0;
     msleep(500);

   }

   t_printf("Done!\n");
   while (1);

}
