#include <stdint.h>
#include <cog.h>

/*
 * _cogstart_NMM : Start a NMM C program in the specified cog.
 *                 Note that the program must already be loaded  
 *                 into the correct location in Hub RAM.
 *
 * On entry:
 *    PC   : address of the main function in Hub RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    arg  : argument to C main function (ends up in r2)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _cogstart_NMM(uint32_t PC, uint32_t SP, void *arg) {
   return _cogstart_NMM_cog(PC, SP, arg, ANY_COG);
}

