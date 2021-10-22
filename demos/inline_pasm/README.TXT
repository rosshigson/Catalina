This directory contains examples of inserting PASM code inline in C code, 
using the PASM() pseudo-function. For other techniques of using PASM code in
conjunction with C programs, see the examples in the demos\spinc directory.

The Catalina compiler generally conforms to the ANSI C standard. Unfortunately,
this standard does not include an "asm" keyword (or function) that is often
added to C compilers to simplify the inclusion of code written in assembly 
language in a C program. 

However, Catalina defines a PASM pseudo-function that can be used for this
purpose - i.e. to include PASM instructiond directly inline with C code. The 
prototype for this function (defined in propeller.h) is:

   extern int PASM(const char *code);

However, there is no actual PASM function body. Instead, when it sees a call
to this function, the compiler inserts the string literal given as argument
(it must be a constant string - it cannot be a variable) into the assembly 
language output, to be compiled by the PASM compiler. For example, the 
following program might be used to toggle the P0 output on a Propeller 
every 500 milliseconds:

   #include <propeller.h>
   void main() {  
      PASM(" or dira, #1");      // set bit 0 as output
      while(1) {
         msleep(500);
         PASM(" xor outa, #1");  // toggle bit 0
      }
   }

This particular example should work on a Propeller 1 or 2, but not in COMPACT
mode. This is because the PASM instructions are different in COMPACT mode. See
the examples below for more details.

Any value in r0 when the PASM code returns will be available to the calling C
program as the result of the PASM call. For example:

   i = PASM("mov r0, #1"); // this will set i to 1

Otherwise, the result of the PASM call should be ignored.

There are several demo programs provided, all of which can be built using the 
'build_all' batch file provided. Specify the platform and (optionally) the
memory model to use:

E.g:

   build_all C3

   build_all C3 COMPACT

   build_all P2_EVAL

   build_all P2_EVAL COMPACT

This will build some or all of the following programs:

   test_inline_pasm_1 - an example of using the PASM function that works in 
                        the LMM memory model on a Propeller 1.

   test_inline_pasm_2 - an example of using the PASM function that works in 
                        the LMM, COMPACT or NATIVE memory model on a Propeller
                        1 or 2.

   test_inline_pasm_3 - an example of using the return value from the PASM
                        function in the LMM memory model on a Propeller 1 or 
                        the NATIVE memory model on a Propeller 2.

   test_inline_pasm_4 - an example of using the return value from the PASM
                        functon which works in COMPACT memory model on a 
                        Propeller 1 or 2.

Since PASM is different between the Propeller 1 and Propeller 2, and also
differs depending on the memory model in use, some programs will only be 
built in COMPACT mode, and some only on the Propeller 1 or Propeller 2. The
build_all script does not detect this, but the programs themselves do and
will print error messages when compiled if they detect they will not work.

Note that you may need to modify the pins used in some of these programs 
to suit your specific platform.

See the individual programs for more details.

