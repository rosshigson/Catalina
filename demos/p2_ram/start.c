/*
 * Simple Hyper RAM / PSRAM start program. 
 *
 * Supported only on the Propeller 2.
 *
 * The program to be started must be an XMM LARGE program, and must already 
 * be loaded into Hyper RAM or PSRAM (e.g. by the load.c program) - all this
 * program does is start the required plugins and then start an XMM kernel. 
 *
 * Note that this program cannot be used to load XMM SMALL programs. The 
 * process for loading XMM SMALL programs is more complex than loading XMM 
 * LARGE programs and is beyond the scope of this simple program because XMM 
 * SMALL programs must also have their data segments loaded from XMM RAM into 
 * Hub RAM, which would overwrite this program.
 *
 * Note that this program cannot itself be an XMM program, and that starting
 * the XMM kernel terminates this one (unless STAY_ALIVE is specified - see
 * below). This program needs to be compiled with at least the HYPER or PSRAM,
 * CACHE and a FLOATING POINT plugin, because these will all be needed by the
 * XMM program to be started. It should also start any other plugins that 
 * program will need, such as CLOCK, SD and HMI plugins.
 *
 * Optionally add -C DISPLAY_REGISTRY to display the registry (once).
 * Optionally add -C DISPLAY_PROLOGUE to display the prologue (once).
 * Optionally add -C DISPLAY_DEBUG    to display debug registers (every 500ms).
 * Optionally add -C STAY_ALIVE       to keep program running (e.g. to debug).
 *
 * 
 * Define the symbol HYPER or PSRAM, as well as linking with the hyper or
 * psram library when compiling. For example:
 *
 *   catalina -p2 -lhyper -lcx -lmc start.c -C HYPER -C CACHED -C P2_EVAL
 * 
 * or
 *
 *   catalina -p2 -lpsram -lcx -lmc start.c -C PSRAM -C CACHED -C P2_EDGE
 *
 * The steps involved are:
 *
 * 1. Read the FREE_MEM pointer (will be new program's SP), UNLESS we
 *    have been asked to display the debug registers periodically, which
 *    means we have to stay running, so we give the program only a small
 *    stack to use from our own memory space.
 * 2. Read the prologue from Hyper RAM or PSRAM.
 * 2. Write the prologue to Hub RAM.
 * 3. Start the new kernel to replace this one, UNLESS we have been asked 
 *    to display the debug registers periodically, in which case we start
 *    another kernel to run in parallel with this one.
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#ifdef __CATALINA_LARGE
#error THIS PROGRAM CANNOT BE COMPILED IN LARGE MODE
#endif

#ifdef __CATALINA_SMALL
#error THIS PROGRAM CANNOT BE COMPILED IN SMALL MODE
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <plugin.h>
#include <cog.h>
#if defined(__CATALINA_HYPER)||defined(__CATALINA_libhyper)
#include <hyper.h>
#define ram_read hyper_read
#define ram_write hyper_write
#elif defined(__CATALINA_PSRAM)||defined(__CATALINA_libpsram)
#include <psram.h>
#define ram_read psram_read
#define ram_write psram_write
#else
#error THIS PROGRAM MUST BE COMPILED WITH PSRAM OR HYPER DEFINED (e.g. -C HYPER)
#endif

#define FREE_MEM        0x7BFFC    // address of FREE_MEM pointer in Hub RAM
#define PROLOGUE_SIZE   0x00200    // size of prologue (one sector)
#define PROLOGUE_OFFS   0x00000    // offset of prologue in XMM RAM
#define LAYOUT_OFFS        0x10    // offset of layout in prologue
#define PROLOGUE_ORGH   0x01000    // Hub RAM (orgh) of prologue

#define STACK_SIZE 10000

#define __CATALINA_DISPLAY_PROLOGUE    // display prologue
//#define __CATALINA_DISPLAY_REGISTRY    // display registry before load
//#define __CATALINA_DISPLAY_DEBUG       // dump debug registers periodically

#ifdef __CATALINA_DISPLAY_DEBUG
#ifndef __CATALINA_STAY_ALIVE
#define __CATALINA_STAY_ALIVE          // need this to display debug info
#endif
#endif

#ifdef __CATALINA_DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < COG_MAX) {
      printf("Registry Entry %2d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
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
#endif

// zero the buffer 
void zero_buffer(unsigned char *buff, int size) {
   int i;
   for (i = 0; i < size; i++) {
      buff[i] = 0;
   }
}

unsigned long load_long(unsigned char *buff, int offs) {
   return (buff[offs+3]<<24) 
        + (buff[offs+2]<<16) 
        + (buff[offs+1]<<8) 
        + (buff[offs]);
}

int _cogstart_XMM_LARGE_cog_2(uint32_t PC, uint32_t CS, uint32_t SP, 
                              void *arg1, void *arg2, unsigned int cog);

int main(int argc, char *argv[]) {
   unsigned char prologue[PROLOGUE_SIZE];
   int result;
   int i;
   int cog;

   unsigned long stack[STACK_SIZE];

#ifdef __CATALINA_DISPLAY_DEBUG
   unsigned long *dump = (unsigned long *)0x7BDE8; // 5 debug longs here
#endif

   // data read from prologue:
   unsigned long seglayout = 0;
   unsigned long Catalina_Code = 0;
   unsigned long Catalina_Cnst = 0;
   unsigned long Catalina_Init = 0;
   unsigned long Catalina_Data = 0;
   unsigned long Catalina_Ends = 0;
   unsigned long Catalina_RO_Base = 0;
   unsigned long Catalina_RW_Base = 0;
   unsigned long Catalina_RO_Ends = 0;
   unsigned long Catalina_RW_Ends = 0;
   unsigned long init_PC = 0;
   unsigned long init_SP = 0;

#ifdef __CATALINA_DISPLAY_REGISTRY
   display_registry();
#endif

   zero_buffer(prologue, PROLOGUE_SIZE);
   if ((result = ram_read(prologue, (char *)PROLOGUE_OFFS, PROLOGUE_SIZE)) < 0) {
      printf("prologue read error: %d\n", result);
      exit(1);
   }
   else {
#ifdef __CATALINA_DISPLAY_PROLOGUE
      printf("prologue read ok\n");
#endif
   }

   seglayout        = load_long(prologue, LAYOUT_OFFS+0);
   Catalina_Code    = load_long(prologue, LAYOUT_OFFS+4);
   Catalina_Cnst    = load_long(prologue, LAYOUT_OFFS+8);;
   Catalina_Init    = load_long(prologue, LAYOUT_OFFS+12);
   Catalina_Data    = load_long(prologue, LAYOUT_OFFS+16);
   Catalina_Ends    = load_long(prologue, LAYOUT_OFFS+20);
   Catalina_RO_Base = load_long(prologue, LAYOUT_OFFS+24);
   Catalina_RW_Base = load_long(prologue, LAYOUT_OFFS+28);
   Catalina_RO_Ends = load_long(prologue, LAYOUT_OFFS+32);
   Catalina_RW_Ends = load_long(prologue, LAYOUT_OFFS+36);
   init_PC          = load_long(prologue, LAYOUT_OFFS+40);

#ifdef __CATALINA_STAY_ALIVE
   init_SP = (unsigned long) &stack[STACK_SIZE];
#else
   init_SP = *((unsigned long *)FREE_MEM);
#endif

#ifdef __CATALINA_DISPLAY_PROLOGUE
   printf("\nPrologue:\n");
   printf("Layout           = %08X\n", seglayout);
   printf("Catalina_Code    = %08X\n", Catalina_Code);
   printf("Catalina_Cnst    = %08X\n", Catalina_Cnst);
   printf("Catalina_Init    = %08X\n", Catalina_Init);
   printf("Catalina_Data    = %08X\n", Catalina_Data);
   printf("Catalina_Ends    = %08X\n", Catalina_Ends);
   printf("Catalina_RO_Base = %08X\n", Catalina_RO_Base);
   printf("Catalina_RW_Base = %08X\n", Catalina_RW_Base);
   printf("Catalina_RO_Ends = %08X\n", Catalina_RO_Ends);
   printf("Catalina_RW_Ends = %08X\n", Catalina_RW_Ends);
   printf("init_PC          = %08X\n", init_PC);
   printf("init_SP          = %08X\n", init_SP);
#endif

   memcpy((char *)PROLOGUE_ORGH, prologue, PROLOGUE_SIZE);

#ifdef __CATALINA_DISPLAY_DEBUG
   *dump     = 0xDEADBEEF;
   *(dump+1) = 0x00000000;
   *(dump+2) = 0x00000000;
   *(dump+3) = 0x00000000;
   *(dump+4) = 0x00000000;
#endif

#ifdef __CATALINA_STAY_ALIVE
   // leave this cog running to dump debug registers, 
   // passing it our command line arguments
   cog = _cogstart_XMM_LARGE_2(init_PC, Catalina_Code, init_SP, 
                               (void *)argc, (void *)argv);
   printf("Kernel started on cog %d\n", cog);
   while(1) {
#ifdef __CATALINA_DISPLAY_DEBUG
     // dump debug registers every 500ms
     _waitms(500);
     printf("%08lX %08lX %08lX %08lX %08lX\n", 
            *dump, *(dump+1), *(dump+2), *(dump+3), *(dump+4));
#endif
   }
#else
   // replace this cog with XMM kernel, 
   // passing it our command-line arguments
   cog = _cogstart_XMM_LARGE_cog_2(init_PC, Catalina_Code, init_SP, 
                                   (void *)argc, (void *)argv, _cogid());
#endif

   // should never get here
   return 0;
}
