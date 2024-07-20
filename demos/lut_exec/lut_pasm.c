/*****************************************************************************
 *              Executing PASM code from the LUT on a P2                     *
 *                                                                           *
 * This program demonstrates how inline PASM can be used to execute          *
 * code from the LUT using cogexec mode.                                     *
 *                                                                           *
 * This program works on a Propeller 2 in any memory model.                  *
 *                                                                           *
 * Compile this program for using a command like:                            *
 *                                                                           *
 *    catalina -p2 lut_pasm.c -lc                                            *
 * or                                                                        *
 *    catalina -p2 lut_pasm.c -lc -C COMPACT                                 *
 * or                                                                        *
 *    catalina -p2 lut_pasm.c -lc -C TINY                                    *
 * or                                                                        *
 *    catalina -p2 lut_pasm.c -lc -C SMALL                                   *
 * or                                                                        *
 *    catalina -p2 lut_pasm.c -lc -C LARGE                                   *
 *                                                                           *
 *****************************************************************************/

#include <propeller.h>
#include <stdio.h>

#include <lut_exec.h>

// function_1 - load (if not already loaded) 
// the LUT function and then call it
int function_1(int a, int b, int c, int d) {
   LUT_BEGIN("$0","function_1","$DEADBEEF");
   PASM("                                        \n \
        mov r0, _PASM(d)                         \n \
        add r0, _PASM(c)                         \n \
        add r0, _PASM(b)                         \n \
        add r0, _PASM(a)                         \n \
   ");
   LUT_END;
   return LUT_CALL("function_1");
}

// load_function_2 - load (if not already loaded)
// the LUT function but do not call it
void load_function_2(int a, int b, int c, int d) {
   LUT_BEGIN("$0", "function_2", "$FEEDFACE");
   PASM("                                        \n \
        mov r0, _PASM(d)                         \n \
        add r0, _PASM(c)                         \n \
        add r0, _PASM(b)                         \n \
        add r0, _PASM(a)                         \n \
        add r0, #100 ' differ from function_1!   \n \
   ");
   LUT_END;
}

// function_2 - call an already loaded LUT function
int function_2(int a, int b, int c, int d) {
   return LUT_CALL("function_2");
}

void main(void) {

  int a, b, c, d; // these are dummy parameters and not strictly required

  // load and execute function 1 ...
  printf("function_1 returned %d (expected 10)\n", function_1(1,2,3,4));

  // load and execute function 1 ...
  printf("function_1 returned %d (expected 10)\n", function_1(1,2,3,4));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // now execute function 2 ...
  printf("function_2 returned %d (expected 110)\n", function_2(1,2,3,4));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // function 1 is no longer loaded, it will be re-load it and executed ...
  printf("function_1 returned %d (expected 26)\n", function_1(5,6,7,8));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // execute the loaded function 2 twice! ...
  printf("function_2 returned %d (expected 126)\n", function_2(5,6,7,8));
  printf("function_2 returned %d (expected 166)\n", function_2(15,16,17,18));

  // function 1 is no longer loaded, it will be re-load it and executed ...
  printf("function_1 returned %d (expected 66)\n", function_1(15,16,17,18));

  printf("done!\n");

  while(1);

}

