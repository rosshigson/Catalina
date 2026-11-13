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

1. A new SD plugin has been added, which is faster than the old SD plugin. 
e
   It uses smart pins, so is supported on the Propeller 2 only. To use it in 
   place of the old SD card plugin, define the Catalina symbol SD2. 
   For example:

     catalina -p2 program.c -lcx -C SD2

   A demo directory (demos/sd2_plugin) is provided, which contains a speed
   test program that tests the speed of the old SD plugin, the new SD plugin,
   and the same functionality implemented as inline C/PASM. See the README.TXT
   file in that directory for more details.

2. Two new library variants have been added, which use FatFs in place of
   DosFs to access SD card file systems. This allows the used of exFAT
   partitions as well as FAT partitions, and long file names. The new 
   library variants are supported on the Propeller 2 only. To use them, 
   specify -lcx2 or -lcix2 in place of -lcx or -lcix (FatFs also requires
   one of the floating point options, such as -lm). For example:

     catalina -p2 program.c -lcx2 -lm

   Note that because FatFs requires the int64 functions, these are built 
   into the new library variants, so it is unnecessary to add -lint64 when
   using them - doing so will result in the relevant functions being multiply
   defined.

   Note also that both FatFs vs DosFs work with either the old or new SD card 
   plugins (see point 1). This means that there are now four combinations that
   can be used when specified for Propeller 2 programs that use the SD card. 
   For example:

     catalina -p2 program.c -lcx        <-- use DosFs and old SD plugin
     catalina -p2 program.c -lcx -SD2   <-- use DosFs and new SD plugin
     catalina -p2 program.c -lcx2       <-- use FatFs and old SD plugin
     catalina -p2 program.c -lcx2 -SD2  <-- use FatFs and new SD plugin

   DosFs will remain supported for compatibility with the Propeller 1 (which 
   does not currently support FatFs), and also because in most cases DosFs is
   both smaller and faster than FatFs.

   Similarly to DosFs, there are two ways FatFs can be used. The first is
   by linking to the FatFs library variants, but FatFs can also be compiled
   and used "stand-alone". Examples of this are provided in the folders
   demos/fatfs and demo/sd2_plugin. There are two main reasons why a 
   stand-alone version of FatFs might be preferable to the one in the 
   Catalina libraries (which has been configured to match DosFs as closely 
   as possible). These are:

   - To use different FatFs configuration options (typically, specified in 
     the file ffconf.h)

   - To use a different logical volume table to the one used by the Catalina
     library functions (typically, contained in vol2par.c).

   The demos/sd2_plugin folder contains a stand-alone version of FatFs so
   that it can compile a demo program (fftime) that shows a possible way
   of adding real time stamps to FatSd. The demos/fatfs folder contains an
   example (testpar0) of both using the version of FatFs built-in to the 
   Catalina library, and the same program (standalone_testpar0) compiled 
   using the stand-alone version of FatFs in this directory.

3. FatCat has been added. FatCat is a version of Catalyst core utilities 
   that uses FatFs instead of DosFs, so it can use exFat format SD cards. 
   For more details see the README.TXT file in the demos/fatcat folder.


Other Changes
-------------

1. The Catalyst cp and mv commands will now not delete the target file (if
   it exists) before moving or copying files unless the -f command line
   option is added.

2. The time demos (in the folder demos\time) were using a hardcoded pin number
   for the RTC add-on board. These programs now correctly use the pin numbers
   defined in the platform configuration files.

3. The Service definition SVC_SD_IOCTL has replaced SVC_SD_BYTE_IO, which was
   never used. This service is now used to request low-level IOCTRL services
   from the SD and SD2 plugins.

4. The file lut_exec.h contained some errors that prevented it being used in
   memory models other than NATIVE. It should now also work in COMPACT and
   TINY mode programs.

5. A new utility service function _long_service_3() has been added, for
   invoking services that accept three long parameters, which the Propeller 2
   SD card plugins now do.

6. The stdio internal function _close() was not correctly allowing for the 
   possibility that the Hub malloc functions were in use.

7. p2asm had a bug that could cause a segmentation fault on Linux when 
   reporting errors in the PASM code. Affected Linux only.

8. The old SD card plugin  (cogsd.t) has been modified slightly to implement 
   the same IOCTL functions as the new SD card plugin (cogsd2.t). Previously, 
   these functions were simulated in the support code as required. Adding
   them to the plugin allows both the old and new SD card driver to be used 
   with FatFs interchangeably.



