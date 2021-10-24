This directory contains a couple of simple nd common benchmark programs 
that have been used to test Catalina.

To build the programs, simply use the build_all script, specifying the 
platform and (optionally) the memory model to use. For example:

   build_all P2_EVAL
or
   build_all C3 COMPACT

The following program executables will built: 

   fibo       - a simple fibonnacci program that times the calculation of
                fibonacci numbers up to 26.

   ackerman_1 - a simple progrm that times the calculation of various
                ackerman functions and uses stdio for output.

   ackerman_2 - a simple progrm that times the calculation of various
                ackerman functions and uses Catalina HMI functions
                for output.


