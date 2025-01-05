This directory contains xvi (a vi text editor clone) for Catalyst/Catalina. 
It can be used to edit text files on an SD card.

Vi requires a Propeller platform with an SD card and 512kb of XMM memory.

To make xvi work on the Propeller required a new I/O module (catalina.c) and
one source code change to the original xvi source (included).


BUILDING VI
===========

To build xvi requires both Catalina and MinGW to be installed. There is a make 
file (called makefile.cat) which can be used directly from the src directory. 

However, the simplest way to build vi is to use the 'build_all' script, 
specifying the platform any necessary options on the command line:

For example:

   build_all HYBRID
or
   build_all DRACBLADE

If you do not want to use the default HMI option for the platform, you can 
override it on the command line. Also, if you intend to use a PC terminal 
emulator, you should specify the VT100 option (which tells vi to should use 
VT100 escape codes to manage the screen). 

For example, to build vi to use the PC HMI on various platforms:

   build_all DRACBLADE PC VT100
or
   build_all RAMBLADE PC VT100
or
   build_all TRIBLADEPROP CPU_2 PC VT100

You can build vi to use color if your HMI option supports it (e.g. LORES_VGA).
When using a serial HMI option, you must specify whether or not to use color
or not, because not all vt100 terminal emulators support it (the one provided 
with Catalina - i.e. comms.exe does). To enable color in this case, specify
both the VT100 and USE_COLOR Catalina symbols as parameters to the build_all 
script. For instance:

  build_all P2_EDGE SIMPLE VT100 USE_COLOR

USING VI
========

To run xvi, copy the following files to a FAT16 SD card, renaming them to fit
into 8.3 filenames. The following is recommended:

   xvi.binary    -> VI.BIN
   help.xvi      -> HELP.XVI

A script to do this (copy_all) is provided. 

The vi program can be loaded with Catalyst, or with the Catalina Generic SD 
card loader (both included with Catalina). Morhpeus has special requirements
for loading the program (see below) but on other platforms Just type:

  vi filename

or just:

  vi 

For help once vi has started, type:

  :help

If you are familiar with vi, you can get started right away. If not, you
probably should read both a vi tutorial and the xvi documentation.

Note that the default is for vi to use unix-style line termination. If you 
edit a file that uses msdos-style line termination you will see "^M" at the 
end of each line. To use msdos line termination, start vi with the format 
parameter set to msdos, as follows:

  vi -s format=msdos filename

