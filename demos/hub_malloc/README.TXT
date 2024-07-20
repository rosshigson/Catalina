This directory contains an example program to demonstrate the new hub malloc
functions defined in the header file "hmalloc.h". 

Note that using BOTH the standard malloc functions and the new hub malloc 
functions in the same program is only supported in programs compiled to use
XMM LARGE mode. In other modes, you should only use one or the other or they 
will conflict. The example program in this directory uses only one or the 
other, so it can be compiled in any memory mode (although it may be too large 
for the Propeller 1 except when it is compiled in XMM SMALL or XMM LARGE mode).

To build the example programs, use the 'build_all' scripts, specifying the
platform, the memory model, HMI and other options. For example:

   build_all P2_EDGE
or
   build_all P2_EDGE LARGE
or
   build_all P2_EDGE SMALL SIMPLE OPTIMIZE
or
   build_all P2_EVAL LARGE CACHED_64K

The script will build two versions of the program:

   std_malloc         -- use standard malloc functions defined in stdlib.h
   hub_malloc         -- use the hub malloc functions defined in hmalloc.h

The first version uses the normal stdlib malloc functions (which for an XMM 
LARGE program will allocate memory from XMM RAM) whereas the second one uses
the new hub malloc functions (which always allocate memory from XMM RAM).

Note that if the heap is ALREADY in Hub RAM, then the two sets of functions are
functionally identical and you will see little difference in the output other
than that the exact memory addresses may change slightly. However, if you 
compile the program using the LARGE memory model, you will see that the 
std_malloc version allocates memory from XMM RAM (addresses above 0x80000 or 
512k) whereas the hub_malloc version allocates mamory from Hub RAM (addresses
below 0x80000).

