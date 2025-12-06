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

1. Payload now has a 'dumb' mode, which is enabled by using the -I option
   but specifying either "dumb" or "none" as the terminal name (e.g. -Idumb 
   or -I none). In dumb mode (after download, if a file is also specified) 
   payload just echoes all characters received on the serial port to stdout, 
   and all characters received on stdin to the serial port. Dumb mode can be 
   terminated by entering TWO consecutive CTRL-D characters.

   As the name implies, in dumb mode, payload does not do any character
   processing on either input or output characters (except for detecting
   two successive CTRL-D characters) - If the Propeller program does any 
   terminal-dependent stuff (e.g. cursor movement, screen manipulation, 
   applying colors etc) this will work if that capability is implemented 
   by the terminal window in which payload is executing. In general, this 
   means many things will work quite smoothly (in Windows) using cmd.exe, 
   conhost or the terminal app, or (in Linux) in any window type derived 
   from an xterm.

   On Windows, the keyboard is assumed to be an extended ASCII keyboard, 
   and the keyboard input is mapped to that which would be generated by a 
   terminal emulator operating in vt100 mode. This is done so that programs 
   see the same keyboard input when -I dumb is specifed as they would see if
   either -i or -I vt100 was specified. This makes both the Windows Console
   Host and Terminal App behave more like a real terminal emulator in vt100
   mode when used with programs like Catalyst or the vi text editor.

2. A new batch file (ansi_mode.bat) is included to set or clear the registry 
   setting that enables processing ANSI escape codes in the Console Host 
   window (this is enabled by default in the Terminal App). To enable ANSI 
   escape code processing in Console Host enter:

      ansi_mode on

   or to disable it enter:

      ansi mode off

   Note that the setting will only affect NEW Console Host Windows, not
   the current window. To just check the current state enter:

       ansi_mode

    Because this setting is in the registry, this only has to do be done
    once, not on each login, or each time a Console Host window is opened. 
    It can be turned off again if it upsets other programs that use the 
    Console Host window.

    Enabling ANSI mode makes the new 'dumb' terminal option offered by payload 
    work correctly in a Console Host window. Otherwise ANSI escape codes (e.g. 
    used by Catalyst) work in the Terminal App, but not Console Host.

Other Changes
-------------

1. The vttest program, which is used to test vt100 compatibility, has been
   updated to the latest version. Note that this program is NOT required to
   use Catalina - it is a utility that can be used to test compatibility
   of various vt100 terminal emulators, including Catalina's terminal emulator
   (Comms.exe) as well as the Windows Console Host and Terminal App. See the 
   README file in /source/comms/vttest for more details.

2. There were two problems in the build scripts in /source/geany_bundle:

   1. The build_all script used the pacman cache. This only worked if the 
      packages had already been downloaded. Now they are downloaded on each 
      build.

   2. The option to unpack compressed packages is now --zstd, not -xz

   Affected Windows only.

3. In the blackbox debugger, calls to the funcion blackbox_close() should have 
   no parameters. This caused recent versions of gcc to throw an error. No 
   functional changes. Affected Windows only.

4. In awka, the function awka_init_parachute() was being defined incorrectly
   in error.c to accept parameters. This causes the latest versions of gcc to 
   throw an error. No functional changes. 
   Affected Windows and Linux.

5. When compiling awka, the Catalina parallelizer and the Catalina optimizer 
   with the latest version of gcc, the option -std=c99 must be added for 
   the programs to compile correctly. No functional changes.
   Affected Windows and Linux.

6. When compiling lcc with the latest version of gcc, the definition of
   _spawnvp() must be changed to match that in stdio.h for the program to
   compile correcly. No functional changes. Affected Windows and Linux.


