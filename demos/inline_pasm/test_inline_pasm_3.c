/*****************************************************************************
 *                                                                           *
 *         Simple examples of returning a value to C from inline PASM        *
 *                                                                           *
 * Note that this example will not compile correctly in COMPACT mode - this  *
 * is because COMPACT mode requires a different PASM format. See the program *
 * test_inline_pasm_4.c for a version that works in COMPACT mode.            *
 *                                                                           *
 * Compile this program with a command like:                                 *
 *                                                                           *
 *   catalina -lci -C TTY -C C3 test_inline_pasm_3.c                         *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>
#include <stdio.h>

// make sure we are compiled using the correct model for our PASM code
#ifdef __CATALINA_COMPACT
#error "This program will not work in COMPACT mode"
#endif

// this function will return 1 in r0, but it cannot be
// accessed because the function is declared as "void"
void test_pasm_1() {
   PASM(" mov r0,#1");
}

// this function will return 2 in r0, and it can be
// accessed because this function is declared as "int"
int test_pasm_2() {
   return PASM(" mov r0,#2");
}

// this function will return the value of i+j
int test_pasm_3(int i, int j) {
   // only the last PASM call can return a value from the function
   PASM(" mov r0,_PASM(i)");
   return PASM(" add r0,_PASM(j)");
   // however, note that multiple PASM lines could be included 
   // in one call, so we could rewrite the above two lines as:
   //    return PASM("mov r0,_PASM(i)\n add r0,_PASM(j)");
}

void main(void) {
   register int i = 0;

   /*
    * the following two statements are logically identical, but the
    * first always results in the PASM code being "inline" in this
    * function, whereas the second has the overhead of a function
    * call unless the Catalina Optimizer is used to inline it: 
    */
   PASM(" mov r0,#1");
   test_pasm_1();

   /*
    * The result of a PASM call can be used like any other function.
    * The value returned will be whatever the PASM code leaves in 
    * register r0. The following two lines are again logically 
    * identical, except the first is always inlinined:
    */
   i = PASM(" mov r0,#1");
   printf("i = %d\n", i);
   printf("result of test_pasm_2 = %d\n", test_pasm_2());

   /*
    * Function parameters can be accessed from PASM. If the parameters 
    * are limited to 4 or less simple types (i.e. not structs or unions) 
    * then they are passed in registers r2 .. r5, starting from the right.
    * For example, in the function call below, the value 2 is passed in r2, 
    * and 3 is passed in r3. It is ok to use these register names directly
    * if the function does not use r2 .. r5 for other purposes (e.g. to
    * call another function) but it is recommended to use the _PASM() macro
    * instead of using the register names. See the test_pasm_3 function:
    */
   printf("result of test_pasm_3 = %d\n", test_pasm_3(3, 2));

   while (1);

}

