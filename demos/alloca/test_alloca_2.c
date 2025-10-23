/******************************************************************************
 *     This program tests that alloca() works even when specified in a list   *
 *     of function arguments.                                                 *
 *                                                                            *
 * Works in all memory models, on the P1 and P2. Compile this program with a  *
 * command like:                                                              *
 *                                                                            *
 *  catalina test_alloca_2.c -lc                                              *
 *  catalina test_alloca_2.c -lci -C COMPACT                                  *
 *  catalina test_alloca_2.c -lcix -p2                                        *
 *  catalina test_alloca_2.c -lcx -p2 -C P2_EDGE -C LARGE                     *
 *  (etc)                                                                     *
 *                                                                            *
 ******************************************************************************/
#include <stdio.h>
#include <alloca.h>
#include <prop.h>

// this handy macro returns the current frame pointer in any memory model
// on the P1 or P2 ...
#define FP PASM("#ifdef COMPACT\n word I16B_PASM\n#endif\n alignl\n mov r0, FP\n")

// this handy macro returns the current stack pointer in any memory model
// on the P1 or P2 ...
#define SP PASM("#ifdef COMPACT\n word I16B_PASM\n#endif\n alignl\n mov r0, SP\n")
 
void func(int a, void *b, int c) {
   void *x;
   printf("func FP  = %06X\n", FP);
   printf("func SP  = %06X\n", SP);
   printf("func a   = %06X\n", a);
   printf("func b   = %06X\n", (int)b);
   printf("func c   = %06X\n", c);
   x = alloca(99);
   printf("func SP  = %06X\n", (int)x);
   printf("func done\n");
}

void main() {
   int SP1, SP2, SP3;
   printf("main FP  = %06X\n", FP);
   printf("main SP1 = %06X\n", SP1 = SP);
   func(1, alloca(99), 2);
   printf("main SP2 = %06X\n", SP2 = SP);
   func(3, alloca(99), 4);
   printf("main SP3 = %06X\n", SP3 = SP);
   printf("main done\n");
   while(1);
}
