#include <stdint.h>
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
 * _cogstart_C_cog : start a C function in the specified cog (non-threaded).
 *
 * On entry:
 *    func  : address of C function to run (defined as 'void func (void *)')
 *    arg   : argument to C function (ends up in r2)
 *    stack : address of start of stack 
 *    size  : size of stack (in bytes)
 *    cog   : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 * NOTE: The differences between _coginit_C_cog and _cogstart_C_cog are:
 *    In _cogstart_C_cog, function 'func' accepts a parameter (i.e. 'arg').
 *    In _cogstart_C_cog, 'stack' specifies the BASE of the stack, not the TOP.
 *       
 */
int _cogstart_C_cog(void func(void *), void *arg, void *stack, uint32_t size, unsigned int cog) {
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
   cog_data.SP  = (unsigned long)stack + size ; // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.arg   = (unsigned long)arg;         // argument (ends up in r2)

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

