This directory contains a demo program for the Catalina implementation of
the "2 port serial" driver. Note that this driver is only supported on the 
Propeller 2.

The driver itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libserial2". 

To use the driver, all you need to do is link your program with this library -
e.g. by including -lserial2 on the Catalina command line). The plugin will be 
loaded automatically.

There is only one C program in this folder (test_serial2.c). To build the 
programs, use the "build_all" command, specifying the platform for which you 
want to build (P2_EVAL etc) and (optionally) the memory model to use.

For example:

   build_all P2_EVAL
or
   build_all P2_EDGE COMPACT

The following programs are built: 

   test_serial2_1 - a compiled version of the C demo program that uses 
                    only the serial driver.

   test_serial2_2 - a compiled version of the C demo program that also 
                    uses multithreading, and simulatenously uses stdio
                    via the VGA HMI

   test_serial2_count - a demo program to test the s2_txcount and s2_rxccount
                        functions

All the test programs test only one of the possible 2 serial ports. To test
the other port, modify the PORT in the source code. To configure the serial 
port (e.g. the pins and baud rate) edit the file "Catalina_platforms.inc" in 
the Catalina target\p2 directory.

NOTES ON THE libserial2 LIBRARY:
================================

The serial2 functions are intended to be functionally equivalent to the 
functions in the Spin version of this driver, but are prefixed by "s2_". 
For details, see the include file (in the directory 'Catalina\include') 
called 'catalina_serial2.h'. 


