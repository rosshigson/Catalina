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

For the morpheus platform you must build vi to use a proxy driver. A special
batch file is provided for use under Windows which builds both vi and the
required proxy driver:

   build_morpheus

Note that you may need to edit the above batch file if Catalina is not 
installed in the default location ("C:\Program Files (x86)\Catalina"). 

USING VI
========

To run xvi, copy the following files to a FAT16 SD card, renaming them to fit
into 8.3 filenames. The following is recommended:

   xvi.binary    -> VI.BIN
   help.xvi      -> HELP.XVI
   proxy.binary  -> PROXY.BIN (Morpheus only)

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


SPECIAL NOTES FOR MORPHEUS
==========================

On Morpheus, you must load both the vi program and the proxy program. Also,
when loaded this way, vi cannot accept parameters. To run it enter the 
commands:

  boot_2                <- load the boot loader into CPU #2
  @                     <- to select CPU #2 for next load
  vi                    <- load the client into CPU #2
  proxy                 <- load the server into CPU #1


