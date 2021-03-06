#include <catalina_threads.h>
#include <catalina_cog.h>

/*
 * Include the dynamic kernel formatted as a C array. 
 * See threaded_kernel_array.h for more details
 */
#include "threaded_kernel_array.h"

#ifdef __CATALINA_P2
/*
 * Include the LUT Library formatted as a C array.
 * See threaded_library_array.h for more details
 */
#include "threaded_library_array.h"
#endif


/*
 * _thread_cog : start a C function as a thread in a new multi-threaded cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'int f(int, char **)')
 *    stack : address of TOP of stack to use (i.e. points just after last long)
 * On exit:
 *    cog   : cog used, or -1 on any error
 */
int _thread_cog(_thread func, unsigned long *stack, int argc, char *argv[]) {
   int cog;
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
   cog_data.PC  = (unsigned long)func;  // address of C function
   cog_data.SP  = (unsigned long)stack; // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.argc = (unsigned long)argc; // argc value
   cog_data.argv = (unsigned long)argv; // argv value
   cog_data.exit = (unsigned long)NULL; // exit processing

#if defined(__CATALINA_COMPACT)   

#ifndef P2
   // inject context switch function into threaded kernel image
   _inject_context_switch(CMM_threaded_dynamic_array);
#endif
   cog = _coginit((int)&cog_data>>2, (int)CMM_threaded_dynamic_array>>2, ANY_COG);

#elif defined (__CATALINA_NATIVE)

   cog = _coginit((int)&cog_data>>2, (int)NMM_threaded_dynamic_array>>2, ANY_COG);

#else

#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=LMM_threaded_dynamic_array[i];
   }
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, ANY_COG);
#else
   cog = _coginit((int)&cog_data>>2, (int)LMM_threaded_dynamic_array>>2, ANY_COG);
#endif

#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _thread_wait(50); // small delay for cog to initialize

   return cog;
}

