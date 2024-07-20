#include <stdint.h>
#include <threads.h>
#include <cog.h>

/*
 * Include the threaded dynamic kernel formatted as a C array. 
 * See tkarray.h for more details
 */
#include "tkarray.h"

#ifdef __CATALINA_P2
/*
 * Include the LUT Library formatted as a C array.
 * See tlarray.h for more details
 */
#include "tlarray.h"
#endif

/*
 * _threadstart_C_cog : start a C function as a thread in the specified cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'int f(int, char **)')
 *    argc  : argument to C function (ends up in r3)
 *    argv  : argument to C function (ends up in r2)
 *    stack : address of start of stack 
 *    size  : size of stack (in bytes)
 *    cog   : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _threadstart_C_cog(_thread func, int argc, char *argv[], void *stack, uint32_t size, unsigned int cog) {
   struct {
      unsigned long REG;
      unsigned long PC;
      unsigned long SP;
#ifdef __CATALINA_P2
      unsigned long lsize;
      unsigned long laddr;
#endif
      unsigned long argc;
      unsigned long argv;
      unsigned long exit;
   } cog_data;
 
#ifdef __CATALINA_LARGE
   int i;
   long kernel[512]; // must copy kernel to Hub RAM for loading
   long lut[512]; // must copy LUT Library to Hub RAM for loading
#endif

   cog_data.REG = _registry();          // registry address
   cog_data.PC  = (unsigned long)func;  // address of C function
   cog_data.SP  = (unsigned long)stack + size; // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.argc = (unsigned long)argc; // argc value
   cog_data.argv = (unsigned long)argv; // argv value
   cog_data.exit = (unsigned long)NULL; // exit processing

#if defined(__CATALINA_COMPACT)

#ifndef __CATALINA_P2
   // inject context switch function into threaded kernel image
   _inject_context_switch(cmmtd_array);
#endif
   cog = _coginit((int)&cog_data>>2, (int)cmmtd_array>>2, cog);

#elif defined (__CATALINA_NATIVE)

   cog = _coginit((int)&cog_data>>2, (int)nmmtd_array>>2, cog);

#else

#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=lmmtd_array[i];
   }
#ifdef __CATALINA_P2
   for (i = 0; i < LUT_SIZE; i++) {
      lut[i]=LUT_ADDR[i];
   }
   cog_data.laddr = (unsigned long)lut; // lut library address
#endif
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, cog);
#else
   cog = _coginit((int)&cog_data>>2, (int)lmmtd_array>>2, cog);
#endif

#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _thread_wait(50); // small delay for cog to initialize

   return cog;
}

