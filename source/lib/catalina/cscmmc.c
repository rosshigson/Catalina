#include <stdint.h>
#include <cog.h>

/*
 * Include the dynamic kernel formatted as a C array. 
 * For the P2, also include the LUT library.
 */
#ifdef __CATALINA_P2

unsigned long cmmd_array[] = {

#include "cmmd.inc"

};

#include "cmml.inc"

#define LUT_SIZE  (CMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  CMM_LUT_LIBRARY_array

#else

#include "cmmd.inc"

#endif

/*
 * _cogstart_CMM_cog : Start a CMM C program in the specified cog.
 *                     Note that the program must already be loaded  
 *                     into the correct location in Hub RAM.
 *
 * On entry:
 *    PC   : address of the main function in Hub RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    arg  : argument to C main function (ends up in r2)
 *    cog  : cog to start, or ANY_COG
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _cogstart_CMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog) {
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
   long lut[512]; // must copy LUT Library to Hub RAM for loading
#endif

   cog_data.REG = _registry();          // registry address
   cog_data.PC  = (unsigned long)PC;    // address of blob
   cog_data.SP  = (unsigned long)SP;    // top of stack
#ifdef __CATALINA_P2
   cog_data.lsize = (unsigned long)LUT_SIZE; // lut library size
   cog_data.laddr = (unsigned long)LUT_ADDR; // lut library address
#endif
   cog_data.arg   = (unsigned long)arg; // argument (ends up in r2)

#ifdef __CATALINA_LARGE
   for (i = 0; i < 512; i++) {
      kernel[i]=cmmd_array[i];
   }
#ifdef __CATALINA_P2
   for (i = 0; i < LUT_SIZE; i++) {
      lut[i]=LUT_ADDR[i];
   }
   cog_data.laddr = (unsigned long)lut; // lut library address
#endif
   cog = _coginit((int)&cog_data>>2, (int)kernel>>2, cog);
#else
   cog = _coginit((int)&cog_data>>2, (int)cmmd_array>>2, cog);
#endif

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _waitcnt(_cnt() + (_clockfreq()/20));

   return cog;
}

