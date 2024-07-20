This directory contains a "globbing" demo for the Catalina DOSFS SD Card
file system. 

In the world of Unix, "globbing" was a term that meant pattern matching 
against a wildcard expression, a function commonly required when searching 
for files in a file system. 

The ANSI C standard did not provide any such functions - but they can be
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
etc). On the Propeller 1, you will probably also need to specify COMPACT, or
the SMALL or LARGE memory model

For example:

   build_all HYBRID LARGE
or
   build_all RAMBLADE3 SMALL
or
   build_all C3 LARGE FLASH CACHED_1K
or
   build_all C3 COMPACT TTY
or
   build_all P2_EVAL

The following programs are built: 

   test.binary (test.bin on a P2) - a compiled version of the demo program.

On the P1, if you use XMM SMALL or LARGE mode, be sure to use the 
"build_utilities" command to also build the XMM loaders appropriate 
for the platform.

Note that the demo program pattern matching is deliberately not case 
sensitive, because DOS file names are not. 

Patterns can include:

   *       matches zero or more characters
   ?       matches any single character
   [set]   matches any character in the set
   [^set]  matches any character NOT in the set
           where a set is a group of characters or ranges. a range
           is written as two characters seperated with a hyphen: a-z denotes
           all characters between a to z inclusive.
   [-set]  set matches a literal hypen and any character in the set
   []set]  matches a literal close bracket and any character in the set

   char    matches itself except where char is '*' or '?' or '['
   \char   matches char, including any pattern character

Try patterns like:

   *.BIN
   ??.BIN
   ex*.BAS
   [a-g]*.bin
   [^e]*.bas

