This directory contains a simple speed test program (thanks to evanh) which 
can be used to test the speed of the new smartpin-based SD driver (also thanks
to evanh). It also contains the same inline C/PASM driver converted into a 
Catalina plugin (by rossh), which is intended to provide an example of how to 
do this. 

The new SD card driver is supported on the Propeller 2 only.

There is a build_all script that must be given the platform name and any
additonal options, such as HMI options. For example:

  build_all P2_EVAL MHZ_300

or

  build_all P2_EDGE CR_ON_LF OPTIMIZE

Do not specify a memory model (other than NATIVE, which is the default).
This is because both the the C/PASM version of the SD card driver and the 
test program contains inline PASM that will work only in NATIVE mode. 
Note that this limitation does not apply to the plugin version of the driver, 
which can be used in any memory mode (see the folder demos/file_systems
for examples that can be built to use the SD2 driver with any memory model),

Do not specify SD or SD2 when using the batch script, because it will add 
them automatically as required. Three versions of the speed test program 
will be built by the script:

   test_sd  - a version that uses the old SD card plugin (aka SD).

   test_sd2 - a version that uses the new SD card plugin (aka SD2).

   test_c   - a version that uses inline C/PASM to implement the SD card
              driver (again, thanks to evanh).

The test_sd version will use the old SD plugin in the target directory (i.e.
target/p2/cogsd.t) but the test_sd2 version will use the version of the new 
SD plugin (cogsd2.t) in this directory in preference to the one in the target
directory so that it can be modified if required without disturbing other
programs. The file sd2_cat.c provides an interface to either plugin. The new
SD plugin is written to be a fairly close match to the inline C/PASM version, 
which is in sdmm_cat.c.

The test program (speedtest.c) uses the FatFs file system, and is built using
a stand-alone version of FatFs contained in this directory, rather than the 
one in the Catlaina libraies (i.e. libcx2 or libcix2). FatFs is contained in 
the files ff.h, ffconf.h, ff.c, ffsystem.c, ffunicode.c, fftime.c and diskio.c.
