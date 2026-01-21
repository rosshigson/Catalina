The Lua source files in this folder are not directly used to build Lua - they
are used to build two Catalina libraries (which can then be used to build 
programs that use Lua). These libraries are:

   lib/lua
   lib/luax

Note that only one (and not both) of these libraries should be used to build 
programs (i.e. use only one of the Catalina options -llua or -lluax, and not
both). The difference between the two is that the lib/lua library contains 
the standard Lua parser, and can be used to build programs that need it, such 
as the interactive version of lua. The lib/luax library omits these, and is 
better suitable for building programs such as luax that do not want the 
standard parser included, but define an alternative parser (since a parser is
assumed to exist by other files in the libraries).

Also, note that NEITHER library contains linit.c, lua.c or luax.c which must 
be compiled along with any program that wants to use these libraries - this is
because these files may need to be customized for a particular Lua application.

Finally, note that while these libraries CAN be used to build lua (see the 
folder demos/lua for how to build both lua amd multi-processing lua, plus 
other examples of using Lua in a C program) they are not used by Catalyst - 
this is because these libraries are compiled WITHOUT some of the options that
may be useful, such as the options to ENABLE_PSRAM or ENABLE_HYPER. Setting 
those options requires recompiling ALL the Lua source code.

