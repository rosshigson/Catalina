This directory contains a demo program for the Catalina implementation of
the "Full Duplex Serial" driver library. This library is supported only on
the Propeller 1. For serial port support on the Propeller 2, use the serial8 
library (and see the example programs in demos/serial8).

The driver itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libtty". 

To use the driver, all you need to do is link your program with this library -
the plugin will be loaded automatically.

There is only one C program in this folder (test_tty.c), but there is
also a simple SPIN program (test_tty.spin) that demonstrates that the
same version of the driver that Catalina uses is also perfectly usable
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


NOTES ON THE libtty LIBRARY:
============================

The tty functions are intended to be functionally equivalent to the 
functions in the Spin version of this drivr, but are prefixed by "tty_". 
For details, see the include file (in the directory 'Catalina\include') 
called 'catalina_tty.h'. 




