This directory contains a "globbing" demo for the Catalina DOSFS SD Card
file system. 

In the world of Unix, "globbing" was a term that meant pattern matching 
against a wildcard expression, a function commonly required when searching 
for files in a file system. 

The Ansi C standard did not provide any such functions - but they can be
added on by using the low level DOSFS file system functions, as demonstrated 
by this code. This code could be incorporated "as is" into an application 
program, or turned into a library.

The following files are provided:

   storage.h - header file for the DOSFS storage functions.
   storage.c - DOSFS storage functions
   glob.c    - pattern matching functions
   test.c    - a simple demo program.

To build the demo program, use the "build_all" command, specifying the 
platform for which you want to build (e.g. HYDRA, HYBRID, TRIBLADEPROP CPU_1 
etc). On the Propeller 1, you will probably also need to specify the SMALL 
or LARGE memory model

For example:

   build_all HYBRID LARGE
or
   build_all RAMBLADE3 SMALL
or
   build_all C3 LARGE FLASH CACHED_1K
or
   build_all P2_EVAL

The following programs are built: 

   test.binary (test.bin on a P2) - a compiled version of the demo program.

The program requires a P2, or XMM RAM on a P1 to run. Be sure to use the 
"build_utilities" command to also build the XMM loaders appropriate for the
platform.

Note that the pattern matching works on the raw unformatted file names, which
do not include a "." character between names and extensions. Also, the
patterns are case sensitive. So to search for a file with a ".BIN" extension,
a pattern like "*.bin" will not work, whereas a pattern like "*BIN" will.

