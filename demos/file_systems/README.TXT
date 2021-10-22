                            FILE SYSTEM TEST PROGRAMS
                            =========================

This folder contains a test program for the C stdio and Catalina file systems.
Both are based on DOSFS, but the Catalina File System is smaller and may be
more useful in some applications. For example, the test program for this
file system can be built for a Propeller in COMPACT mode, whereas the test 
program for the stdio file system cannot.

The build_all script in this directory builds the following test programs:

   test_stdio_fs     - a simple test program for the standard C stdio file
                       system functions.

   test_catalina_fs - a simple test program for the Catalina fila system
                      functions.

   test_sector_rw   - a low level sector read/write test program. 
                      WARNING: writing arbitrary sectors on an SD card
                      may damage any file system on it.

   test_stdio_buffering - test the setcbuf & setvbuf functions. See the
                          program for details.

The first parameter to the build_all script must be the platform, which is 
assumed to be a Propeller 2 platform if it begins with P2 (e.g. P2_EVAL). 
The remaining parameters can be used to specify additional build options.

Note that the test programs can be quite large, so on the Propeller 1 some 
programs may fail to build unless they are built in SMALL or LARGE mode.  

For example:

   build_all P2_EVAL 
or
   build_all QUICKSTART PMC LARGE CACHED_1K HIRES_VGA
or
   build_all C3 SMALL CACHED_1K TTY

Note that to load the program on the Propeller 1, you will have to use the
normal build_utilities script to build the appropriate loader with options 
compatible with those you used to build the test programs.

