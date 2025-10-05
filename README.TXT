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

1. Cake is now included as a component of Catalina. Cake is a preprocessor
   that can take C99, C11 or C23 source programs and translate them to C89,
   suitable for compiling with Catalina. 

   Eventually, Cake may be fully integrated into Catalina, but at present it
   is a separate component that must be invoked manually to convert a C99 (or 
   C11 or C23) program to C89, which can then be compiled with Catalina as 
   normal. A demo C99 program called hello_99.c is provided. To convert this 
   to C89 and compile it with Catalina, use Cake first and then compile the 
   result with Catalina as normal. For example (on the Propeller 2):

      cake hello_99.c -o hello_89.c
      catalina -p2 -lc hello_89.c

   See the file source\cake\README.TXT for a brief introduction to Cake and
   how to use it with Catalina. See the Cake manaul in source\caka\manual.md
   for full details on Cake.

2. Increased the maximum size of a string cpp can process from 4096 to 8192 
   bytes. This was required for Cake support.

3. Added va_copy macro to stdarg.h, and a new program to demonstrate its use
   (demos/examples/ex_va_copy.c). This was required for Cake support.

4. Added minimum and maximums for long longs and unsigned long longs, and the 
   ability for CPP to parse constants of the form ddddLL or ddddULL. Currently,
   long longs are the same size as longs and unsigned long longs are the same 
   size as unsigned longs, but some programs (like Cake) require that these 
   are explicitly supported.

5. Added a dummy wchar.h header file, which (at present) defines wchar_t but 
   does nothing else. This was required for Cake support.

6. Added an implementation of asprintf, vasprintf, snprintf and vsnprintf 
   to stdio, and a new program to demonstrate their use 
   (demos/examples/ex_snprintf.c). This was required for Cake support.

7. Added the ability for printf and family to process z or t format
   specifiers - e.g. %dz, which means to print/scan something of size size_t, 
   or %ut, which means to print/scan something of size ptrdiff_t, and a new 
   program to demonstrate them (demos/examples/ex_printf_tz.c). These format 
   specifiers were introduced in C99, but some C89 programs assume this 
   functionality exists. Note that these work only in the standard C stdio 
   libraries (i.e. libc, libci, libcx, libcix) but not in the tiny I/O 
   library (libtiny). This was required for Cake support.

8. Two new functions for creating directories have been added:

      mkdir(const char *name, mode_t *mode);
      mkdirr(const char *name, mode_t *mode);

   The mode parameter is not currently used, but is included for compatibility
   with other C compilers. These new functions are defined in sys/stat.h, and 
   the type mode_t is defined in the new include file sys/types.h for the same
   reason. Equivalent functions _mkdir and _mkdirr are defined in fs.h.
   This was required for Cake support.

   A new program to demonstrate the functions is included in 
   demos/file_systems/test_mkdir.c

   The mkdir function creates only the leaf directory - e.g. mkdir "a/b/c" 
   will make only directory "c" assuming that "a/b" already exist - whereas 
   mkdirr "a/b/c" will make directory "a" if it does not exist, then "a/b" 
   (ditto) then "a/b/c". If the functions succeed they return zero, and if 
   they fail (e.g. because a directory that was expected to exist does not, 
   or that was not expected to exist already does) then they return -1.

9. Added definitions of EOVERFLOW and EDEADLK to sys/errno.h. These are not
   used by Catalina, but are expected to be defined by some C programs. This
   was required for Cake support.

10. Added definitions of HUGE_VALF and HUGE_VALL. These are not used by 
    Catalina, but are expected to be defined by some C programs. This was
    required for Cake support.

11. A version of strdup and strndup has been added to the C libraries.
    These are defined in the include file string.h as:

       char *strdup(const char *_s);
       char *strndup(const char *_s, size_t _n);

    Some Catalina components and demo programs had their own versions of 
    strdup and/or strndup which have now been replaced with the library
    versions. This was required for Cake support.

12. Catalina's version of stdbool.h was defining bool to be unsigned int, but
    was not also defining _Bool. Now it defines both as unsigned char, which
    is intended to make Catalina more compatible with C99 onwards for programs
    compiled using Cake. However, this may break some existing C89 programs 
    which expect type bool to be compatible with bit-fields (i.e. to be of an 
    integer type) - so stdbool.h will revert to the previous definitions of 
    bool and _Bool if the C symbol __INT_BOOL__ is defined (e.g. using -D on 
    the catalina command line). For example:

       catalina my_program.c -lc -D__INT_BOOL__

13. Catalina does not support 64 bit integers, but LCC does accept the 
    declaration of long long and unsigned long long, and so some programs 
    will expect it to support them and therefore also expect the types and 
    values associated with them (such as INT64_MAX and UINT64_MAX) to be
    defined. The stdint.h include file has been modified to define 64 bit 
    types and values but make them all the same as 32 bit types and values. 
    This makes programs (like Cake) work, but may confuse other programs 
    which assume that if these values are defined then 64 bit integers are 
    supported. 

Other Changes
-------------

1. Some of the values of the fprintf and fscanf format macros defined in 
   inttypes.h were incorrect. Affected Windows, Linux and Catalyst.

2. The library functions sprintf and vsprintf were being limited to writing 
   up to 32767 characters in each call. This limit has been increased to 
   INT_MAX (2147483647) characters. Affected Windows, Linux and Catalyst.

3. The Catalyst build_demos and build_p2 scripts were not working under 
   Linux, leading to missing files in the ZIP files they created. Affected 
   Linux only.
