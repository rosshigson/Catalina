This directory contains a BETA release of Catalina's implementation of the 
FatFs file system. Unlike DosFs, which supports only FAT volumes and DOS 
8.3 file names, FatFs supports both FAT and exFAT volumes and long file 
names "out of the box". 

However, FatFs is currently both larger and slower than DosFs, and is also 
currently supported only on the Propeller 2. Also, the licensing for using
exFAT is not simple. To use exFAT in a commercial application a license from 
Microsoft may be required.

For these reasons, Catalyst itself will continue to use DosFs as its own
file system for the foreseeable future, but Catalyst can be used to build and
load programs that use FatFs. To facilitate this, all the demo programs in 
this directory will wait and prompt on startup to insert an SD card, so that 
a different SD card (e.g. an SD card formatted as exFAT) can be inserted in
place of the Catalyst FAT32 SD card if necessary.

FatFs was developed by chaN. See the files ff.h and LICENSE.TXT For more 
details. Documentation for FatFs is available in the documents folder in
this directory.

The crc7 function (used to check the CRC on the SD Card CSD register) was 
developed by Jens Axboe <axboe@kernel.dk>. 

FatFs is highly configurable, and can (for example) be configured to use 
either 32 bit or 64 bit Logical Block Addressing (LBA). Using 64 bit LBAs 
overcomes the file size limits inherent in FAT (e.g. a maximum total file 
system size of 2Tb, and a maximum individual file size of 4Gb). However, 
note that in this release not all the FatFs configurable options and/or
combinations of options have been tested. For a summary of the current
status, see later in this document.

Catalina can support both 32 bit LBAs and 64 bit LBAs. Using 64 bit LBAs also
requires the use of the int64 library. This is done automatically in the 
Makefile.

When using 64 bit LBAs, FatFs also requires C99 to be enabled. This is done
automatically in the Makefile.

Building FatFs
==============

This folder contains a build_all script which can be used to build the FatFs
demo programs. For example:

   build_all                  => build for the P2_CUSTOM platform

   build_all P2_EVAL CLOCK    => build for the P2_EVAL platform, with the
                                 CLOCK plugin enabled to time the I/O 
                                 operations (testpar1 and testpar2 demos)

   build_all P2_EDGE COMPACT  => build for the P2_EDGE platform, using 
                                 COMPACT mode

FatFs Demos
===========

This directory contains four demo programs:

   testdisk               - derived from the orignal FatFs demo app4.c, this
                            is a low level FatFs disk I/O test program.

   testpar0               - derived from the DosFs test program test_dosfs.c,
                            this tests basic FatFs file functionality on the
                            default partition (partition 0).

   testpar1               - derived from the DosFs test program test_dosfs.c,
                            this tests basic FatFs file functionality on the
                            second partition (partition 1).

   testmkfs               - format an SD card. The card will be formatted 
                            with one partition if FF_MULTI_PARTITION is set
                            to 0 in ffconf.h, or two partitions if it is
                            set to 1. The program will prompt to select 
                            either FAT32 or exFAT for the first partition 
                            (the second, if enabled, will be formatted as 
                            exFAT) and also for volume names to use for
                            the volumes it creates in each partition. Note 
                            that formatting a large SD card can take many 
                            minutes to complete.

  volcopy                 - a simple utility that can copy files between
                            partitions. By default, it copies the specified
                            file(s) from partition 0 to partition 1, but it
                            can copy files between other partitions using 
                            the -i and -o options. For example:

                               volcopy CATALYST.TXT CATALINA.TXT
                               volcopy -i1 -v CATALYST.TXT 

                            See volcopy -? for details.

Current Status
==============

The following summarizes the current state of various FatFS configuration 
options (more details for each option are given in ffconfig.h). If a non-zero 
value is specified below it means some basic (but not yet exhaustive) testing 
has been done using that value. If a zero value is specified below it means 
the option is known NOT to work yet. If no value is specified below it means 
little or no testing has been done specifically on that configuration option.

FF_USE_FIND        1
FF_USE_MKFS        1
FF_USE_LABEL       1
FF_USE_STRFUNC     1
FF_CODEPAGE        437
FF_USE_LFN         2
FF_LFN_BUF         255
FF_SFN_BUF         12
FF_FS_PATH         1
FF_MULTI_PARTITION 0
FF_MIN_SS          512
FF_MAX_SS          512
FF_LBA64           1
FF_FS_EXFAT        1
FF_FS_NORTC        1
FF_FS_TINY         1
FF_FS_CHMOD        1

The programs can be compiled in NATIVE, COMPACT, TINY, and the XMM
SMALL and LARGE modes, and all work as expected - however note that 
formatting a large SD card will take even longer using the XMM modes.
