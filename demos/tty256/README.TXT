This directory contains programs to demonstrate Catalina's implementation of 
Ray Rodricks modified "Full Duplex Serial" driver. Ray's modifications change 
the buffer size to 256 bytes.  This library is supported only on the Propeller
1. For serial port support on the Propeller 2, use the serial8 library (and 
see the example programs in demos/serial8).

The plugin itself (Catalina_FullDuplexSerial256.spin) and the file that 
configures and loads extra plugins (Extras.inc) are in the catalina target 
directory.

The wrapper functions needed to access the plugin are in a library called 
"tty256". These functions have the same interface as the functions in
the Catalina "tty" library.

To use the plugin, all you need to do is link your program with the "tty256"
library - the plugin will be loaded automatically.

There is only one C program in this folder (test_tty.c), but there is
also a simple SPIN program (test_tty.spin) that demonstrates that the
same version of the plugin that Catalina uses is also perfectly usable
from Spin. To build the programs, use the "build_all" command, specifying the 
platform for which you want to build (HYDRA, HYBRID, TRIBLADEPROP CPU_1 etc).

For example:

   build_all HYBRID
or
   build_all TRIBLADEPROP CPU_2
or
   build_all C3 SMALL FLASH CACHED_1K

The following programs are built: 

   test_tty_1  - a compiled version of the C demo program that uses only 
                 the serial driver.

   test_tty_2  - a compiled version of the C demo program that also uses 
                 multithreading, and simulatenously uses stdio via the 
                 TV HMI (note that this program will not build if you 
                 choose to build an XMM version of the demo since the
                 multithreading kernel is not yet supported for XMM, and 
                 also that you must have a TV output on your Propeller
                 to run the resulting program program).

   test_tty_3  - a compled version of the Spin demo program.  

The simplest way to run the demo programs is to use the '-i' option to payload.
For example:

   payload -i test_tty_1


NOTES ON THE libtty256 LIBRARY:
===============================

The tty256 functions are intended to be functionally equivalent to the 
existing Catalina tty functions, and have the same names. For details, see 
the include file (in the directory 'Catalina\include') called 'catalina_tty.h'. 

However, for this reason you cannot use both the "tty" and "tty256" libraries
in the same C program.


