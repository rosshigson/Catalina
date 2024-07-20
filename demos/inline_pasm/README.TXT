This directory contains examples of inserting PASM code inline in C code, 
using the PASM() function and the _PASM() macro. For other techniques of using 
PASM code in conjunction with C programs, see the examples in the demos\spinc 
directory.

The Catalina compiler generally conforms to the ANSI C standard. Unfortunately,
this standard does not include an "asm" keyword (or function) that is often
added to C compilers to simplify the inclusion of code written in assembly 
language in a C program. 

However, Catalina defines a PASM pseudo-function that can be used for this
purpose - i.e. to include PASM instructions directly inline with C code. The 
prototype for this function is:

   extern int PASM(const char *code);

However, there is no actual PASM function body. Instead, when it sees a call
to this function, the compiler inserts the string literal given as argument
(it must be a string literal - it cannot be a variable) into the assembly 
language output, to be compiled by the PASM compiler. For example, the 
following program might be used to toggle the P0 output on a Propeller 
every 500 milliseconds:

   void main() {  
      PASM(" or DIRA, #1");      // set pin 0 as output
      while(1) {
         _waitms(500);
         PASM(" xor OUTA, #1");  // toggle pin 0
      }
   }

This particular example should work on a Propeller 1 or 2, but it will not 
work in COMPACT mode. This is because the PASM instructions are different 
in COMPACT mode. See the examples below for more details.

Any value in r0 when the PASM code returns will be available to the calling C
program as the result of the PASM function. For example:

   i = PASM("mov r0, #1"); // this will set i to 1

Otherwise, the result of the PASM call should be ignored.

Catalina also provides a _PASM() macro that can be used within inline PASM 
string literals to facilitate access to global C identifers, function names 
and function arguments.

Note that _PASM() is not a C macro  - it only expanded within the string 
literal argument to a PASM function call. _PASM(name) will return the PASM 
equivalent of the C name (or just name if the name is not known to the C 
compiler).

The _PASM() macro works for:

   global variables   - returning the PASM label of the C variable
   functions          - returning the PASM label of the C function
   function arguments - returning the register or frame offset of the argument

Note that _PASM() does NOT work for local C variables. To access these they
need to be passed as arguments to a C function - see the various examples in 
the demo programs.

There are several demo programs provided, all of which can be built using the 
'build_all' batch file provided. Specify the platform but do not specify a
memory model, since some of the examples must be compiled with specific
memory models:

E.g:

   build_all C3

   build_all HYDRA

   build_all P2_EVAL

   build_all P2_EDGE

This will build the following programs:

   test_inline_pasm_1 - an example of using the PASM function that works in 
                        the TINY memory mode on a Propeller 1 or 2.

   test_inline_pasm_2 - an example of using the PASM function that works in 
                        any memory mode on a Propeller 1 or 2.

   test_inline_pasm_3 - an example of using the return value from the PASM
                        function in the TINY memory mode on a Propeller 1 
                        or 2, or in NATIVE mode on a Propeller 2.

   test_inline_pasm_4 - an example of using the return value from the PASM
                        functon which works in COMPACT memory mode on a 
                        Propeller 1 or 2.

   test_inline_pasm_5 - an example of calling a PASM function from inline
                        PASM which works in COMPACT memory mode on a 
                        Propeller 1 or 2.

   test_inline_pasm_6 - An example of how to use the PASM function with the
                        Catalina Optimizer.

   test_inline_pasm_7 - More complex examples of the PASM function and _PASM
                        macro, including how the _PASM macro allows inline
                        PASM to to access more than 4 arguments, and access to
                        function arguments even after register reallocation.
                        The program works in the TINY memory mode on a 
                        Propeller 1 or 2, or in NATIVE mode on a Propeller 2.
 

Note that these programs should all work "as is" on the C3, HYDRA, P2_EVAL and
P2_EDGE platforms. On other platforms you may need to modify the pins used in 
some of the programs to suit your specific platform.

See the individual programs for more details.

