Overview
========

Catalina is an ANSI C compiler, plus C libraries and utilities, for the 
Parallax Propeller family of microcontrollers. Catalina natively supports 
C89, and also supports C99, C11 and C23 extensions using the Cake 
preprocessor.

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
                    and Pi) based on Geany.

   catalyst    : An SD card based program loader and self-hosted development 
                 environment for the Propeller 1 and Propeller 2

   cake        : A C preprocessor that converts programs with C99, 
                 C11, C23 and CYY extensions to C89. It is integrated with
                 catalina but can also be used stand-alone (Windows, Linux, 
                 and Pi)

   catapult    : A utility for building multi-model C programs (Windows, Linux, 
                 and Pi)

   payload     : A serial program loader and simple terminal emulator (Windows, 
                 Linux and Pi)

   comms       : A full-featured VT100 terminal emulator (Windows only)

   telnet      : A full-featured telnet client (Windows only)

   blackbox    : A C source level debugger (Windows Linux, and Pi)

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

1. Addition of Full HD VGA HMI option (Propeller 2 only). Use it by adding 
   -C HD_VGA to a Catalina command line. See the README.TXT file in 
   demos\graphic2 for more details.

2. Addition of Propeller 2 virtual graphics library (called vgraph2). Very 
   compatible with P1 graphics and vgraphic libraries. Use it by adding 
   -lvgraph2 to programs. Demo programs provided in demos\p2_vgraphics.
   See the README.TXT file in demos\graphic2 for more details.

3. The new Full HD VGA option has necessitated a change to the minimum size
   of a P2 XMM image, from 64kb to 128kb. While this will usually make no 
   functional difference, it means some existing XMM programs may have less 
   Hub RAM available, and that the Catalina 9.0 compiler itself, and various 
   utilities (notably the payload loader) are not compatible with XMM programs
   compiled by prior Catalina versions.

Other Changes
-------------

1. All the Propeller 2 platform configuration files have been modified to 
   default to pin 0 for the VGA add-on board, pin 8 for the USB Serial Host
   add-on board, pin 16 for the HYPER base pin, and pin 24 for the RTC add-on
   board. The old platform files have been retained if required, but with the
   suffix ".old" (e.g. the original P2EDGE.inc is now P2EDGE.inc.old). Using
   the new configurations is highly recommended because the old configurations
   had problems using USB ports on the old base pin of 24, and this also 
   conflicted with the RTC clock base pin. Rename the files if necessary to
   restore the old configurations. Affected the Propeller 2 only.

2. Fixed a bug in the P1 graphics library that was not always drawing triangle
   and quadrilateral shapes correctly. Affected the Propeller 1 only.

3. The word "palette" was misspelled as "pallete" in various places (e.g.
   in the vgraphic library, the function name g_pallete was used instead 
   of g_palette). Now corrected. Affected the Propeller 1 only.

4. The Catalina symbols VGA_4_COLOR and VGA_2_COLOR were sometimes used 
   in place of COLOR_4 and COLOR_2 in both the source code and documentation.
   All instances of the former symbols have been replaced with the latter.
   Affected the Propeller 1 and Propeller 2.

