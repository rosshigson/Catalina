This directory contains utilities for use with a Propeller 2 fitted with
HyperRAM & HyperFlash or PSRAM. For instance, the version of the P2_EDGE 
fitted with PSRAM (P2-EC32MB) or the P2_EDGE or P2_EVAL with the Parallax 
HyperFlash & Hyper RAM add-on board.

To build the demo programs, use the 'build_all' scripts, specifying the
platform and memory type and (optionally) HMI options. Note that you must 
specify one of PSRAM or HYPER. For example:

   build_all P2_EVAL HYPER SIMPLE VT100 
or
   build_all P2_EDGE PSRAM SIMPLE VT100 
or
   build_all P2_EDGE HYPER SIMPLE VT100 

Note that the type of HMI (SIMPLE in this case) should be specified even if
it is the default for the platform - this allows the test program to add
appropriate line-editing capabilities.

The build_all script will build either five or six utilities (five for
PSRAM, six for HyperRAM & HyperFlash):

   dump       - dump the contents of the external RAM
   loader     - load an XMM program into external RAM
   start      - start the XMM LARGE program loaded in external RAM
   args       - an XMM LARGE program that can be loaded and started
   delay      - check the current delay setting works at various clock speeds
   test       - HyperRAM & HyperFlash test program (HYPER only)

The dump, loader, start and args utilities all accept command-line parameters 
and are intended to be used in conjunction with the Catalyst SD card program 
loader. To use them, copy the binaries to an SD card that also contains 
Catalyst.

The delay utility does not have any command-line parameters and can either
be loaded using payload or serially (e.g. using payload). It will prompt for 
a range of clock speeds to test and report the success rate of reading/writing
random data to the external RAM. The delay must be adjusted in the relevant
platform configuration file (e.g. target/p2/P2EDGE.inc or target/p2/P2EVAL.inc).

The test utility does not have any command-line parameters and can either be 
loaded using Catalyst or serially (e.g. using payload).

The args demo can be run "as is" under Catalyst. For example:

   args "hello there!" 12.34 5

This can be handy in debugging argument processing issues. However, its primary
reason for inclusion here is to demonstrate the loader and start utilities.
For example:

   loader args.bin
   start "hello there!" 12.34 5

The loader and start utilities were originally written to debug the use of 
Hyper RAM or PSRAM as XMM RAM, and may be useful in implementing additional 
types of XMM RAM.

The test program was written specifically for testing the Flash capabilities
of the Parallax Hyper RAM & Hyper Flash add-on board. It is based on the 
original SPIN program developed for the RAM Drivers by rogloh.

The delay utility was written to assist in configuring the HYPER_DELAY_RAM
or PSRAM_DELAY parameters in the platform configuration file, since there is
no single value that works across all clock speeds (the program can test from 
50Mhz to 350Mhz). It is based on the original SPIN program developed for the
RAM Drivers by rogloh.
