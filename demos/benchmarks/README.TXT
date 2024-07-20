This directory contains a couple of simple and common benchmark programs 
that have been used to test Catalina.

To build the programs, simply use the build_all script, specifying the 
platform, HMI options and (optionally) the memory model to use. Note that
some programs may require COMPACT, SMALL or LARGE to be specified on the
Propeller 1.

For example:

   build_all P2_EVAL
or
   build_all C3 TTY
or
   build_all C3 COMPACT TTY

The following program executables will built: 

   fibo       - a simple fibonnacci program that times the calculation of
                fibonacci numbers up to 26.

   ackerman_1 - a simple program that times the calculation of various
                ackerman functions and uses stdio for output.

   ackerman_2 - a simple program similar to ackerman_1 but which uses 
                Catalina HMI functions for output (which makes it smaller, 
                but not faster).

   dhry       - the Dhrystone benchmark.

   whet       - the Whetstone benchmark.


