This directory contains a version of "Super Star Trek" for Catalyst/Catalina. 

It requires 512KB SRAM and an SD card.

All the source is provided. No changes to the original source code are needed 
to compile the program under Catalina, but there are about 20 lines of platform 
specific code provided in the file 'catalina.c'. 


BUILDING SUPER STAR TREK
========================

To build Super Star Trek for all platforms, use the 'build_all' script 
provided, specifying the platform on the command line. 

Note that you will need to specify the HMI option if you do not want to use 
the default HMI on the platform, plus any other platform specific options, 
such as the CPU to use.

For example:

   build_all HYBRID
or
   build_all DRACBLADE
or
   build_all TRIBLADEPROP CPU_2 PC

Note that the HYBRID version uses the high definition TV driver which is only 
40 characters wide - but the game expects a full size (i.e. 80 character) 
screen. So while it is playable on the HYBRID, it doesn't look very good..


RUNNNG SUPER STAR TREK
======================

To run Super Star Trek on the Propeller, copy the following files to a FAT16 SD 
card, renaming them to fit into 8.3 filenames. The following is recommended:

   sst.binary    -> SST.BIN
   sst.doc       -> SST.DOC
   proxy.bin     -> PROXY.BIN (TriBladeProp using proxy drivers)

A script to do this (copy_all) is provided. 


Super Star Trek requires no parameters when run. On all platforms except the 
TriBladeProp if proxy drivers are being used), simply enter 
the command:

   sst

On the TriBladeProp (when using proxy drivers only) you must load both the 
game and the proxy driver - but be aware that you may also need to modify 
cables or jumpers during the load process. The commands to use are:

   boot_1           <- load the boot loader into CPU #1
   !                <- to select CPU #1 for next load
   sst              <- load the client into CPU #1
   proxy            <- load the server into CPU #2

The game uses the SD Card during game play as a normal file system - the SD 
card is used to hold the game on-line help file, and also to store and load
saved games. Be aware that the file system access is quite slow, and it can 
take 10-15 seconds to display help information.

For more information about the game, see the file 'sst.doc'.

