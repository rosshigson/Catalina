This directory contains a demo program for the Catalina implementation of
the "4 port serial" driver. 

The driver itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libserial4". 

To use the driver, all you need to do is link your program with this library -
the plugin will be loaded automatically.

There is only one C program in this folder (test_serial4.c), but there is
also a simple SPIN program (test_serial4.spin) that demonstrates that the
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

   test_serial4_1 - a compiled version of the C demo program that
                    uses only the serial driver.

   test_serial4_2 - a compiled version of the C demo program that
                    also uses multithreading, and simulatenously uses 
                    stdio via the TV HMI (note that this program will 
                    not build if you choose to build an XMM version of 
                    the demo since the multithreading kernel is not 
                    yet supported for XMM, and also that you must have
                    a TV output on your Propeller to run the resulting 
                    program program).

   test_serial4_3 - a compled version of the Spin demo program.  

   test_serial4_count - a demo program to test the s4_txcount and s4_rxccount
                        functions

All the test programs test only one of the possible 4 serial ports. To 
configure the serial port (e.g. the pins and baud rate) edit the file 
"Extras.spin" in the Catalina target directory.

NOTES ON THE libserial4 LIBRARY:
================================

The serial4 functions are intended to be functionally equivalent to the 
functions in the Spin version of this driver, but are prefixed by "s4_". 
For details, see the include file (in the directory 'Catalina\include') 
called 'catalina_serial4.h'. 

