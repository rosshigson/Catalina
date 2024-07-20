This directory contains example programs to demonstrate the use of the
Catalina Parallelizer.

The Catalina Parallelizer implements the propeller pragmas to "parallelize"
a serial program. This process, and the propeller pragmas, are described in 
detail the document "Parallel Processing with Catalina".

To build these demo programs, use the 'build_all' script, specifying the
platform and any other options, such as HMI option or memory model. 

For example:

   build_all C3 TTY
or
   build_all TRIBLADEPROP CPU_2 PC VT100
or
   build_all P2_EVAL 
or
   build_all P2_EDGE

There are ten "test" programs - test_1.c to test_10.c - designed to illustrate
the use of various propeller pragmas, and two "real" programs - sieve.c and 
fftbench.c - which show their use in real applications.

Two versions of each program will be built - one with a "_s" suffix, which is a
normal serial version, and one with a "-p" suffix, which is a "parallelized"
version. For example, from the source file test_1.c the build_all script will 
produce test_1_s.bin and test_1_p.bin.

To run them, you might use commands like:

   payload -i test_1_s
or
   payload -i -b230400 test1_1_p

For more details, see the document "Parallel Processing with Catalina".
