#include "utilities.h"
#include <stdlib.h>

#ifdef __CATALINA_P2
#error THIS PROGRAM REQUIRES A PROPELLER 1
#endif

/*
 * It is not normally necessary to include your own Spin Interpreter in your 
 * C program, since you can use the _coginit_spin function which uses the
 * version in ROM. However, it would be necessary to do this if we want to 
 * modify the default Spin interpreter. It may also be necessary to do this 
 * on the Propeller II.
 *
 * The Spin interpreter can be included as an array using the following 
 * commands on Chip's original spin interpreter code (after adding a 
 * default PUB routine!). This one is based on the PNut Spin interprerter
 * posted in the PArallax forums by Chip Gracey. It is build using the
 * following commands:
 *
 *       spinnaker -p -a PNut_interpreter.spin
 *       spinc PNut_interpreter.binary > PNut_interpreter.h
 *
 * Then we can include it just like any other cog program, i.e:
 *
 */
#include "PNut_interpreter.h"

/*
 * coginit_PNut : start a Spin program in a new cog (this is very similar
 *                to the _coginit_Spin function, but uses a custom Spin
 *                interpreter).
 *
 * On entry:
 *    code  : address of code array to run
 *    data  : address of data space for variables
 *    stack : address of stack space
 *    start : offset within code to start
 *    offs  : offset within stack of initial stack pointer
 * On exit:
 *    cog used, or -1 on any error
 */
int coginit_PNut(void *code, void *data, void *stack, int start, int offs) {

   char interpreter[PNut_interpreter_PROG_SIZE];

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

   //copy the interpreter to Hub RAM and start it
   memcpy(interpreter, PNut_interpreter_array, PNut_interpreter_PROG_SIZE);
   cog = _coginit((int)&params>>2, (int)interpreter>>2, ANY_COG);

   // small delay to allow cog to start properly before we re-use the RAM!
   wait(50);

   return cog;  

}
