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

1. Lua 5.5.0 has now been included in this release. However, Lua 5.5.X is not 
   yet mature or stable enough to replace Catalina's fully integrated 
   version, which remains at 5.4.X. However, Lua 5.5.0 is fully functional 
   when used stand-alone, apart from the capabilities enabled by defining the 
   ENABLE_PSRAM or ENABLE HYPER Catalina symbols when compiling Lua. Those 
   capabilities are deeply embedded in the internals of Lua 5.4.X, were 
   developed before the more general capability of using PSRAM as XMM RAM 
   was added, and are deprecated in this release. They are likely to be 
   dropped altogether in the next Catalina release.

   To build Lua 5.5.0, go to the folder demos\catalyst\lua-5.5.0 and use the
   build_all script in the same way as used to build Lua 5.4.X. For example:

      build_all P2_EDGE SIMPLE VT100 MHZ_200 OPTIMIZE

   To copy all the executables to an SD card, use the copy_all script. Note 
   that this script will supersede any existing Lua binaries and programs on 
   the SD Card. For example, if drive the SD Card is detected as drive H, the
   command to enter would be:

     copy_all h:

2. The version of Lua fully integrated into Catalina has been updated from
   version 5.4.4 to 5.4.8. There is no new Lua functionality in this update, 
   just a few Lua bug fixes. However, there have been some minor tweaks to 
   some example programs as a result, mainly the multi-processing with Lua 
   examples. This is because the changes may not affect Lua's functionality, 
   but they do sometimes affect Lua's memory utilization. The updated example
   programs now work with both Lua 5.4.X and Lua 5.5.X.

   Note that the compiled (i.e. binary) format of Lua programs has changed
   between versions 5.4.X and 5.5.X. This means that the corresponding version 
   of the lua compiler (luac) must be used. If the wrong version is used, the 
   following error message will be displayed:

     bad binary format (version mismatch)

3. There are now only two copies of the Lua 5.4.X source files in this release
   of Catalina (in previous releases there were three copies). The Lua source 
   files that used to be in demos/catalyst/lua/5.4.X are now copied from 
   source/catalina/lua-5.4.X when Catalyst is compiled using the build_all 
   scripts, and deleted again by the clean_all scripts (similar to the way 
   the self-hosted version of Catalina itself is built). Note that when the 
   Windows installer is used to install Catalina, this means that to compile 
   Catalyst from source, the Catalina sources MUST be installed. This option 
   is now the default.

   A copy of the Lua 5.4.X source files still exists in the library source 
   tree. This duplication is likely to remain so that the stand-alone version
   of Lua can be updated independently from the integrated version.

   Note that when Lua is built as part of Catalina (it is used for scripting
   in both payload and blackbox) the standard Lua Makefiles are used. When it
   is built as part of Catalyst, the Makefiles in the src folder are used 
   (Makefile.Catalina on Linux, or Makefile.Catalina.mgw on Windows).

4. Partly in anticipation of Lua 5.5.X becoming Catalina's default integrated
   version of Lua, the multiple different versions of the Lua initialization 
   file (variously called linit.c, iinit.c or xinit.c) which enabled different 
   Lua libraries in previous releases have all been replaced with a common 
   version (linit.c). In this release, this file must still be present and 
   compiled in the same folder as the Lua application, but this will change 
   in Lua 5.5.X, which uses a different initialization process). 
   Specific libraries to be enabled or disabled are now specified on the 
   Catalina command line (or in a catapult pragma) as follows:

     propeller  always enabled
     hmi        always enabled
     threads    enabled by -lthreads
     serial     enabled by -lserial2 or -lserial8
     wifi       enabled by -lwifi
     service    enabled by -C LUA_SERVICE
     linenoise  enabled by -C LUA_LINENOISE

     If memory is very tight, the optional debug, utf8 and os libraries can 
     be disabled by -C LUA_NO_OPT, and if only integer math is required then
     the math library can be disabled by -C LUA_NO_MATH - but neither of 
     these are used in any of the demo programs, and doing so is deprecated 
     because these options will not be available when Lua 5.5.X becomes the 
     default version of Lua.

Other Changes
-------------

