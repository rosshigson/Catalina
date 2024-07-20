                             DOSFS TEST PROGRAM
                             ==================

This folder contains a test program for the DOSFS file system. The build_all 
script in this directory builds two versions of the test program:

   test_dosfs  - a normal executable which can be executed directly.

   debug_dosfs - a version with debugging enabled that can be used with the 
                 BlackBox debugger.

The first parameter to the build_all script must be the platform, which is 
assumed to be a Propeller 2 platform if it begins with P2 (e.g. P2_EVAL). 
The remaining parameters can be used to specify additional build options.

Note that the test program is quite large, so on the Propeller 1 it would 
normally be built in LARGE mode.  

For example:

   build_all P2_EVAL TTY CR_ON_LF
   build_all QUICKSTART PMC LARGE CACHED_1K HIRES_VGA
   build_all C3 SMALL TTY

Add the CLOCK symbol to time the file reading and writing. For example:

   build_all P2_EDGE SIMPLE CR_ON_LF CLOCK

Note that to load the program on the Propeller 1, you will have to use the
normal build_utilities script to build the appropriate loader with options 
compatible with those you used to build the DOSFS test program.

Note that because we want to support debugging of all the DOSFS functions, we 
use our own version of them - but to allow the program to be linked with the 
all the normal Catalina library functions without causing symbols to be 
multiply defined, the DOSFS functions in this directory have been renamed.
The Catalina library versions all start with the normal "DFS_" prefix, but 
the versions in this directory have been renamed to start with "DOSFS_". 
For example:

   DFS_OpenFile -> DOSFS_OpenFile

Other than that, and the fact that (to save space) the Catalina library 
versions do not support FAT12, the functions should be identical.

