This directory contains demo programs for the Catalina implementation of
the "8 port serial" driver. Note that this driver is only supported on the 
Propeller 2.

The driver itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libserial8". 

To use the driver, all you need to do is link your program with this library -
e.g. by including -lserial8 on the Catalina command line). The plugin will be 
loaded automatically.

There are two C program in this folder (test_serial81.c and test_serial82.c). 
To build the programs, use the "build_all" command, specifying the platform 
for which you want to build (e.g. P2_EVAL) and (optionally) the memory model 
to use.

For example:

   build_all P2_EVAL
or
   build_all P2_EDGE COMPACT

The following programs are built: 

   test_serial8_1 - a demo program that tests only one port (by default, 
                    the standard serial port on pins 62 & 63).

   test_serial8_2 - a demo program that tests two serial ports (by 
                    default, the standard serial port on pins 62 and 63,
                    and another on pins 50 & 52). You can use a propplug 
                    on the latter pins.

   test_serial8_3 - a compiled version of the test_serial8_1.c program 
                    that also uses multithreading, and simulatenously 
                    uses stdio via the VGA HMI.

   test_serial8_count - a demo program to test the s8_txcount and s8_rxccount
                        functions

To configure the serial ports to be tested by the test_serial8_2 program, edit 
the file "Catalina_platforms.inc" in the Catalina target\p2 directory.

NOTES ON THE libserial8 LIBRARY:
================================

The serial8 functions are intended to be functionally equivalent to the 
functions provided by the 2 port serial driver, but are prefixed by "s8_". 
For details, see the include file (in the directory 'Catalina\include') 
called 'catalina_serial8.h'. 


