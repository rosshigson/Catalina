/*****************************************************************************
 *                                                                           *
 *       Example of calling a PASM function from COMPACT inline PASM         *
 *                                                                           *
 * Note that this example will not compile correctly except in COMPACT mode  *
 * because COMPACT mode uses a different PASM format. See the "compact.inc"  *
 * file in the target directory for more details on COMPACT PASM.            *
 *                                                                           *
 * In COMPACT mode you may want to mostly execute PASM code as "normal"      *
 * (i.e. non-COMPACT) PASM, because COMPACT PASM is slower. To do so, you    *
 * can use the "word I16B_EXEC" ... "jmp #EXEC_STOP" sequence.               *
 * However, you cannot use the "normal" PASM methods to call a function on   *
 * the Propeller 1 - but you can call the function using COMPACT PASM, as    *
 * this program demonstrates.                                                *
 *                                                                           *
 * Compile this program with a command like:                                 *
 *                                                                           *
 *   catalina -lci -C TTY -C COMPACT test_inline_pasm_5.c -C C3              *
 *                                                                           *
 * This program will work "as is" on the HYDRA, C3, P2_EDGE and P2_EVAL.     *
 * On other platforms you may have to adjust the LED constant. The code      *
 * determines whether it needs to use port A or port B.                      *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>
#include <stdio.h>

// make sure we are compiled using the correct model for our PASM code
#ifndef __CATALINA_COMPACT
#error "This program will only work in COMPACT mode"
#endif

#if defined(__CATALINA_C3)
#define LED 15     // VGA LED on C3
#elif defined(__CATALINA_P2_EDGE)
#define LED 38     // LED on P2 EDGE
#elif defined(__CATALINA_P2_EVAL)
#define LED 56     // LED on P2 EVAL
#else
#define LED 0      // DEBUG LED on HYDRA
#endif

#if LED < 32
#define PORT "A"   // use INA, OUTA, DIRA
#else
#define PORT "B"   // use INB, OUTB, DIRB
#endif

//
// toggle : This function just toggles the pin number passed in as a parameter.
//          It demonstrates how to call a PASM function from within another
//          PASM function in a COMPACT program, even when mostly executing
//          non-COMPACT code. 
//
void toggle(unsigned long led) {
   PASM(" word I16B_EXEC             "); // start executing "normal" PASM
   PASM(" alignl                     "); // alignl after I16B_EXEC (see note 2)
   PASM(" mov r0,#1                  "); // set up pin mask ...
   PASM(" shl r0,_PASM(led)          "); // ... using led argument
   PASM(" jmp #EXEC_STOP             "); // stop executing "normal" PASM
   PASM(" long I32_CALA + @func<<S32 "); // call function using "compact" PASM
   PASM(" word I16B_EXEC             "); // start executing "normal" PASM
   PASM(" alignl                     "); // alignl after I16B_EXEC (see note 2)
   PASM(" neg r0,#1                  "); // do more "normal" PASM
   PASM(" jmp #EXEC_STOP             "); // stop executing "normal" PASM
   PASM(" long I32_JMPA + @exit<<S32 "); // jump to exit point (see note 1)

   // embedded PASM function (see note 3)
   PASM(" alignl                     "); // "alignl" before label (see note 2)
   PASM("func                        "); // define PASM function (see note 3)
   PASM(" word I16B_EXEC             "); // start executing "normal" PASM
   PASM(" alignl                     "); // alignl after I16B_EXEC (see note 2)
   PASM(" or DIR" PORT ",r0          "); // toggle ...
   PASM(" xor OUT" PORT ",r0          "); // ... the specified pin of port A
   PASM(" jmp #EXEC_STOP             "); // stop executing "normal" PASM
   PASM(" word I16B_RETN             "); // return to caller

   PASM(" alignl                     "); // "alignl" before label (see note 2)
   PASM("exit                        "); // exit point from the C function
}

//
// NOTES:
//
//   1. By jumping to the normal C function exit point, we don't need to 
//      concern ourselves with HOW to exit the C function, which can be
//      complex because it can depend on the parameters to the function,
//      which we might change and then forget to update the exit code.
//
//   2. Although strictly required only on the Propeller 2 (which uses
//      differen alignment rules) an "alignl" statement is recommended 
//      before each PASM label, or the label might refer to the next byte 
//      or word, not the next long. Also, one should be included after 
//      each EXEC_I16B or EXEC_PASM.
//
//   3. By embedding the function to be called WITHIN the calling function, 
//      we guarantee that the optimizer will never remove the code - we can 
//      declare it elsewhere (e.g. in another function), but we then have to
//      ensure that it looks to Catalina like it is actually used, or the
//      Optimizer might remove it. The only drawback of embedding it is that
//      we then have to jump over the embedded code to exit the C function,
//      but it is recommended pratice anyway to always jump to the normal C
//      function exit (see note 1).
//

void main(void) {
   printf("Starting\n");
   while(1) {
     printf("Toggling\n");
     toggle(LED);
     _waitms(500);
   }
}

