/******************************************************************************
 *                                                                            *
 *   This primary program runs "test_interrupts_1.c" as a secondary           *
 *   program several times.                                                   *
 *                                                                            *
 *   It runs it first as a CMM program, then again as an LMM program, then    *
 *   again as an NMM program.                                                 *
 *   The secondary program must be compiled by catalina, and then turned      *
 *   into a blob suitable for inclusion in this program by the spinc utility. *
 *                                                                            *
 *   This program does no memory management. The secondary programs are       *
 *   compiled to be loaded and run in an area of Hub RAM not used by this     *
 *   program. This is set to address 0x40000 (P2) in the Makefile, but it     *
 *   could be any sufficiently large area of unused Hub RAM.                  *
 *                                                                            *
 *   This primary program can be compiled as a CMM, LMM, NMM or XMM program   *
 *                                                                            *
 *   See the Makefile for more details.                                       *
 *                                                                            *
 ******************************************************************************/

#include <prop.h>
#include <cog.h>

#include "test_interrupts_1_cmm.inc"

#include "test_interrupts_1_lmm.inc"

#include "test_interrupts_1_nmm.inc"

void main(int argc, char *argv[]) {
   int arg;
   int cog;

   printf("This program dynamically loads and runs a\n");
   printf("simple program. The program is compiled to\n");
   printf("run first as CMM, then as LMM,  then as NMM");
   printf("\n\n");

   msleep(1000);

   while (1) {
      printf("Starting test_interrupts_1 as CMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_CMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping test_interrupts_1\n\n");
      _cogstop(cog);
      msleep(1000);
 
      printf("Starting test_interrupts_1 as LMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_LMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping test_interrupts_1\n\n");
      _cogstop(cog);
      msleep(1000);
 
      printf("Starting test_interrupts_1 as NMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_NMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping test_interrupts_1\n\n");
      _cogstop(cog);
      msleep(1000);

   };
}
