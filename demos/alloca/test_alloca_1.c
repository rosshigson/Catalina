/******************************************************************************
 *     A simple program to test the new 'alloca()' built-in function.         *
 *                                                                            *
 * Works in all memory models, on the P1 and P2. Compile this program with a  *
 * command like:                                                              *
 *                                                                            *
 *  catalina test_alloca.c -lc                                                *
 *  catalina test_alloca.c -lci -C COMPACT                                    *
 *  catalina test_alloca.c -lcix -p2                                          *
 *  catalina test_alloca.c -lcx -p2 -C P2_EDGE -C LARGE                       *
 *  (etc)                                                                     *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <alloca.h>

// this handy macro returns the current frame pointer in any memory model
// on the P1 or P2 ...
#define FP PASM("#ifdef COMPACT\n word I16B_PASM\n#endif\n alignl\n mov r0, FP\n")

// this handy macro returns the current stack pointer in any memory model
// on the P1 or P2 ...
#define SP PASM("#ifdef COMPACT\n word I16B_PASM\n#endif\n alignl\n mov r0, SP\n")
 

// this function just uses alloca() twice, and then returns.
void do_alloca(int n) {
  void *x;
  void *y;

  printf("in function do_alloc... \n");
  printf("FP is %06X\n", FP);
  printf("SP is %06X\n", SP);
  printf("allocating %d bytes for x\n", n);
  x = alloca(n);
  printf("x  is %06X\n", (int)x);
  printf("SP is %06X\n", SP);
  printf("allocating %d bytes for y\n", n);
  y = alloca(n);
  printf("y  is %06X\n", (int)y);
  printf("SP is %06X\n", SP);
  printf("... do_alloc done \n");
}

// the main function calls the do_alloca() function, as well as doing some 
// allocation of its own before and after.
void main() {
  void *a;
  void *b;
  int SP1, SP2;
  int n = 511;

  printf("in main ...\n");
  printf("FP is %06X\n", FP);
  printf("SP is %06X\n", SP);
  printf("allocating %d bytes for a\n", n);
  a = alloca(n);
  printf("a  is %06X\n", (int)a);
  printf("SP is %06X\n", SP1 = SP);
  do_alloca(99);
  printf("in main again ...\n");
  printf("SP is %06X\n", SP2 = SP);
  if (SP1 == SP2) {
    printf("SP correct after call to do_alloc\n");
  }
  else {
    printf("ERROR: SP wrong after call to do_alloc\n");
  }
  printf("allocating %d bytes for b\n", n);
  b = alloca(n);
  printf("b  is %06X\n", (int)b);
  printf("SP is %06X\n", SP);
  printf("...main done\n");
  while(1);
}

