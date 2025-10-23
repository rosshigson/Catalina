/*
 *  A simple C program to test the new level of the Optimizer. To see
 *  the affects of the various tests, compile with -u and examine the
 *  output file "Catalina.spin" after each compile. When compiled with
 *  -O4, you will see various functions commented out altogether, and 
 *  adorned with comments such as:
 *
 *      "Catalina Optimizer - <function name> not removed (Required)"
 *  or
 *      "Catalina Optimizer - <function name> removed (Not Required)"
 *
 *
 *  To compile the program, use a command like:
 *
 *     catalina test_optimizer.c -lc -u
 *
 *
 *  Code sizes when compiled with various levels of optimization are:
 *
 *     When compiled with no optimization (using command above):
 *        Code size is 404 bytes (TINY) or 216 bytes (COMPACT)
 *
 *     When compiled with -O3 added:
 *        Code size is 332 bytes (TINY) or 180 bytes (COMPACT)
 *
 *     When compiled with -O4 added:
 *        Code size is 212 bytes (TINY) or 116 bytes (COMPACT)
 *
 * 
 * Additional test cases can be enabled by adding the following options to the 
 * command line (in addition to -O4) to test that functions are correctly 
 * included when actually required:
 *
 *     -D TEST_1   tests a function is included when its address is taken 
 *                 even if it is not actually called
 *
 *     -D TEST_2   tests nested functions are included when called from main
 *
 *     -D TEST_3   tests nested functions are included when called from a 
 *                 function other than main
 *
 *     -D TEST_4   tests a function is included when it is invoked via a 
 *                 function pointer
 */

#include <stdio.h>
#include <hmi.h>

void func_5() {
   t_string(1, "I should always be commented out when compiled with -O4\n");
}

void (* f5)() = &func_5;

void func_4() {
   t_string(1, "I should be printed when compiled with -D TEST_4\n");
}

void (* f4)() = &func_4;

void func_3() {
   t_string(1, "I should be printed when compiled with -D TEST_3\n");
}

void func_2c() {
   t_string(1, "I should be printed when compiled with -D TEST_2\n");
}

void func_2b() {
   func_2c();
}

void func_2() {
   func_2b();
}

void func_1() {
   t_string(1, "Hello, World!\n");
#ifdef TEST_3
   func_3();
#endif   
}

void main (void) {

#ifdef TEST_1   
   void (* f4)() = &func_4;
#endif   

   func_1();

#ifdef TEST_2
   func_2();
#endif   

#ifdef TEST_4
   f4();
#endif   

   while (1); // Prop reboots on exit from main!

}
