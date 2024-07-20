/*****************************************************************************
 *              More Inline PASM and _PASM examples                          *
 *                                                                           *
 * This program demonstrates how inline PASM can make use of C function      *
 * arguments and global C variables and functions by using the _PASM()       *
 * macro, and how to access more than 4 arguments.                           *
 *                                                                           *
 * Note that _PASM() is not a C macro - it is a macro that is only           *
 * expanded within PASM strings. _PASM(name) will return the PASM            *
 * equivalent of the C name (or just name if the name is not known to        *
 * the C compiler).                                                          *
 *                                                                           *
 * The _PASM() macro works for:                                              *
 *    global variables   - returning the PASM label of the C variable        *
 *    functions          - returning the PASM label of the C function        *
 *    function arguments - returning the register or frame offset of the     *
 *                         argument                                          *
 *                                                                           *
 * Note that _PASM() does NOT work for local variables. This is because      *
 * at the time of macro expansion, the final location of local variables     *
 * is not known - some may even end up not being allocated (e.g. if they     *
 * are used only in PASM but not in C - this is because the C compiler does  *
 * not know how to interpret PASM strings. But you can force the location of *
 * local variables to be known at a specific point by making them arguments  *
 * to a function - even if that function is subsequently 'inlined' by the    *
 * Catalina Optimizer.                                                       *
 *                                                                           *
 * This program works in TINY mode on a Propeller 1 or 2 or NATIVE mode on   *
 * a Propeller 2.                                                            *
 *                                                                           *
 * Compile this program for the Propeller 1 using a command like:            *
 *                                                                           *
 *    catalina test_inline_pasm_example_7.c -y -lci -C TTY -C C3             *
 *                                                                           *
 * Compile this program for the Propeller 2 using a command like:            *
 *                                                                           *
 *    catalina test_inline_pasm_example_7.c -y -lci -C P2_EDGE               *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>
#include <stdio.h>

// make sure we are compiled using the correct model for our PASM code
#ifdef __CATALINA_P2
#if !defined(__CATALINA_NATIVE) && !defined(__CATALINA_TINY)
#error PROGRAM MUST BE COMPILED IN NATIVE MODE ON THE PROPELLER 2
#endif
#else
#if !defined(__CATALINA_TINY)
#error PROGRAM MUST BE COMPILED IN TINY MODE ON THE PROPELLER 1
#endif
#endif

// example 1 - passing a single argument to PASM - no return value
void example_1(int a) {
   PASM(
       " mov OUTA, _PASM(a)\n"        // a is passed in register _PASM(a)
   );
}

// example 2 - returning a result from PASM - the value in r0 is returned 
int example_2(int a) {
   return PASM(
      " mov r0, INA\n"               // return value is passed in r0
      " and r0, _PASM(a)\n"          // a is passed in register _PASM(a)
   );
}

// example 3 - passing up to 4 arguments to PASM and returning a result
// (Up to 4 arguments will be passed in registers to simple functions)
int example_3(int a, int b, int c, int d) {
   return PASM(
      " mov r0, _PASM(a)\n"           // a is passed in register _PASM(a)
      " add r0, _PASM(b)\n"           // b is passed in register _PASM(b)
      " add r0, _PASM(c)\n"           // c is passed in register _PASM(c)
      " add r0, _PASM(d)\n"           // d is passed in register _PASM(d)
   );
}

// example 4 - passing more than 4 arguments to PASM and returning a result
// (only the LAST 4 arguments are passed in registers, any additional 
// arguments will be passed on the stack and must be accessed using an 
// offset from the frame pointer FP)
//
int example_4(int a, int b, int c, int d, int e, int f) {
   return PASM(
      " mov RI, FP\n"                 // a is passed
      " add RI, #_PASM(a)\n"          //    at offset _PASM(a)
      " rdlong r0, RI\n"              //    from the frame pointer FP
      " mov RI, FP\n"                 // b is passed
      " add RI, #_PASM(b)\n"          //    at offset _PASM(b)
      " rdlong r1, RI\n"              //    from the frame pointer FP
      " add r0, r1\n"
      " add r0, _PASM(c)\n"           // c is passed in register _PASM(c)
      " add r0, _PASM(d)\n"           // d is passed in register _PASM(d)
      " add r0, _PASM(e)\n"           // e is passed in register _PASM(e)
      " add r0, _PASM(f)\n"           // f is passed in register _PASM(f)
   );
}

static val_5;                         // variables at file scope are global

// example 5 - accessing a global variable (we use val_5)
// (Note that we need different code on the P1 and the P2 to access Hub RAM)
void example_5(int a) {
   PASM(
      "#ifdef NATIVE\n"               // propeller 2 code 
      " rdlong r0, ##@_PASM(val_5)\n" //    val_5 is at address _PASM(val_5)
      " add r0, _PASM(a)\n"           //    a is passed in register _PASM(a)
      " wrlong r0, ##@_PASM(val_5)\n" //    val_5 is at address _PASM(val_5)
      "#else\n"                        
      " jmp #LODL\n"                  // propeller 1 code 
      " long @_PASM(val_5)\n"         //    val_5 is at address @_PASM(val_5)
      " rdlong r0, RI\n"              //    @_PASM(val_5) is now in RI
      " add r0, _PASM(a)\n"           //    a is passed in register _PASM(a)
      " wrlong r0, RI\n"              //    RI is still valid
      "#endif\n"
   );
}

// example 6 - access local variables and call a C function from PASM. 
// Note that the mov instructions to set up the values in r2 .. r5 are not 
// strictly required here because that is where they will be anyway - but it 
// is good practice in case the registers are reallocated (e.g. by an
// intervening function call - for an example of this, see example 7 below).
// (Note that we need different code on the P1 and the P2 call a function)
int example_6(int a, int b, int c, int d) {
   return PASM(
      " mov r2, _PASM(d)\n"           // put argument d in register 2
      " mov r3, _PASM(c)\n"           // put argument c in register 3
      " mov r4, _PASM(b)\n"           // put argument b in register 4
      " mov r5, _PASM(a)\n"           // put argument a in register 6
      " mov BC, #16\n"                // this can usually be omitted
      " sub SP, #12\n"                // reserve space for args in bytes (- 4)
      "#ifdef P2\n"
      " calld PA, #CALA\n"            // propeller 2 call
      " long @_PASM(example_3)\n"     //    to example_3
      "#else\n"
      " jmp #CALA\n"                  // propeller 1 call
      " long @_PASM(example_3)\n"     //    to example_3
      "#endif\n"
      " add SP, #12\n"                // release stack space after call
   );
}

// example 7 - unlike using the register names direcrtly, accessing arguments 
// using the _PASM() macro works even after register reallocation.
// (Note that we use different code on the P1 and the P2 call a function)
int example_7(int a, int b, int c, int d) {
   printf("registers will be reallocated by this function call!\n");
   return PASM(
      " mov r2, _PASM(d)\n"           // put argument d in register 2
      " mov r3, _PASM(c)\n"           // put argument c in register 3
      " mov r4, _PASM(b)\n"           // put argument b in register 4
      " mov r5, _PASM(a)\n"           // put argument a in register 6
      " mov BC, #16\n"                // this can usually be omitted
      " sub SP, #12\n"                // arg size in bytes - 4 (historical!)
      "#ifdef P2\n"
      " calld PA, #CALA\n"            // propeller 2 call
      " long @_PASM(example_3)\n"     //    to example_3
      "#else\n"
      " jmp #CALA\n"                  // propeller 1 call
      " long @_PASM(example_3)\n"     //    to example_3
      "#endif\n"
      " add SP, #12\n"                // release stack after call
   );
}

void main(void) {

  // delcare some local variables
  int a = 1;
  int b = 2;
  int c = 3;
  int d = 4;
  int e = 5;
  int f = 6;
  int g = 7;
  int h = 8;

  printf("Inline PASM examples\n\n");

  printf("Using Inline PASM to wait 5 seconds ... ");
#ifdef __CATALINA_P2
  PASM(" waitx ##5*200000000");
#else
  PASM(" jmp #LODL");
  PASM(" long 5*80000000");
  PASM(" add RI, CNT");
  PASM(" waitcnt RI, #0");
#endif
  printf("done!\n");

  printf("\nInline PASM can access local variables using functions:\n");
  example_1(a); 
  printf("example_1 returns no result\n");
  printf("example_2 returns %d (no expected value)\n", example_2(a));
  printf("example_3 returns %d (expecting 10)\n", example_3(a,b,c,d));
  printf("example_4 returns %d (expecting 21)\n", example_4(a,b,c,d,e,f));

  printf("\nInline PASM can access global variables:\n");
  val_5 = 11;
  example_5(val_5);
  example_5(33);
  printf("example_5 returns %d (expecting 55)\n", val_5);

  printf("\nInline PASM can call C functions:\n");
  printf("example_6 returns %d (expecting 26)\n", example_6(e,f,g,h));

  printf("\nInline PASM can access arguments after register reallocation:\n");
  printf("example_7 returns %d (expecting 26)\n", example_7(e,f,g,h));

  printf("\nInline PASM can be used within an expression:\n");
  printf("example_8 returns %d (expecting 100)\n", PASM(" mov r0, #99") + 1); 
  printf("\nFinsihed!\n");
  while(1);
}

