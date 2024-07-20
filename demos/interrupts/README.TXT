This directory contains example programs to demonstrate running Catalina
programs using interrupts. 

Note that interrupts are only supported on the Propeller 2, and only in 
non-XMM programs - i.e. in COMPACT, NATIVE and TINY modes. They are not 
supported in XMM programs - i.e. SMALL or LARGE mode.

To build the demo programs, use the 'build_all' scripts, specifying the
platform as the first parameter, and then optionally a memory model and 
HMI options. For example:

   build_all P2_EVAL NATIVE
or
   build_all P2_EVAL TINY
or
   build_all P2_EDGE COMPACT
or
   build_all P2_EVAL VGA

The script will build the following programs:

  test_interrupts_1 - tests 3 simultaneous timer interrupts written in C
                      that will flash up to three LEDs on the P2_EVAL or 
                      P2_EDGE boards at three different rates.

  test_interrupts_2 - tests 3 simultaneous timer interrupts written in C
                      at up to 20,000 interrupts per second.

  test_threads_and_interrupts - test interrupts workin in conjunction with
                                multi-threading.

To build a program manually that uses interrupts, just include the interrupt 
library (int) on the command line (e.g. -lint). For example:

   catalina -p2 -lc -lint my_program.c -C P2_EDGE -C NATIVE

If the program uses threads, also include the threads library. For example:

   catalina -p2 -lc -lint -lthreads my_program.c -C P2_EVAL -C COMPACT

See the Catalina Reference Manual for the Propeller 2 for more details on
interrupts, or the file README.Interrupts for a summary.


