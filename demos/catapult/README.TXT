This directory contains example programs that demonstrate Catalina Catapult.
Catapult is a utility intended to simplify the process of developing, 
debugging and maintaining Catalina multi-model programs.

For details of Catapult and the demo programs in this directory, see the 
document "Getting Started With Catapult"

Note that there are no build_all scripts or Makefiles in this directory,
because this job is done by Catapult. To make each program, simply specify
the file name, such as:

   catapult thread_p1.c
or
   catapult thread_p2.c

Note that if the result is an XMM program (as it is in the above cases) then
the build_utilities script will have to be executed to build a suitably
configured XMM loader. Check the program for the cache size to use - if no
cache size is specified in the program, then an 8K cache should be used.
