#include <stdint.h>
#include <catalina_threads.h>
#include <catalina_cog.h>

/*
 * Include the threaded dynamic kernel formatted as a C array. 
 * For the P2, also include the LUT library.
 */
#ifdef __CATALINA_P2

unsigned long LMM_threaded_dynamic_array[] = {

#include "LMM_threaded_dynamic.inc"

};

#include "LMM_threaded_library.inc"

#define LUT_SIZE  (LMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  LMM_LUT_LIBRARY_array

#else

#include "LMM_threaded_dynamic.inc"

#endif

/*
 * _threadstart_LMM_cog : Start a LMM C program in the specified cog.
 *                        Note that the program must already be loaded  
 *                        into the correct location in Hub RAM.
 *
 * On entry:
 *    PC   : address of the main function in Hub RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    argc : argument to C function (ends up in r3)
 *    argv : argument to C function (ends up in r2)
 *    cog  : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _threadstart_LMM_cog(uint32_t PC, uint32_t SP, int argc, char *argv[], unsigned int cog) {
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
#endif

   cog_data.REG = _registry();          // registry address
   cog_data.PC  = (unsigned long)PC;    // address of blob
   cog_data.SP  = (unsigned long)SP;    // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.argc = (unsigned long)argc; // argc value
   cog_data.argv = (unsigned long)argv; // argv value
   cog_data.exit = (unsigned long)NULL; // exit processing

#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=LMM_threaded_dynamic_array[i];
   }
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, cog);
#else
   cog = _coginit((int)&cog_data>>2, (int)LMM_threaded_dynamic_array>>2, cog);
#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _thread_wait(50); // small delay for cog to initialize
   return cog;
}

