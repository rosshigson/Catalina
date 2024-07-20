This directory contains an example program to demonstrate BlackBox. 

To build the programs, use the build_all batch file. Note that on some
platforms (HYDRA and HYBRID) you must use the mouse port for debugging. This 
is because the normal serial port cannot be used when an expansion card (such
as the Hydra Extreme 512k SRAM card) is in use. For details on the special
cable you will need, see the Catalina Reference Manual (it's quite simple to 
make!). On such platforms, you should also specify the NO_MOUSE option to 
the build_all script, to prevent the mouse driver from loading and affecting
the use of this port for debugging. 

The NO_MOUSE option is also required when when building the demo on the
Propeller 2, to ensure sufficient cogs are avalable. 

For example:

  build_all C3
or
  build_all HYDRA NO_MOUSE
or
  build_all P2_EVAL VGA NO_MOUSE
or
  build_all P2_EDGE SMALL VGA NO_MOUSE

To debug a program that uses a serial HMI, you will need a Prop Plug installed
on pins other than the usual serial pins and ensure that the relevant platform 
configuration file specifies theem as the pins for Blackbox to use.

The default on the P1 is:

BLACKCAT_RXPIN = 31
BLACKCAT_TXPIN = 30

The default on the P2 is:

#define _BLACKCAT_RX_PIN  63
#define _BLACKCAT_TX_PIN  62

The example in this directory is further described in the tutorial document 
"Getting Started with BlackBox".


