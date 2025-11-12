Overview
========

Catalina is an ANSI C compiler, plus C libraries and utilities, for the 
Parallax Propeller family of microcontrollers. 

Catalina supports both internal and external memory models on both the 
Propeller 1 and 2, for program sizes up to 16Mb.

Catalina runs under Windows, Linux, the Raspberry Pi OS and also its own 
self-hosted development environment (Catalyst).

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

1. A version of dirent.h, which defines the functions opendir(), readdir(),
   closedir() and realpath(). These functions are not part of any C standard,
   but are required by Cake.

2. Cake has been updated to version 0.12.49.

3. Catalina now disables Cake's use of colors in error and warning messages
   by default, because Geany does not support it. However, for command-line 
   or terminal emulator use, colors can be re-enabled by defining the Catalina
   symbol CAKE_COLOR, e,g, by adding -C CAKE_COLOR to the Catalina command. 
   For example:

     catalina hello_99.c -lci -C99 -C CAKE_COLOR

4. printf() (and fprintf() etc) now supports "ll" as a length specified, to
   indicate a long long - for example "%llu" indicates an "unsigned long long". 
   Note that in Catalina long longs are the same as longs, so in practice both
   "%lu" and "%llu" will now do the same thing, whereas in previous releases
   the former would have printed 100 as "100", whereas the latter would have 
   printed it as "100ul". This change was required to support Cake.

5. The Propeller 2 SD card driver (/target/p2/cogsd.t) now allows the SD card
   delay (in clock ticks) to be specified using the Catalina symbol SD_DELAY 
   during compilation. For example, to set it to zero use a command such as:

      catalina -p2 -lcx program.c -C SD_DELAY=0

   Defining the Catalina symbol NO_SD_DELAY also sets the SD_DELAY to zero,
   but can be used in build_all scripts. Using NO_SD_DELAT overrides any 
   other specified SD_DELAY.

   The default if not specified is 10ms, and the driver may not work properly
   if this delay is altered.

6. In the Catalyst demos folder (demos/catalyst) there is now a build_p2_300
   script, which builds Catalyst using a 300 Mhz clock speed (the default of
   200Mhz is still used by the build_p2 script). So for example, building
   Catalyst at 300 Mhz and with no SD_DELAY can be done with a command like:

      build_p2_300 P2_EDGE PSRAM NO_SD_DELAY

   Note that 300 baud and no SD_DELAY may not work for all programs, all SD 
   cards, or all Propeller 2 platforms.

7. Catalina no longer defines the symbols "win32", "_WIN32", "_M_IX86" "unix", 
   "i386", "linux" "__unix__", "_i386__", "__linux__", or "__signed__" 
   automatically on any platform.  Not defining these symbols may make some 
   programs either not compile, or behave differently. If any of these symbols
   are required, they can be defined on the command line (using -D). 
   For example:

      catalina program.c -D__signed=signed

8. Catalina no longer defines the C symbols "__STRICT_ANSI__" or "__STDC__" 
   automatically because this can interfere with the use of Cake as the C 
   preprocessor. Not defining these symbols may make some programs either 
   not compile, or behave differently. If these symbols are required, they 
   can be defined on the command line (using -D). For example:

      catalina program.c -D__STDC__=1

   The C symbol _POSIX_SOURCE is still defined even though Catalina is not
   fully POSIX compliant, because this symbol enables some necessary 
   definitions in the C header files. 

9. The -u option to catalina means it does not delete intermediate files.
   This is sometimes useful for debugging. On Catalyst (only) it now also 
   means to not run the pstrip utility, which 'strips' comments and blank 
   lines from the intermediate source code files (to reduce their size). 

10. Allow -C USE_COLOUR to enable Cake's use of color (i.e. in addition to 
    -C USE_COLOR) and also use the Cake option -fdiagnostics-color=never to
    disable the use of color.

Other Changes
-------------

1. The C include file limits.h (i.e. include/limits.h) was incorrectly
   defining CHAR_MIN and CHAR_MAX as if chars were signed. Since chars are 
   unsigned in Catalina, these definitions were incorrect, and have been
   changed to:

      #define	CHAR_MAX		UCHAR_MAX
      #define	CHAR_MIN		0   

   Affected Windows, Linux and Catalyst.

