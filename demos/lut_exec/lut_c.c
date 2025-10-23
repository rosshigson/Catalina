/*****************************************************************************
 *              Executing C code from the LUT on a P2                        *
 *                                                                           *
 * This program demonstrates how C code can be executed from the LUT using   *
 * cogexec mode.                                                             *
 *                                                                           *
 * This program works only on a Propeller 2 in NATIVE mode.                  *
 *                                                                           *
 * Compile this program for using a command like:                            *
 *                                                                           *
 *    catalina -p2 lut_c.c -lc                                               *
 *                                                                           *
 * Note that if C code is to be defined and loaded in one function and then  *
 * called by another function (as shown in function_2 below) then the two    *
 * functions must be identical in parameters, local variables and stack      *
 * frame structure. The first two are easy to ensure, but the last condition *
 * is not, since it depends on the C code itself. So it is recommended that  *
 * C code to be executed from the LUT always be defined, loaded and executed *
 * in the same function (as shown in function_1 below). The LUT load will    *
 * only be performed if the code is not already present in the LUT.          *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>
#include <stdio.h>
#include <math.h>

#include <lut_exec.h>

#if !defined(__CATALINA_NATIVE)
#error LUT EXECUTION OF C CODE IS ONLY SUPPORTED IN NATIVE MODE
#endif

// function_1 - load (if not already loaded) 
// the C code into the LUT and then call it
double function_1(double a, double b, double c, double d) {
   double result;
   LUT_BEGIN("$0","function_1","$DEADBEEF");
   result = a + b + c + d;
   LUT_END;
   LUT_CALL("function_1");
   return result;
}

// function_2 - load (if not already loaded) 
// the C code into the LUT but do not call it
void load_function_2(int a, int b, int c, int d) {
   int result;
   LUT_BEGIN("$0","function_2","$FEEDFACE");
   result = a + b + c + d + 100;
   LUT_END;
}

// function_2 - call an already loaded LUT function
int function_2(int a, int b, int c, int d) {
   int result;
   LUT_CALL("function_2");
   return result;
}

void main(void) {

  int a, b, c, d; // these are dummy parameters and not strictly required

  // load and execute function 1 ...
  printf("function_1 returned %.1f (expected 10)\n", function_1(1,2,3,4));

  // load and execute function 1 ...
  printf("function_1 returned %.1f (expected 10)\n", function_1(1,2,3,4));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // now execute function 2 ...
  printf("function_2 returned %d (expected 110)\n", function_2(1,2,3,4));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // function 1 is no longer loaded, it will be re-load it and executed ...
  printf("function_1 returned %.1f (expected 26)\n", function_1(5,6,7,8));

  // load function 2 but do not execute it ...
  load_function_2(a, b, c, d); 

  // execute the loaded function 2 twice! ...
  printf("function_2 returned %d (expected 126)\n", function_2(5,6,7,8));
  printf("function_2 returned %d (expected 166)\n", function_2(15,16,17,18));

  // function 1 is no longer loaded, it will be re-load it and executed ...
  printf("function_1 returned %.1f (expected 66)\n", function_1(15,16,17,18));

  printf("done!\n");

  while(1);

}

