#include <catalina_cog.h>

/*
 * Include the dynamic kernel formatted as a C array. 
 * See dynamic_array.h for more details
 */
#include "dynamic_array.h"

#ifdef __CATALINA_P2
/*
 * Include the LUT Library formatted as a C array.
 * See library_array.h for more details
 */
#include "library_array.h"
#endif

/*
 * _coginit_C_cog : start a C function in the specified cog (non-threaded).
 *
 * On entry:
 *    func  : address of C function to run (defined as 'void func (void)')
 *    stack : address of TOP of stack to use (i.e. points just after last long)
 *    cog   : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 * NOTE: The differences between _coginit_C_cog and _cogstart_C_cog are:
 *    In _coginit_C, function 'func' accepts no parameters.
 *    In _coginit_C, 'stack' specifies the TOP of the stack, not the BASE.
 *       
 */
int _coginit_C_cog(void func(void), unsigned long *stack, unsigned int cog) {
   struct {
      unsigned long REG;
      unsigned long PC;
      unsigned long SP;
#ifdef __CATALINA_P2
      unsigned long lsize;
      unsigned long laddr;
#endif
      unsigned long arg;
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
   cog_data.arg   = 0;                  // func accepts no arguments

#if defined(__CATALINA_COMPACT)

   cog = _coginit((int)&cog_data>>2, (int)CMM_dynamic_array>>2, cog);

#elif defined (__CATALINA_NATIVE)

   cog = _coginit((int)&cog_data>>2, (int)NMM_dynamic_array>>2, cog);

#else

#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=LMM_dynamic_array[i];
   }
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, cog);
#else
   cog = _coginit((int)&cog_data>>2, (int)LMM_dynamic_array>>2, cog);
#endif

#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _waitcnt(_cnt() + (_clockfreq()/20));

   return cog;
}

