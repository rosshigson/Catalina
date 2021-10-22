Catalyst
========

This directory contains Catalyst - Catalina's SD Card Loader.

See the file CATALYST.TXT for an overview, or the Catalyst Reference Manual.

Each subdirectory contains a different part of Catalyst. Each subdirectory
can be built individually, or the 'build_all' sccipt in this directory can
be used to build all components and copy them to the bin directory, ready
to be copied to an SD card.

Here are the commands recommended to build some common platform (except 
MORPHEUS, which requires proxy drivers):

   build_all HYBRID

   build_all RAMBLADE PC VT100

   build_all DRACBLADE LORES_VGA     <-- to use local VGA and keyboard
     or
   build_all DRACBLADE PC VT100      <-- to use PC terminal emulator

   build_all TRIBLADEPROP CPU_2 PC VT100 

   build_all C3 FLASH CACHED_1K TTY VT100  <-- to use TTY serial interface

   build_all P2_EVAL TTY VT100             <-- for the P2 on a P2_EVAL board

   build_all P2_EVAL LORES_VGA COLOR_4     <-- for the P2 with VGA and USB

   build_all QUICKSTART PMC CACHED_1K FLASH TTY

Note that you should not specify a memory model (e.g. COMPACT, TINY, SMALL,
LARGE, NATIVE etc) on the command line - on some platforms, different parts of
Catalyst must be built with different memory models. The batch file knows 
which memory modles to use for all the supported platforms. If your platform
requires a special build, you may need to build each component separatley.
 
Note that using the FLASH symbol will give you occasional warning messages 
such as "FLASH is incompatible with current layout - ignoring" when building
the core catalyst components (which do not use FLASH). This message is
expected and can be safely ignored.

Note the use of the VT100 compile flag - this tells various Catalyst programs
to expect a VT100 compatible terminal emulator, and is normally used in 
conjunction with the PC or TTY HMI options.

To build for MORPHEUS, use the special 'build_morpheus' script - this script
will build Catalyst to run on Morhpeus CPU #2, and use a PC terminal emulator 
as the HMI (Catalyst has to use proxy drivers on Morpheus even though we are 
using a PC HMI because CPU #1 has the SD card but CPU #2 has the XMM RAM).
