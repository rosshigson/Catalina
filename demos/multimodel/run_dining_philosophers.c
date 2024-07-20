/******************************************************************************
 *                                                                            *
 *   This primary program runs "dining_philosophers.c" as a secondary         *
 *   program several times.                                                   *
 *                                                                            *
 *   It runs it first as a CMM program, then again as an LMM program. On the  *
 *   Propeller 2 it will also run it as an NMM program                        *
 *   The secondary program must be compiled by catalina, and then turned      *
 *   into a blob suitable for inclusion in this program by the spinc utility. *
 *                                                                            *
 *   This program does no memory management. The secondary programs are       *
 *   compiled to be loaded and run in an area of Hub RAM not used by this     *
 *   program. This is set to address 0x4000 (P1) or 0x40000 (P2) in the       *
 *   Makefile, but it could be any sufficiently large area of unused Hub RAM. *
 *                                                                            *
 *   This primary program can be compiled as a CMM, LMM, XMM SMALL or XMM     *
 *   LARGE program on the P1, or as a CMM, LMM or NMM program on the P2.      *
 *                                                                            *
 *   See the Makefile for more details.                                       *
 *                                                                            *
 ******************************************************************************/

#include <prop.h>
#include <cog.h>

/*
 * We can define the symbol COGSTART_THREADED here - this forces the start 
 * functions in the include files to start threaded kernels, even though 
 * this is a non-threaded program.
 */
#define COGSTART_THREADED

#include "dining_philosophers_cmm.inc"

#include "dining_philosophers_lmm.inc"

#ifdef __CATALINA_P2
#include "dining_philosophers_nmm.inc"
#endif

void main(int argc, char *argv[]) {
   int arg;
   int cog;

   printf("This program dynamically loads and runs a\n");
   printf("simple program. The program is compiled to\n");
   printf("run first as CMM then as LMM");
#ifdef __CATALINA_P2
   printf(" then as NMM");
#endif
   printf("\n\n");

   msleep(1000);

   while (1) {
      printf("Starting dining_philosophers as CMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_CMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping dining_philosophers\n\n");
      _cogstop(cog);
      msleep(1000);
 
      printf("Starting dining_philosophers as LMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_LMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping dining_philosophers\n\n");
      _cogstop(cog);
      msleep(1000);
 
#ifdef __CATALINA_P2
      printf("Starting dining_philosophers as NMM ...\n\n");
      printf("(it will be stopped in 10 seconds)\n\n");
      cog = start_NMM(NULL, ANY_COG);
      msleep(10000);
 
      printf("\nStopping dining_philosophers\n\n");
      _cogstop(cog);
      msleep(1000);
#endif

   };
}
