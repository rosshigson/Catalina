This directory contains an example program to demonstrate BlackBox. 

To build the programs, use the build_all batch file. Note that on some
platforms (HYDRA and HYBRID) you must use the mouse port for debugging. This 
is because the normal serial port cannot be used when an expansion card (such
as the Hydra Extreme 512k SRAM card) is in use. For details on the special
cable you will need, see the Catalina Reference Manual (it's quite simple to 
make!). On such platforms, you should also specify the NO_MOUSE option to 
the build_all script, to prevent the mouse driver from loading and affecting
the use of this port for debugging. For example:

  build_all HYDRA NO_MOUSE
or
  build_all P2_EVAL 

The example in this directory is further described in the tutorial document 
"Getting Started with BlackBox".


