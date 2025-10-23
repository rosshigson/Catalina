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

1. Cake is now fully integrated into Catalina. While Cake can still be used as
   a stand-alone preprocessor that can take C99, C11 or C23 source programs 
   and translate them to C89 suitable for compiling with Catalina, it can
   now also be used in place of the default Catalina preprocessor (cpp) by
   using the -C option to specify the appropriate C standard using a 2 digit 
   numeric value. For example:

      catalina -C99 -lci hello_99.c
      catalina -C 23 -lci hello_99.c

   Not specifying any C standard, or specifying -C89 or -C90 means Catalina 
   will use cpp as the C preprocessor, whereas specifying -C94, -C95, -C99, 
   -C11, -C17, -C18 or -C23 will use cake as the C preprocessor instead. 

   Other than determining whether cpp or cake is used, there is currently no
   difference between the various standards except that cake will define the 
   symbol __STDC_VERSION__ to be 202311L (no matter which C standard is 
   specified) but this symbol will not be defined when using cpp. However, 
   eventually cake may behave differently according to which standard is 
   specified.

   Note that the use of cake as a preprocessor is currently not compatible 
   with the Catalina debugger or the Catalina parallelizer. If -g or -Z is 
   specified along with -CXX (where XX != 89 or 90) then Catalina will issue
   a warning and ignore the option. The reason for disallowing this is that
   Cake may re-write the C program, which means the line numbers will not 
   match the original program (which would interfere with the use of the 
   debugger) and/or it may re-arrange lines in the C source program (which
   would interfere with the operation of the parallelizer). However, Cake 
   can be used stand-alone to first (for example) convert a C99 program to 
   C89, which can then be edited, modified and compiled with Catalina using
   the debug or parallelizer options.

   Cake is fully compatible with catapult - simply add the appropriate C
   standard (e.g. -C99) to the appropriate catapult pragma (typically, it
   would be added to the "common" pragma).

   Cake is fully compatible with geany - simply add the appropriate C 
   standard (e.g. -C99) to the Catalina Options field in the "Project->
   Properties" dialog box.

   Cake is fully compatible with the optimizer - simply add the appropriate 
   option (e.g. -O5 or -C OPTIMIZE). However, note that Cake may re-write 
   the C code and (similar to the optimizer itself) this may sometimes 
   result in it omitting code that it thinks is not used by the program (e.g. 
   because it appears only in the string arguments to "PASM" statements, which
   are not understood by either Cake or the Optimizer). In such cases, it may 
   be necessary to add some dummy C code to prevent the code from being 
   omitted (for an example, see demos\inline_pasm\test_inline_pasm_7.c).

   Note that Cake is much more rigorous in parsing C source code than cpp, 
   and it may issue errors, warnings or information notes in cases where cpp 
   simply passed the result silently on to the compiler. Also, there may be 
   identifiers that were valid in a C89 program that are not valid according 
   to later C standards, so a valid C89 program may not compile if cake is 
   used. However, the Catalina and Catalyst demo programs** have been updated 
   to compile correctly using EITHER cpp OR cake, albeit sometimes generating
   additional warning messages when cake is used.

   ** All programs except for the Catalyst jzip and xvi (aka vi) programs.
   While these programs COULD be updated to C99, they both use old-style C 
   function definitions extensively, which were dropped in C23 and which 
   Cake does not support. These programs remain as C89 only programs and 
   must still be compiled using -C89, -C90 or with no C standard specified.
   The same is currently true of Catalina itself and the Catalina C library,
   except that the C library include files have been updated where necessary
   so that they can be used with any of the C standards.

   A section on Cake has been added to the Catalina Reference Manuals.

Other Changes
-------------

1. The "Catalina Command Line" option on the geany build menu was not working
   in Windows 11. It has now been changed to:

      cmd.exe /k "call ""%LCCDIR%\\use_catalina"" && cd %p"

   Note that this command must be entered with a double backslash (i.e \\) 
   when manually edited in %LCCDIR%\catalina_geany\data\filedefs\filetypes.c
   but as a single backslash (i.e. \) when modified using the geany
   "Build->Set Build Commands" menu & dialog box. 
