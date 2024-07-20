#include <stdint.h>
#include <stdlib.h>
#include <cog.h>

#ifndef __CATALINA_P2
#error _cogsstart_XMM_cog not currently supported on the Propeller 1
#endif

/*
 * _cogstart_XMM_LARGE : Start a LARGE XMM C program in the current cog.
 *                       Note that the program must already be loaded  
 *                       into the correct location in XMM RAM. 
 *
 *                 IMPORTANT NOTES:
 *
 *                 1. Currently, both the CACHE and either the
 *                    FLOAT_A or FLOAT_C plugins must already 
 *                    be running before an XMM C program is
 *                    started.
 *                 2. Currently, only the Propeller 2 is supported.
 *                 3. Currently, only XMM LARGE is supported.
 *                 4. Currently, only one XMM C program can be
 *                    executing, and it assumes it will be the only 
 *                    such kernel executing.
 *
 * On entry:
 *    PC   : address of the main function in XMM RAM
 *    CS   : address of the code segment in XMM RAM
 *    SP   : initial stack pointer (i.e. the top of the stack)
 *    arg  : argument to C main function (ends up in r2)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _cogstart_XMM_LARGE(uint32_t PC, uint32_t CS, uint32_t SP,
                        void *arg) {
   return _cogstart_XMM_LARGE_cog_2(PC, CS, SP, NULL, arg, ANY_COG);
}

/*
 * _cogstart_XMM_LARGE_2 : same as above but accepts TWO arguments
 *    arg1  : argument to C main function (ends up in r3)
 *    arg2  : argument to C main function (ends up in r2)
 */
int _cogstart_XMM_LARGE_2(uint32_t PC, uint32_t CS, uint32_t SP, 
                          void *arg1, void *arg2) {
   return _cogstart_XMM_LARGE_cog_2(PC, CS, SP, arg1, arg2, ANY_COG);
}

