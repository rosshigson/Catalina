#include <cog.h>

/*
 * _coginit_Spin : start a Spin program in a new cog.
 *
 * On entry:
 *    code  : address of code array to run
 *    data  : address of data space for variables
 *    stack : address of stack space
 *    start : offset within code to start
 *    offs  : offset within stack of initial stack pointer
 * On exit:
 *    returns: cog used, or -1 on any error
 */
int _coginit_Spin(void *code, void *data, void *stack, int start, int offs) {

   short params[6];
   int cog;

   ((unsigned long *)stack)[0] = 0xFFF9FFFF;
   ((unsigned long *)stack)[1] = 0xFFF9FFFF;

   params[0] = 0;
   params[1] = (short)((long)code);
   params[2] = (short)((long)data);
   params[3] = (short)((long)stack + 8);
   params[4] = (short)((long)code + start);
   params[5] = (short)((long)stack + 8 + offs);

   // start the Spin interpreter contained in the ROM
   cog = _coginit((int)&params>>2, 0xF004>>2, ANY_COG);

   // we include a short delay to allow the new kernel to initialize
   // using the values above - if we return too early, these values
   // (which exist only in the context of this function) will disappear
   // before they can be used by the cog being initialized!
   _waitcnt(_cnt() + (_clockfreq()/20));

   return cog;  

}
