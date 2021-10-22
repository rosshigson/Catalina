This directory contains Lua (a scripting language) for Catalyst/Catalina. 

Lua requires a Propeller platform with an SD card and 512kb of XMM memory.

To make lua work on the Propeller required a few minor source changes due to
a difference in the way macros are processed, and a new Makefile.


BUILDING LUA
============

To build Lua requires both Catalina and MinGW to be installed. There is a make 
file (called Makefile.Catalina) which can be used directly from the src 
directory. 

However, the simplest way to build Lua is to use the 'build_all' script, 
specifying the platform any necessary options on the command line:

For example:

   build_all HYBRID
or
   build_all DRACBLADE
 
If you do not want to use the default HMI option for the platform, you can 
override it on the command line.  

For example, to build lua to use the PC HMI on various platforms:

   build_all DRACBLADE PC
or
   build_all RAMBLADE PC
or
   build_all TRIBLADEPROP CPU_2 PC

For the morpheus platform you must build lua to use a proxy driver. A special
batch file is provided for use under Windows which builds both lua and the
required proxy driver:

   build_morpheus

Note that you may need to edit the above batch file if Catalina is not 
installed in the default location ("C:\Program Files (x86)\Catalina"). 

USING Lua
=========

To run lua, copy the following files to a FAT16 SD card, renaming them to fit
into 8.3 filenames. The following is recommended:

   src\lua.binary     -> LUA.BIN
   src\luac.binary    -> LUAC.BIN
   src\proxy.binary   -> PROXY.BIN (Morpheus only)
   test\hello.lua     -> HELLO.LUA
   test\factorial.lua -> FACT.LUA
   test\sort.lua      -> SORT.LUA

A script to do this (copy_all) is provided. 

The program 'lua' is a standalone version of Lua, whereas 'luac' is the Lua
compiler. Lua can be loaded with Catalyst, or with the Catalina Generic SD 
card loader (both included with Catalina). Morhpeus has special requirements 
for loading the standalone Lua program (see below) but on other platforms just 
type:

  lua [ filename [ parameters ] ]

For example:

  lua hello.lua
or
  lua fib.lua 20

You can also just enter:

  lua 

and then use the Lua 'dofile' function to execute a Lua script - for example:

> dofile("hello.lua")

If the script expects arguments, they must be set up beforehand. For example:

> arg={}               <-- declare a table of arguments
> arg[1]=20            <-- assign values (arg[1] is the first program argument)
> dofile("fib.lua")    <-- execute a script that expects arguments


For more help with Lua, see the Lua Reference Manual (located in the doc 
folder).


A NOTE ON NUMBERS IN Lua
========================

By default, Lua uses the type "double" for all numbers. On platforms where
doubles are 64 bit, this gives sufficient precision for integers up to 2^52.

However, on the Propeller all floating point variables are only 32 bits, so 
integer numbers above 2^23 cannot be represented exactly. Lua allows the basic
numeric type to be an integer - this may be more appropriate for some programs
as it would allow accurate integers up to 2^32. See the Lua header files for 
details on how to redefine the Lua numeric type. Of course, Lua will need to 
be recompiled.

SPECIAL NOTES FOR MORPHEUS
==========================

On Morpheus, you must load both the Lua program and the proxy program. Also,
when loaded this way, Lua cannot accept parameters. To run it enter the 
commands:

  boot_2                <- load the boot loader into CPU #2
  @                     <- to select CPU #2 for next load
  lua                   <- load the client into CPU #2
  proxy                 <- load the server into CPU #1


