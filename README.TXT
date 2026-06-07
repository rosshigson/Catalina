Overview
========

Catalina is an ANSI C compiler, plus C libraries and utilities, for the 
Parallax Propeller family of microcontrollers. Catalina natively supports 
C89, and also supports C99, C11 and C23 extensions using the Cake 
preprocessor.

Catalina supports both internal and external memory models on both the 
Propeller 1 and 2, for program sizes up to 16Mb.

Catalina runs under Windows, Linux, macOS (including Apple Silicon), the
Raspberry Pi OS and also its own self-hosted development environment
(Catalyst).

Catalina supports command-line use (Windows, Linux, macOS, Pi and Catalyst)
and an Integrated Development Environment based on Geany (Windows, Linux and
Pi).

Catalina supports the Lua programming language, either for stand-alone Lua 
program development, or for Lua embedded in C programs.

Catalina supports multi-threaded, multi-processor and multi-model programming.

Catalina supports lightweight threads as well as Posix threads and Lua threads.

Components
==========

The main components of Catalina are:

   catalina    : The command-line C compiler (Windows, Linux, macOS, Pi
                 and Catalyst)

   catalina_geany : An Integrated Development Environment (Windows, Linux, 
                    and Pi) based on Geany.

   catalyst    : An SD card based program loader and self-hosted development 
                 environment for the Propeller 1 and Propeller 2

   cake        : A C preprocessor that converts programs with C99, 
                 C11, C23 and CYY extensions to C89. It is integrated with
                 catalina but can also be used stand-alone (Windows, Linux,
                 macOS, and Pi)

   catapult    : A utility for building multi-model C programs (Windows,
                 Linux, macOS, and Pi)

   payload     : A serial program loader and simple terminal emulator (Windows, 
                 Linux, macOS and Pi)

   comms       : A full-featured VT100 terminal emulator (Windows only)

   telnet      : A full-featured telnet client (Windows only)

   blackbox    : A C source level debugger (Windows, Linux, macOS, and Pi)

   parallelize : A utility for building multi-processor C programs (Windows, 
                 Linux, macOS, and Pi)

   spinnaker   : A propeller 1 Spin compiler/assembler (Windows, Linux,
                 macOS, and Pi)

   p2asm       : A propeller 2 assembler (Windows, Linux, macOS, Pi and
                 Catalyst)

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

1. Cake has been updated to 0.13.34, which completes Cake support for C99,
   C11, C17 and C23, and enhances support for CXY. For full details, refer 
   to the Cake documents in source/cake and source/cake/docs.

Other Changes
-------------

1. The document 'Getting Started with Catapult' has been updated to note that 
   the 'stack' size attribute also includes heap, if dynamic memory allocation
   (i.e. malloc() etc) is used by the secondary program.

2. The Catalina Binder (bcc) now sorts files into alphabetical order before
   processing - this eliminates any differences in the final output because
   Windows and Linux use a different sort order when files are specified 
   using wildcards (e.g. bcc *.s).

3. The Linux version of Catalina was generating code that was different to
   the Windows version - both were correct, but the Linux code was missing
   some code optimizations, which meant code compiled on Linux could be 
   slightly different in size to code compiled on Windows. This made it 
   harder to build multi-model programs (e.g. using catapult) which depend 
   on having the address of the secondary program embedded in the code
   of the primary program. Typically it meant the programs would have to be 
   edited to change the address when compiled on Linux. Now both Windows and 
   Linux generate the same code, which means multi-model programs should have
   the same addresses on all platforms.
   Affected Catalina on Linux only.

4. An older version of Lua (5.4.4) has been removed from the Catalina 
   libraries. Lua version 5.4.8 is now the only supported version in the
   libraries, but a stand-alone version of 5.5.0 is also included.

5. Fixed some issues with using the BlackBox debugger on programs compiled 
   using Cake (via -C99 etc). BlackBox may have reported that it could not 
   find the source files because the #line information generated by Cake was
   understood by LCC, and this affected the debugging information (i.e. stabs)
   output from LCC, which is used by BlackBox.
   Affected the Propeller 1 and 2 on Windows and Linux.
