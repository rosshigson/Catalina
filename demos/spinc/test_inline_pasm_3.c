/*****************************************************************************
 *                                                                           *
 *         Simple examples of returning a value to C from inline PASM        *
 *                                                                           *
 * Note that this example will not compile correctly in COMPACT mode - this  *
 * is because COMPACT mode requires a different PASM format. See the program *
 * test_inline_pasm_4.c for a version that works in COMPACT mode.            *
 *                                                                           *
 *****************************************************************************/

#ifdef __CATALINA_COMPACT
#error "This program will not work in COMPACT mode"
#endif

#include <stdio.h>

// the PASM function is defined in propeller.h
#include <propeller.h>

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
   PASM(" mov r0,r2");
   return PASM(" add r0,r3");
   // however, note that multiple PASM lines could be included 
   // in one call, so we could rewrite the above two lines as:
   //    return PASM("mov r0,r2\n add r0,r3");
}

void main(void) {
   register int i;

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
   i = PASM(" mov r0,#2");
   i = test_pasm_2();
   printf("result of test_pasm_2 = %d\n", i);

   /*
    * Function parameters can be accessed from PASM. If the parameters 
    * are limited to 4 or less simple types (i.e. not structs or unions) 
    * then they are passed in registers r2 .. r5, starting from the right.
    * For example, in the function call below, the value 2 is passed in r2, 
    * and 3 is passed in r3:
    */
   i = test_pasm_3(3, 2);

   printf("result of test_pasm_3 = %d\n", i);

   while (1);

}

