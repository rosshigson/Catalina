This directory contains example programs to demonstrate the P2 specific
functions defined in the header file "propeller2.h". 

Note that these functions are only supported on the Propeller 2, although
they are generally intended to be functionally equivalent to the Propeller 1
functions of the same names (where the Propeller 1 supports the functionality).

To build the demo programs, use the 'build_all' scripts, specifying the
platform and (optionally) the memory model and HMI options. For example:

   build_all P2_EVAL
or
   build_all P2_EVAL COMPACT
or
   build_all P2_EVAL TINY LORES_VGA

This will build two test programs:

   test_p2_clock       - clock tests
   test_p2_smartpins   - smartpin tests
   test_p2             - miscellanous tests

To build a program manually that uses the functions in "propeller2.h", just 
include the header (i.e. "#include <propeller2.h>"), and then compile as 
normal - the functions are included in all the variants of the standard C 
libraries (i.e. -lc, -lci, -lcx, -lcix). For example:

   catalina -p2 -lc my_program.c -C P2_EVAL

See the "propeller2.h" header file for descriptions of the functions.

NOTE: The files test_specials_1.c and test_specials_2.c are not intended to
be excecuted, and are not compiled by default. They are intended only to 
illustrate how the special register names can be defined. On the P1, the
names DIRA, DIRB, INA, OUTA etc have to be used, and these are the names
declared in the "propeller.h" header file. On the P2, the names _DIRA _DIRB,
_INA, _OUTA etc are recommended because this is the standard that has been 
adopted by all Propeller 2 C compilers, and these are the declarations in 
the file "propeller2.h", but DIRA, DIRB, INA, OUTA can be used by including 
"propeller.h" instead, or by manually declaring them.
