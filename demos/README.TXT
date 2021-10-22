Catalina Demo Programs
======================

Ths directory and subdirectories contain many demo programs for Catalina.

This file gives a brief overview of a few demo programs that are in this 
directory itself (i.e. not in a subdirectory). These programs are here mostly
 because they are used in the various tutorial documents, such as Getting 
Started with Catalina. For example, the classic C first program (hello_world.c)
can be found in this directory.

The various subdirectories are used to illustrate specific aspects of the 
Catalina compiler. Many demonstrate specific areas of the C language, such as 
the use of file systems, or demonstrate various plugins, such as the various 
serial port options.

Here is a brief summary of the demo subdirectories. Each subdirectory has 
its own README.TXT file that explains its contents in detail.

name           Propeller   Description
============   =========   ===========
benchmarks     p1 or p2    Some common benchmaking programs
catalyst       p1 or p2    A simple SD Card Operating System/Program Loader
debug          p1 or p2    Example for the BlackBox or BlackCat debuggers
dosfs          p1 or p2    Demonstrates the DOSFS File System
examples       p1 or p2    Miscellaneous example programs
file_systems   p1 or p2    Demonstrates the C (stdio) and Catalina file system
games          p1 or p2    Some ANSI C Games programs
globbing       p1 or p2    Example of file globbing (i.e. wildcard expansion)
graphics          p1       Example of using the Parallax Graphics Library in C
inline_pasm    p1 or p2    Example to illustrate using inline PASM
interrupts        p2       Example of using interrupts in C
minimal           p1       Demonstration of using the minimal target
multicog       p1 or p2    Example of multi-cog progamming in C
multimodel     p1 or p2    Example of using multiple memory models in C
multithread    p1 or p2    Example of using multi-threading in C
p2                p2       Example of P2-specific functions
parallelize    p1 or p2    Example of Parallel programming in C
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
