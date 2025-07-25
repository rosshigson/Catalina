Overview
========

Catalina is an ANSI C compiler, plus C libraries and utilities, for the 
Parallax Propeller family of microcontrollers. 

Catalina supports both internal and external memory models on both the 
Propeller 1 and 2, for program sizes up to 16Mb.

Catalina runs under Windows, Linux, the Raspberry Pi OS and also its own 
self-hosted development enviroment (Catalyst).

Catalina supports command-line use (Windows, Linux, Pi and Catalyst) and an 
Integrated Development Environment based on Geany (Windows, Linux and Pi).

Catalina supports the Lua programming language, either for stand-alone Lua 
program development, or for Lua embedded in C programs.

Catalina supports multi-threaded, multi-processor and multi-model programming.

Catalina supports lightweight threads as well as Posix threads and Lua threads.

Components
==========

The main components of Catalina are:

   catalina    : The command-line C compiler (Windows, Linux, Pi and Catalyst)

   catalina_geany : An Integrated Development Environment (Windows, Linux, 
                    and Pi)

   catalyst    : An SD card based program loader and self-hosted development 
                 environment for the Propeller 1 and Propeller 2

   payload     : A serial program loader and simple terminal emulator (Windows, 
                 Linux and Pi)

   comms       : A full-featured VT100 terminal emulator (Windows only)

   telnet      : A full-featured telnet client (Windows only)

   blackbox    : A C source level debugger (Windows Linux, and Pi)

   catapult    : A utility for building multi-model C programs (Windows, Linux, 
                 and Pi)

   parallelize : A utility for building multi-processor C programs (Windows, 
                 Linux, and Pi)

   spinnaker   : A propeller 1 Spin compiler/assembler (Windows, Linux, and Pi)

   p2asm       : A propeller 2 assembler (Windows, Linux, Pi and Catalyst)

Setting up Catalina 
===================

Windows Installer
-----------------

If you used a Windows Installer package (e.g. Catalina_8.8_Setup.exe) to 
install Catalina and accepted the recommended settings, the Windows Start Menu
should contain the following shortcuts:

   Catalina Command Line 
      Start a Windows command shell (i.e. cmd.exe) in the Catalina directory 
      and set up the Catalina environment variables and paths.

   Catalina Geany
      Start the Catalina version of the Geany Integrated Development 
      Environment.

   Documents 
      Contains links to Catalina tutorial and reference documents.

Windows Manual install
----------------------

If you did not use the Windows Setup package but either cloned the Git
repository or downloaded it as a compressed file and then uncompressed it, 
then the distribution will includes all sources, but no Catalina binaries. 

If you do not want to rebuild Catalina from source (which is a complex process
under Windows) then one or more separate packages of precompiled binaries will
be available suitable for Windows 10 or Windows 11 as assets associated with
the Git release. Download the assets and uncompress them into the relevant 
directory (e.g. from Catalina_8.8_Windows_binaries.zip into Catalina\bin or 
from Catalina_8.8_Windows_Geany_binaries.zip into Catalina\catalina_geany).
    
