#include <stdint.h>
#include <stdlib.h>
#include <plugin.h>
#include <cog.h>

#ifndef __CATALINA_P2
#error _cogsstart_XMM_cog not currently supported on the Propeller 1
#endif

/*
 * Include the dynamic kernel formatted as a C array. 
 * For the P2, also include the LUT library.
 */
#ifdef __CATALINA_P2

unsigned long xmmsd_array[] = {

#include "xmmsd.inc"

};

#include "xmml.inc"

#define LUT_SIZE  (XMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  XMM_LUT_LIBRARY_array

#else

#include "xmmsd.inc"

#endif

/*
 * _cogstart_XMM_SMALL_cog : Start a SMALL XMM C program in the specified cog.
 *                           Note that the program must already be loaded  
 *                           into the correct location in XMM RAM.
 *
 *                     IMPORTANT NOTES:
 *
 *                     1. Currently, both the CACHE and either the
 *                        FLOAT_A or FLOAT_C plugins must already 
 *                        be running before an XMM C program is
 *                        started.
 *                     2. Currently, only the Propeller 2 is supported.
 *                     3. Currently, only XMM LARGE is supported.
 *                     4. Currently, only one XMM C program can be
 *                        executing, and it assumes it will be the only 
 *                        such kernel executing.
 *
 * On entry:
 *    PC   : address of the main function in XMM RAM
 *    CS   : address of the code segment in XMM RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    arg  : argument to C main function (ends up in r2)
 *    cog  : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _cogstart_XMM_SMALL_cog(uint32_t PC, uint32_t CS, uint32_t SP, 
                            void *arg, unsigned int cog) {
  return _cogstart_XMM_SMALL_cog_2(PC, CS, SP, NULL, arg, cog);
}

/*
 * _cogstart_XMM_SMALL_cog_2 : same as above but accepts two arguments
 *    arg1 : argument to C main function (ends up in r3)
 *    arg2 : argument to C main function (ends up in r2)
 */
int _cogstart_XMM_SMALL_cog_2(uint32_t PC, uint32_t CS, uint32_t SP, 
                              void *arg1, void *arg2, unsigned int cog) {
   struct {
      unsigned long REG;
      unsigned long PC;
      unsigned long SP;
#ifdef __CATALINA_P2
      unsigned long lsize;
      unsigned long laddr;
#endif
      unsigned long arg1;
      unsigned long arg2;
      unsigned long CS;
   } cog_data;
 
#ifdef __CATALINA_LARGE
   int i;
   long kernel[512]; // must copy kernel to Hub RAM for loading
#endif

   cog_data.REG = _registry();          // registry address
   cog_data.PC  = (unsigned long)PC;    // address of main function
   cog_data.SP  = (unsigned long)SP;    // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.arg1  = (unsigned long)arg1; // argument (ends up in r3)
   cog_data.arg2  = (unsigned long)arg2; // argument (ends up in r2)
   cog_data.CS  = (unsigned long)CS;    // code segment
#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=xmmsd_array[i];
   }
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, cog);
#else
   cog = _coginit((int)&cog_data>>2, (int)xmmsd_array>>2, cog);
#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _waitcnt(_cnt() + (_clockfreq()/20));

   return cog;
}

