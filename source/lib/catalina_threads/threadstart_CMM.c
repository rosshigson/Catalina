#include <stdint.h>
#include <catalina_threads.h>
#include <catalina_cog.h>

/*
 * _threadstart_CMM : Start a CMM C program in the specified cog.
 *                    Note that the program must already be loaded  
 *                    into the correct location in Hub RAM.
 *
 * On entry:
 *    PC   : address of the main function in Hub RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    argc : argument to C function (ends up in r3)
 *    argv : argument to C function (ends up in r2)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _threadstart_CMM(uint32_t PC, uint32_t SP, int argc, char *argv[]) {
   return _threadstart_CMM_cog(PC, SP, argc, argv, ANY_COG);
}

