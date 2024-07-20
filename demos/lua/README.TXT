This directory contains example programs that demonstrate using the version
of Lua that is now built into the Catalina C libraries. Using these libraries
simplifies the building of C programs containing embedded Lua.

There are two versions of Lua in the library - lib/lua and lib/luax, which 
are enabled by adding either -llua or -lluax to the Catalina command line.
Only one of the two libraries should be used - using both will result in
errors about symbols being re-defined.

The difference is that -llua specifies a library that includes the standard 
Lua parser, which is required by programs that want to parse or compile 
strings containing Lua scripts (such as the interactive "lua" program) whereas
the library specified by -lluax does not, and so can result in smaller
executables when building programs that want to define their own parser (or 
that do not need a parser at all, such as the non-interactive "luax" program).

Note that neither library contains the standard Lua initialization module 
(linit.c). This is because in an embedded environment (which does not support
dynamic loading of libraries, and so has to have all the necessary Lua 
libraries compiled in) it is often desirable to modify linit.c to either 
omit some of the standard libraries, or to include some additional 
application-specific ones.

This just means that linit.c must be included on the command-line when
building C programs with embedded Lua. For example, here is a command that 
might be used to compile a program called lhello.c:

   catalina -lcx -lm -llua lhello.c linit.c -W-w

The purpose of the -W-w flag in the above command is to suppress some compiler
warning that can occur during Lua compilations. For example, without it the 
above compilation would emit one or more warnings like:

   "warning: conversion from `pointer to void' to `pointer to int 
             function(pointer to incomplete struct lua_State ... is 
             compiler dependent"

These particular warnings can safely be ignored.

The following example programs are included in this directory:

   lua       - the interactive version of Lua.

   luac      - the Lua compiler.

   luax      - the Lua execution engine (for executing compiled Lua programs).

   mlua      - the interactive version of Multi-Processing Lua.

   mluax     - the Multi-Processing Lua execution engine.

   lhello    - a simple "hello, world" embedded Lua program

   lscript   - a program to execute the Lua script in file "script.lua"

There is a build_all script that can be used to build all the example
programs. Specify the platform, memory model and any other options on the 
command line. For example:

   build_all C3 TTY CACHED_1K
or
   build_all P2_EDGE
or
   build_all P2_EDGE NATIVE OPTIMIZE MHZ_200

If a memory model is not specified, then on a Propeller 1 the LARGE memory
model will be used, and on a Propeller 2 COMPACT memory model is used.

The mlua and mluax binaries will only be built for a Propeller 2 when the
COMPACT memory model is specified (or no memory model is specified, since
COMPACT is the default).

Note that the lua, luax, mlua and mluax binaries are fully functional, but 
are not the versions used when building Catalyst. This is because Catalyst
supports additional options that must be enabled at compile time, such as 
ENABLE_PSRAM and ENABLE_HYPER. Enabling these options requires the whole 
Lua source tree to be rebuilt, so Catalyst cannot use the pre-built versions 
of Lua in the Catalina library.