Open a Windows command shell (i.e. cmd.exe), then cd to the Catalina 
installation folder. Then execute the following command to set up the 
Catalina environment variables and paths:

   use_catalina`

The use_catalina script will also check whether the Catalina binaries have
been installed, and also whether there is a version of make installed. 
While make is not required to use the Catalina compiler, it is required 
to build Catalina or Catalyst, and also to execute the various build_all 
scripts in the release. See the section called Catalina and make below.

To create Windows Start Menu entries, open a Windows command shell (i.e. 
cmd.exe) with Administrator privileges, then cd to the Catalina installation 
folder. Then execute the command catalina_shortcuts optionally specifying the
name of the Start Menu entry to create (in quotes). For example: 

   catalina_shortcuts "Catalina 8.8". 

If you do not specify a name then "Catalina" will be used. Then you can start
either a Catalina Command Line or Catalina Geany from the Windows Start Menu. 
Also, the Start Menu will contain links to the Catalina Documents.

Linux Precompiled Package
-------------------------

If you downloaded a Linux release package (e.g. Catalina_8.8_Linux.tar.gz)
then the package will contain executables built for a recent Debian release 
(currently Debian 12). Simply open a Terminal window, cd to the directory
where you installed Catalina and enter (note the back quotes):

   export LCCDIR=\`pwd\`
   source use_catalina

The use_catalina script will also check whether the Catalina binaries have
been installed, and also whether there is a version of make installed.
While make is not required to use the Catalina compiler, it is required
to build Catalina or Catalyst, and also to execute the various build_all
scripts in the release. See the section called Catalina and make below.

Then you can either use Catalina directly from the command-line or enter 
catalina_geany to use the Catalina Geany IDE. However, if the pre-built 
Catalina executables do not work on your Linux installation, refer to the
next section on installing it manually.

Linux Manual Install
--------------------

If you cloned the Git repository or downloaded it as a compressed file and 
then uncompressed it then you must always rebuild Catalina from source. 
Follow the Linux instructions in the BUILD.TXT document in the main Catalina 
installation folder to build Catalina. This document also has instructions on
setting Catalina up for use.

Raspberry Pi OS Install
-----------------------

If you cloned the Git repository or downloaded it as a compressed file and
then uncompressed it then you must always rebuild Catalina from source.
Follow the Raspberry Pi instructions in the BUILD.TXT document in the
main Catalina installation folder to build Catalina. This document also 
has instructions on setting Catalina up for use.

Catalina and make
-----------------

While Catalina does not require make to just use the C compiler, it is 
required to rebuild Catalina, Geany and Catalyst from source, and is also 
used by catalina_geany, and also various Catalina scripts such as the 
build_all scripts in the Catalina\demos directories. 

The use_catalina script will warn if make is not installed.

Linux will usually have make installed. If it does not, use the 
appropriate package manager to install it.

Windows does not have a native version of make. The GNU version can be 
installed either by installing Cygwin, MinGW, MSYS2 or GNuWin32, but the 
recommended method is to execute the following in a Command Line window
(requires an active internet connection):

winget install ezwinports.make

Note that this installation only has to be done once, but that the current
Command Line window will have to be closed and a new one opened for the 
installation to take effect.

More Information
----------------

The documents Getting Started with Catalina and Getting Started with 
the Catalina Geany IDE for tutorial information on using Catalina.

See the other Catalina documents for more detailed information on various
Catalina components.

Changes in this release
=======================

The following are the changes that have been made in this release of Catalina. 
If you have not used a previous release of Catalina, you can skip the rest of
this README and instead go straight to the Catalina tutorial documents. 

For a complete list of all changes, see the "Catalina Release History" in the
documents folder.

New Functionality
-----------------

1. On all Propeller 2 boards, the Parallax HyperFlash/HyperRAM add-on board 
   is now configured to use pin 0 by default rather than pin 16. This change 
   was made because pin 0 allows a wider range of clock frequencies to be 
   used on most boards, allowing (for example) the self-hosted version of 
   Catalina itself to be compiled at 300Mhz. To accommodate the change, the 
   VGA base pin has been changed to pin 16 and the USB base pin to pin 24. 

2. A new utility to test the delay setting used for the PSRAM and HYPER RAM 
   drivers has been added in the file /demos/p2_ram/delay.c. This utility can
   be used to verify that the current delay setting (configured in the platform
   configuration file) works across a selected range of clock frequencies.
   See the README.TXT file in that folder for more details.

3. Add a -Q option to the catalina command, which can also be specified by 
   defining the Catalina symbol QUICKFORCE (e.g. -C QUICKFORCE), to force a 
   Quick Build. This option is similar to the -q option except that it will 
   re-build the target file even if one already exists. If the target file 
   does not exist, then the -Q option has the same effect as the -q option.

4. For the Propeller 2, Catalyst can now be built for the P2 Edge to use
   either the PSRAM (if installed - i.e. the P2-EC32MB) or the HyperRAM
   add-on board (on base pin 0 by default). To specify that Catalyst and
   associated utilities should use the HyperRAM rather than on-board PSRAM, 
   specify HYPER when building it using the build_all script. You can also 
   specify PSRAM to use the PSRAM on the P2-EC32MB, but this is not necessary
   since this is the default if HYPER is not specified. If specified, HYPER 
   or PSRAM should be the second parameter. For example:

     cd demos\catalyst
     build_all P2_EDGE SIMPLE VT100 OPTIMIZE MHZ_200
or 
     cd demos\catalyst
     build_all P2_EDGE PSRAM SIMPLE VT100 OPTIMIZE MHZ_200
or
     cd demos\catalyst
     build_all P2_EDGE HYPER SIMPLE VT100 OPTIMIZE MHZ_200

   The catalyst build scripts have been amended to facilitate building for
   the P2 Edge demos using either HYPER or PSRAM by adding a new script 
   called 'build_p2' which accepts one or two parameters - the platform and 
   (optionally) the type of XMM RAM to use. Do not specify any other options.
   For example:

      build_p2 P2_EDGE         <-- for P2_EDGE using on-board PSRAM
      build_p2 P2_EDGE PSRAM   <-- ditto
      build_p2 P2_EDGE HYPER   <-- for P2_EDGE using HYPER RAM add-on board
      build_p2 P2_EVAL         <-- for P2_EVAL using HYPER RAM add-on board
      build_p2 P2_EVAL HYPER   <-- for P2_EVAL using HYPER RAM add-on board
      build_p2 P2_EVAL PSRAM   <-- will generate an error (not supported)

   This script will build two ZIP files - one that uses the SIMPLE serial
   HMI option named for the platform (e.g. P2_EDGE.ZIP) and one that uses 
   the VGA HMI option (e.g. P2_EDGE_VGA.ZIP). Note that the 'p2_edge' and 
   'p2_eval' scripts have now been removed, but the same function can be
   achieved using the new 'build_p2' script. Also note that  the 'build_demos'
   script still only builds demos for the P2_EDGE using PSRAM and for the 
   P2_EVAL using HYPER RAM - but building for the P2_EDGE using HYPER RAM 
   instead can be done with the following command:

      build_p2 P2_EDGE HYPER

5. Added a new demo (in the folder demos/sd_cache) to provide an example of 
   how to build a local custom version of the Catalina C library to implement
   some platform-specific functionality, such as (in this case) enabling the
   PSRAM-based SD card cache. This folder also contains a test program that 
   can be used to demonstrate the SD cache. See the README.TXT file in that 
   folder for more details.

6. Removed the file demos/catalyst/README.SMM_Loader. The information it
   contained has been added to the Catalyst Reference Manual.

Other Changes
-------------

1. Fixed an issue with Catalina only supporting 200Mhz when the HyperRAM 
   add-on board is used on the P2 Evaluation board. The platform configuration
   files (target/p2/P2EVAL.inc and also target/p2/P2EDGE.inc) have been 
   updated to disable the use of Fast Reads (HYPER_FASTREAD) and also modify 
   the RAM read delay (HYPER_DELAY_RAM). Note that the default delay (10)
   works from 150 to 260Mhz, but outside that range it may need to be adjusted.
   The new utility (demos/p2_ram/delay.c) included in this release can be used
   to verify the specified delay works across a range of clock frequencies. 
   See also the platform configuration file (e.g. P2EVAL.inc) for more details. 
   Affected the Propeller 2 Evaluation board only.

2. Fix some non 8.3 filenames in library files:
      getrealrand.c -> getrrand.c
      hub_malloc.c  -> hmalloc.c
      registerx.e -> register.e
   Affected the Propeller 2 under Catalyst only.

3. Fix the C include file stdint.h to specifically identify Catalina as one
   of the platforms with 32 bit pointers. 
   Affected The Propeller 2 under Catalyst only.

4. Fix LCC bug in pointer comparisons which led to the compiler emitting 
   erroneous warning messages such as "overflow in converting constant 
   expression from `pointer to char' to `pointer to void".
   Affected The Propeller 2 under Catalyst only.

5. Fixed an issue with the COMPACT version of the getcnt() function on the 
   Propeller 2. Affected COMPACT mode programs on the Propeller 2 only.

6. The pre-built Catalyst demo (P2_DEMO.ZIP) was incorrectly claiming it was
   built for a P2_EVAL board (in the CATALYST.ENV file, as displayed by the 
   'set' command). It now says it was built for the P2_CUSTOM platform.
   Affected the Propller 2 only.
