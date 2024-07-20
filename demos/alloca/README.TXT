This directory contains an example program to demonstrate the new alloca()
function. This funcrtion is defined in the header file "alloca.h". 

The point of alloca() is that it is smaller and faster than using malloc, and 
it always allocates memory on the stack (which is always in Hub RAM). This 
memory is freed automatically when the program leaves the scope in which it 
was allocated (e.g. the function). The alloca() function is supported in all 
memory models.

To build the example program, use the 'build_all' scripts, specifying the
platform, the memory model, HMI and other options. For example:

   build_all P2_EDGE
or
   build_all P2_EDGE LARGE
or
   build_all P2_EDGE SMALL SIMPLE OPTIMIZE
or
   build_all P2_EVAL COMPACT

The script will build two programs:

   test_alloca_1      -- use the alloca function and print the address of
                         the memory allocated.

   test_alloca_2      -- test that alloca function works when used in the
                         argument list of a function.

