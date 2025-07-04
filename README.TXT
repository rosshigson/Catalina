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

If you used a Windows Installer package (e.g. Catalina_8.7_Setup.exe) to 
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
directory (e.g. from Catalina_8.7_Windows_binaries.zip into Catalina\bin or 
from Catalina_8.7_Windows_Geany_binaries.zip into Catalina\catalina_geany).
    
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

   catalina_shortcuts "Catalina 8.7". 

If you do not specify a name then "Catalina" will be used. Then you can start
either a Catalina Command Line or Catalina Geany from the Windows Start Menu. 
Also, the Start Menu will contain links to the Catalina Documents.

Linux Precompiled Package
-------------------------

If you downloaded a Linux release package (e.g. Catalina_8.7_Linux.tar.gz)
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

1. The Propeller 2 COMPACT kernels have been updated to enable using the FIFO
   by default. Enabling the use of the FIFO means the kernel will use RDFAST 
   and RFLONG instructions in place of RDLONG to read instructions. This can 
   result in a typical speed improvement between 4% and 7%, but it means the 
   FIFO cannot be used for other purposes by the C program. To disable the 
   use of the FIFO (essentially reverting to pre-8.7 behaviour) define the
   Catalina symbol NO_FIFO (e.g. -C NO_FIFO). For example:

      cd demos\benchmarks
      catalina -p2 -lci -C CLOCK -p2 fibo.c -C COMPACT -C NO_FIFO

   Note that COMPACT programs that use interrupts MUST specify NO_FIFO, since
   interrupts disrupt the FIFO. 

2. The LUT_PAGE option introduced in Catalina 7.4 improved performance for
   XMM SMALL programs, but for XMM LARGE programs it sometimes reduced
   performance, so at the time it was not made the default. In this release
   it has been updated so that the performance of LARGE programs is also 
   improved by up to 25% for cache sizes above 2K, so it is now enabled by 
   default for all XMM programs. This means it is no longer necessary to 
   define the LUT_PAGE Catalina symbol, and doing so has no effect. 
   However, it can now be disabled if required (e.g. in programs that want 
   to use the LUT themselves, or have only 2K available for the cache) by
   defining the new Catalina symbol NO_LUT (e.g. -C NO_LUT). For example:

      cd demos\benchmarks
      catalina -p2 -lci -C CLOCK -p2 fibo.c -C LARGE -C NO_LUT

   Note that for programs that have only a 1K cache, the CACHE_LUT option
   is recommended, and if this is specified the LUT is used to hold the
   entire cache instead of just a 1K page. Also note that the other options 
   introduced in Catalina 7.4 - CACHE_PINS and FLOAT_PINS are still 
   available and can be used with or without using the LUT. They are not 
   enabled by default since they require suitable pins to be available, but
   can offer additional speed improvements of around 10%. See the platform
   configuration files (e.g. P2EVAL.inc, P2EDGE.inc or P2CUSTOM.inc for
   more details on allocating suitable pins).

   Using the LUT, CACHE_PINS and FLOAT_PINS options can improve the 
   performance of benchmark programs (e.g. Whetstone) by up to 30%, and 
   real-world programs (such as the self-hosted version of Catalina itself) 
   by about 25%.

3. The COMPACT Catalina code generator has been updated to emit different
   alignl options in different circumstances:

      alignl       : align a long as required for both the P1 and P2
      alignl_p1    : align a long as required for the P1 only
      alignl_debug : align a statement for debugging (i.e. when -g is used)
      alignl_label : align a label

   On the Propeller 1, these all do the same thing, which is to align the 
   next code or data element  on the next long (4 byte) boundary. On the 
   P2 they also currently all do the same thing, but this may be modified 
   in a future release since the Propeller 2 does not always require code 
   or data to be aligned on long (4 byte) boundaries.

Other Changes
-------------

1. A known bug occurs when an XMM program (LARGE or SMALL) is compiled for 
   the P2 Evaluation board (i.e. P2_EVAL) when the program uses the default 
   clock frequency (180Mhz). In this case the program may not work correctly.
   This problem occurs on some P2 Evaluation boards that use the HyperFlash/
   HyperRAM add-on board - it does not occur on the P2 Edge board, either 
   with the HyperFlash/HyperRAM add-on board, or with the on-board PSRAM. 
   This issue occurs on some Rev B boards, and may also occur on other boards. 
   The program will work correctly if 200Mhz is used as the clock frequency
   (i.e. MHZ_200), which is the default frequency used for Catalyst and 
   its programs. Affects the Propeller 2 Evaluation board only.

2. The VGA versions of the Catalyst demos would not execute correctly because
   they not being compiled with the NO_LINENOISE option. The linenoise library
   relies on the use of a VT100 compatible serial terminal emulator, which is 
   not applicable when using the VGA option. Affected the Propeller 2 only.

3. The Propeller 2 version of Catalina was erroneously executing Quick Build
   processing if both -c (compile only) and -q (quick build) were specified, 
   even though the quickbuild would fail because no binary file was generated
   by the compile. Now specifying -c causes -q to be ignored, which matches 
   the PC version of Catalina. Affected the Propeller 2 on Catalyst only.

4. The Windows create_shortcuts.bat file was not creating a link to the 
   Catalina Release History document. Affected the Propeller 1 and 2 on 
   Windows only.

5. The Propeller 2 versions of the binbuild and binstats utilities were
   not setting their exit codes, which meant Catalyst scripts could not 
   detect when they failed. Affected the Propeller 2 on Catalyst only.

6. Various README files have been removed, with the relevant information
   consolidated into one file, or else included in the various reference 
   and tutorial documents.

7. The Windows installer no longer offers the option of installing Make
   and other Gnu utilities.

