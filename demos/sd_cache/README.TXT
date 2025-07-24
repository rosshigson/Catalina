This folder contains an SD card test program (thanks to evanh for the
original) which is quite useful in its own right - but this folder also has
another purpose - it demonstrates how to build and use a local customized 
version of the standard C library.

In this case, the key customization is to include SD card caching support, 
which is supported on the Propeller 2 Edge board with PSRAM (the P2-EC32MB) 
or the P2 Edge or P2 Evaluation boards fitted with the Parallax HyperRAM 
add-on board.

Since the cache is implemented as a layer between the SD card plugin and 
the stdio functions, and it uses PSRAM or HYPER RAM, enabling it requires the
C library to be built for the specific platform on which the program is to be
run. This is currently the main reason for needing to build a local version of
the C library, but the same technique used in this folder (and subfolders) 
could also be applied if this was required for other purposes. For instance, 
a similar technique is used to build the Propeller 2 self-hosted version of 
Catalina itself. The main difference is that in this folder only the C library
is built, not all the other components required by Catalina.

As initially installed, or after using the 'clean_all' or 'clean_lib' script, 
the following sub-folders will exist in this folder:

  local
    |
    +-- include (initially empty)
    |
    +-- lib (initially empty)
    |
    +-- source (contains only clean_all scripts)
    |     |
    |     +-- lib (initially empty)
    |
    +-- target (initially empty)

The scripts in this folder do all the work. The main script is the 'build_all'
script, which clears the above directory structure (in case it contains the 
results of a previous build), and copies the Catalina library sources from 
"%LCCDIR%/source/lib" into the "source/lib" folder. It also copies the 
"include" and "target" folders, which are required to be present in the 
appropriate places in the tree during the build process. The output of the 
build goes in the "lib" folder. Note that only the p2 libraries are built 
since the SD cache option is only supported on the Propeller 2, but a similar 
technique could be used to build a local version of libraries  for the 
Propeller 1. All the memory model variants of the library (i.e. NATIVE, TINY,
COMPACT, SMALL and LARGE) will be built by the script.

Once the library is built, the build scripts will build the sd_test program 
to use the local version of the C library in place of the standard C library. 
This is done using Catalina's -L option. All the individual library references
(such as -lc, -lmc, -lthreads etc) will then refer to the local versions. The 
local versions are in "local/lib", and so in this case are used by specifying
-Llocal. The appropriate PSRAM or HYPER library (i.e. '-lhyper' or '-lpsram') 
must also be specified when bulding the sd_test program to use the SD cache. 

To facilitate comparisons between using the SD cache or not, the build scripts
will build THREE versions of the SD test program:

  sd_test1.bin     => use the local the C library, with the SD cache enabled
                      and used in WRITE_BACK mode.

  sd_test2.bin     => use the local the C library, with the SD cache enabled
                      and used in WRITE_THROUGH mode.

  sd_test3.bin     => use the standard C library, with the SD cache disabled.

The SD test program can also be built manually. For example:

   catalina -C P2_EVAL -p2 -lcx -lhyper sd_test.c -Llocal
or
   catalina -C P2_EVAL -p2 -lcx -lhyper sd_test.c -Llocal -C WRITE_BACK

Since rebuildikng the local library can take some time, it is not always
desirable (or necessary) to rebuild it every time - e.g. just to recompile
the sd_test program using a different memory model. So scripts are provided 
that affect only the sd_test program, only the local library, or both. 

Here is a summary of all the scripts provided:

   clean_test   => cleans only the sd_test program.
   clean_lib    => cleans only the local library.
   clean_all    => cleans everything - i.e. both the sd_test 
                   program AND the local library.

   build_test   => builds only the sd_test program.
   build_lib    => builds only the local library.
   build_all    => builds everything - i.e. both the sd_test 
                   program AND the local library.

All the scripts expect the platform to be specified as the first parameter
and either PSRAM or HYPER as the second parameter (if required). If neither 
PSRAM nor HYPER is specified, then for the P2_EVAL the default is HYPER and 
for P2_EDGE the default is PSRAM. Other options (such as the memory model to
use) should be specified AFTER these options, and are only used when building
the sd_test program (i.e. not the local library). For example:

   build_all P2_EDGE
   build_all P2_EDGE HYPER SMALL
   build_all P2_EDGE PSRAM
   build_all P2_EVAL
   build_all P2_EVAL COMPACT
   build_all P2_EVAL HYPER LARGE TTY VT100

Noe that if the library and test program are built separately (e.g. by using
'build_lib' and then 'build_test') then it is possible that there will be a
mismatch between the platfrom the library is built to support, and that of the
SD test program. In such cases, the relevant PSRAM or HYPER functions may be 
undefined, resulting in compilation errors similar to:

   Undefined or Redefined symbols:
    psram_writeLong undefined
    psram_readLong undefined
    psram_write undefined
    psram_read undefined

To fix these errors, either the library or the SD test program (or both)
should be rebuilt.

If the library has simply not been built at all, using the 'build_test' script 
will result in compilation errors similar to:

   cannot open library index local\lib\p2\cmm\hyper\catalina.idx

To fix this error, the library should be rebuilt.
