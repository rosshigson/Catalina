/******************************************************************************
 *                                                                            *
 *   This primary program runs "hello_world.c" as a subsidiary program twice. *
 *   It runs it first as a CMM program, then again as an LMM program.         *
 *   The subsidiary program must be compiled by catalina, and then turned     *
 *   into a blob suitable for inclusion in this program by the spinc utility. *
 *                                                                            *
 *   This program does trivial memory management. An area on the stack is     *
 *   allocated for the subsidary programs to run, and the programs must be    *
 *   compiled to be loaded and run at this address. This address is set to    *
 *   0x7BAC in the Makefile, which is suitable for most platforms when        *
 *   compiling this program as LMM and using the TTY HMI option. However,     *
 *   it will not be suitable if this program is instead  compiled with other  *
 *   options, or as an XMM program. However, the program itself checks        *
 *   whether the included programs are compiled to run at the appropriate     *
 *   address and print a message if this is not the case.                     *
 *   If the message is displayed, simply edit the Makefile and replace        *
 *   0x7BAC with the correct address (which will be displayed by this         *
 *   program when run). Then rebuild the program and run it again             *
 *                                                                            *
 *   This primary program can be compiled as a CMM, LMM, XMM SMALL or XMM     *
 *   LARGE program.                                                           *
 *                                                                            *
 *   See the Makefile for more details.                                       *
 *                                                                            *
 ******************************************************************************/

#include <prop.h>
#include <cog.h>

#include "hello_world_cmm.inc"

#include "hello_world_lmm.inc"

void main(int argc, char *argv[]) {

   // Note that we assume LMM code is larger than CMM code,
   // so we reserve the size required for the LMM code here.
   // Also, note that we round up the reserved space to the
   // next 128 byte boundary (to allow for small changes in 
   // the code size).
   #define ROUND 128
   char RESERVED_SPACE[ROUND*((LMM_RUNTIME_SIZE + ROUND - 1)/ROUND)];

   int arg;
   int cog;

   printf("This program dynamically loads and runs\n");
   printf("a simple program that accepts an int as\n");
   printf("an argument. The program is compiled to\n");
   printf("run first as CMM and then as LMM.\n\n");

   // check the address of the compiled subsidiary CMM program
   if (CMM_CODE_ADDRESS != (int)&RESERVED_SPACE) {
       printf("Error: CMM code not compiled to run at\n");
       printf("address 0x%X - edit the Makefile\n",  &RESERVED_SPACE); 
       while (1);
   }

   // check the address of the compiled subsidiary LMM program
   if (LMM_CODE_ADDRESS != (int)&RESERVED_SPACE) {
       printf("Error: LMM code not compiled to run at\n");
       printf("address 0x%X - edit the Makefile\n",  &RESERVED_SPACE); 
       while (1);
   }

   // this is just a sanity check - should never happen!
   if (LMM_RUNTIME_SIZE < CMM_RUNTIME_SIZE) {
       printf("Error: CMM size is larger than LMM size\n");
       while (1);
   }

   printf("Both programs have been compiled at the\n");
   printf("correct address, which is 0x%X.\n\n", &RESERVED_SPACE);
   msleep(1000);

   printf("Starting hello_world as CMM ...\n\n");
   arg = 1;
   cog = start_CMM(&arg, ANY_COG);
   msleep(1000);
   
   printf("Stopping hello_world\n");
    _cogstop(cog);
   msleep(1000);
   
   printf("Starting hello_world as LMM ...\n\n");
   arg = 2;
   cog = start_LMM(&arg, cog);
   msleep(1000);
   
   printf("Stopping hello_world\n");
   _cogstop(cog);

   printf("Done!\n");
   while (1);

}
