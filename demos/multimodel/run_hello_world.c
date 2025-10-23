/******************************************************************************
 *                                                                            *
 *   This primary program runs "hello_world.c" as a subsidiary program twice. *
 *   It runs it first as a CMM program, then again as an LMM program.         *
 *   The subsidiary program must be compiled by catalina, and then turned     *
 *   into a blob suitable for inclusion in this program by the spinc utility. *
 *                                                                            *
 *   This program does no memory management. The subsidiary programs are      *
 *   compiled to be loaded and run in an area of Hub RAM not used by this     *
 *   program. This is set to address 0x4000 in the Makefile, but it could     *
 *   be any sufficiently large area of unused Hub RAM.                        *
 *                                                                            *
 *   This primary program can be compiled as a CMM, LMM, XMM SMALL or XMM     *
 *   LARGE program.                                                           *
 *                                                                            *
 *   See the Makefile for more details.                                       *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <prop.h>
#include <cog.h>

#include "hello_world_cmm.inc"

#include "hello_world_lmm.inc"

#ifdef __CATALINA_P2
#include "hello_world_nmm.inc"
#endif

void main(int argc, char *argv[]) {
   int arg;
   int cog;

   printf("This program dynamically loads and runs\n");
   printf("a simple program that accepts an int as\n");
   printf("an argument. The program is compiled to\n");
   printf("run first as CMM then as LMM");
#ifdef __CATALINA_P2
   printf(" then as NMM");
#endif
   printf("\n\n");


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

#ifdef __CATALINA_P2
   printf("Starting hello_world as NMM ...\n\n");
   arg = 3;
   cog = start_NMM(&arg, cog);
   msleep(1000);
   
   printf("Stopping hello_world\n");
   _cogstop(cog);
#endif

   printf("Done!\n");
   while (1) { };
}
