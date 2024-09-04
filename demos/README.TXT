Catalina Demo Programs
======================

Ths directory and subdirectories contain many demo programs for Catalina.

This file gives a brief overview of a few demo programs that are in this 
directory itself (i.e. not in a subdirectory). These programs are here mostly
because they are used in the various tutorial documents, such as "Getting 
Started with Catalina":

   hello_world.c     - the classic first C "hello, world" program.
   hello_world_1.c   - the same program, but which never exits (in case a
                       serial HMI is in use and the output from the above 
                       program is not visible because the Propeller shuts 
                       down before it can be sent out the serial port).
   hello_world_2.c     A similar program but using a smaller print function.
   hello_world_3.c     A similar program using an even smaller print function.
   my_func.c my_prog.c - a demo of compiling multiple files.
   blink.c           - a multi-cog LED blink program.

These programs also have ".geany" project files, that allow the programs to 
be edited, compiled and executed in Catalina's version of the Geany IDE. 
For example:

   catalina_geany hello_world.geany

See the document "Getting Started with the Catalina Geany IDE" for more
details on using Catalina Geany.

There is also a file for demonstrating the Lua scripting capability of the 
BlackBox debugger:

  hello_world_debug.lua - demonstrate Lua scripting in BlackBox

See the file itself for details, or the documents "Getting Started with 
Blackbox" or the "BlackBox Reference Manual" for more information on Blackbox.

The various subdirectories are used to illustrate specific aspects of the 
Catalina compiler. Many demonstrate specific areas of the C language, such as 
the use of file systems, or demonstrate various plugins, such as the various 
serial port options.

Here is a brief summary of the demo subdirectories. Each subdirectory has 
its own README.TXT file that explains its contents in detail.

name           Propeller   Description
============   =========   ===========
alloca         p1 or o2    Examples of using the alloca() function.
benchmarks     p1 or p2    Some common benchmaking programs
catalyst       p1 or p2    A simple SD Card Operating System/Program Loader
catapult       p1 or p2    Using Catapult to build multi-model programs.
debug          p1 or p2    Example for the BlackBox or BlackCat debuggers
dosfs          p1 or p2    Demonstrates the DOSFS File System
examples       p1 or p2    Miscellaneous example programs
file_systems   p1 or p2    Demonstrates the C (stdio) and Catalina file system
games          p1 or p2    Some ANSI C Games programs
globbing       p1 or p2    Example of file globbing (i.e. wildcard expansion)
graphics          p1       Example of using the Parallax Graphics Library in C
hub_malloc     p1 of p2    Demonstrates memory management that uses Hub RAM
inline_pasm    p1 or p2    Example to illustrate using inline PASM
interrupts        p2       Example of using interrupts in C
loader         p1 or p2    An example of a program loader written in C
lua            p1 or p2    Examples of C programs that use embedded Lua
lut_exec          p2       Demonstrates executing inline PASM from the LUT
minimal           p1       Demonstration of using the minimal target
multicog       p1 or p2    Example of multi-cog progamming in C
multimodel     p1 or p2    Example of using multiple memory models in C
multithread    p1 or p2    Example of using multi-threading in C
p2                p2       Example of P2-specific functions
p2_ram            p2       Demonstrations and utilities using PSRAM
parallelize    p1 or p2    Example of Parallel programming in C
pasm_pstr      p1 or p2    Example of using Catalina's _PSTR macro
random            p1       Example of using the RANDOM plugin
serial2           p2       Example of using the serial2 library
serial4           p1       Example of using the serial4 library
serial8           p2       Example of using the serial8 library
small_lisp     p1 or p2    The Small Lisp interpreter in C
sound             p1       Example of the sound library/plugin
spi               p1       Example of the spi library/plugin
spinc             p1       Example of using Spin or PASM programs with C
test_suite     p1 or p2    Simple test program for Catalina C
tty               p1       Example of the tty library
tty256            p1       Example of the tty256 library/plugin
utilities         p1       Demonstration of using the payload load utilities
vgraphics         p1       Example of using the Virtual Graphics Library in C
xeprom            p1       Example of reading EEPROM data in XEPROM programs

There is a 'build_all' script in each subdirectory that can be used to build 
the demo programs in that subdirectory.

The build_all scripts accept command line parameters to specify the platform
and various configuration options, but another option is to first set the 
Catalina environment variable CATALINA_DEFINE appropriately. For example, 
if you have a P2_EVAL board, use commands such as:

   cd games
   set CATALINA_DEFINE=P2_EVAL
   build_all

would (assuming CATALINA_DEFINE is undefined) achive the same result as just:

   cd games
   build_all P2_EVAL

Under Linux, the equivalent would be:

   cd games
   CATALINA_DEFINE="P2_EVAL"
   ./build_all

or just

   cd games
   ./build_all P2_EVAL

The above Linux commands are for the bash shell - the exact commands may 
differ if you use a different shell.

For more details on using environment variables, see the Catalina Reference 
Manual.