1. There was a bug in the Multiprocessing versions of Lua (i.e. mlua and
   mluax) that may have led to a program lock-up when multiple factories were 
   in use (for example, it may have occurred when executing the example 
   programs ex9.lua or ex12.lua). Affected the Propeller 2 only.

2. There was a bug in Catalyst that limited commands to 8 characters when
   no extension was specified. So (for example) the program "bin/dbasic.bin" 
   would be correctly found and executed if the command was entered as:

      dbasic
      dbasic.bin
      bin/dbasic.bin

   but NOT if entered as:

      bin/dbasic

   Instead, "cannot open file BIN/DBASIC" would be displayed.
   Affected the Propeller 1 and Propeller 2.

3. Some Lua programs have been updated to allow for the use of either Lua 5.4 
   or Lua 5.5. In particular, Lua 5.5 requires different parameters to the 
   collectgarbage() function. The following code takes the lua version into 
   account, and can be used set a specific garbage collection mode and/or 
   parameters in a way that is backwards compatible:

      lua_version = tonumber(string.sub(_VERSION, 5, 7));
      if lua_version and lua_version < 5.4 then
        -- default mode is incremental, so just set parameters ...
        collectgarbage("setpause", 150);
        collectgarbage("setstepmul", 500);
      elseif lua_version and lua_version < 5.5 then
        -- incremental mode is optional, so set it with parameters ...
        collectgarbage("incremental", 150, 500);
      else
        -- mode and parameter setting now separate in Lua 5.5 ...
        collectgarbage("incremental");
        collectgarbage("param", "pause", 150);
        collectgarbage("param", "stepmul", 500);
      end

   Affected the Propeller 1 and Propeller 2.

4. To minimize Lua's use of memory, the threads functions wait() and workers()
   also used to do garbage collection in previous releases - this was done to
   collect garbage after workers and threads had been initiated. However, a 
   better solution is to do this explicitly if needed, and also for threads
   themselves to be able to perform garbage collection if required, so a new 
   "thread safe" function for invoking the Lua garbage collector has been 
   added to the threads module. The threads.gc() function can combine the 
   functionality of collectgarbage() and threads.sbrk() (which are often used 
   together to maximize free Lua memory and also defragment the C heap) into 
   one function. See the updated "Lua on the Propeller 2 with Catalina" 
   document for more details. The example program ex9.lua demonstrates the 
   new function. If backwards compatibility is necessary, Lua code such as 
   the following can be used to detect if the threads.gc() function is 
   available or not:

      if threads.gc then
         threads.gc(1) -- also invokes sbrk(true)
      else
         -- note: not guaranteed thread safe ...
         collectgarbage()
         thread.sbrk(true)
      end

   Affected the Propeller 2 only.

5. Upgrading to Lua 5.4.8 has made some programs that used the integrated
   version of Lua (i.e. the version in the Catalina library) slightly larger,
   which may cause the program to run out of Hub RAM. For example, the Aloha 
   WiFi RPC demo program sluarfx.c is now too large to execute correctly if
   compiled in NATIVE mode, and so has been replaced by the functionally 
   identical program slaurcx.c which instead uses COMPACT mode.

   This change may affect other programs. Affected the Propeller 2 only.

6. The 'Aloha from Lua' document mentioned that the rpc_network table could
   be in the common.lua module, but in the RPC demo programs the table was
   instead duplicated in the server.lua, remote.lua and serverbg.lua modules.
   While this is technically ok, it complicates the process of configuring 
   the demo programs. Now, the document and all the demo programs have been 
   made consistent, with only one copy of the rpc_service table in the 
   common.lua module. Affected the Propeller 2 only.

7. There were a couple of issues with the WiFi version of ALOHA:

    (a) There was an undocumented limitation on the size of an WiFi RPC
        request. The code currently limits such requests to a maximum of 512 
        bytes (the RPC response can be larger). This limit caused one of the 
        demo programs (i.e. the 'complete' demo) to work with the serial 
        version, but not the WiFi version because the string used was too 
        long. The example has now been corrected to work with both, and the 
        'ALOHA from Lua' document also has been updated. This limit may be 
        increased in a future release.

    (b) The Lua dispatcher could fail to retrieve all data returned by an
        RPC call when the response consisted of multiple data packets.

    Affected the Propeller 2 only.
