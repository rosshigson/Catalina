This folder contains a version of FatCat, based on Catalyst version 9.3

FatCat is simply Catalyst built to use FatFs (which understands both exFAT 
and FAT volumes) rather than DosFs (which understands FAT volumes only).
FatFs also supports long file names, wheras DosFs does not.

Note that FatCat is supported on the Propeller 2 only. This version has
been tested only on exFAT and FAT volumes with a sector size of 512 bytes
only.

Since the Propeller 2 cannot BOOT from an exFAT volume, if the SD card is
formatted as exFAT then FatCat will have to be programmed to boot from Flash. 
But it can then load and execute files off the SD card, just as Catalyst can.

To program the FatCat binary into Flash, ensure the Propeller 2 FLASH switch 
is on, and then use the flash_payload command, specifying the serial port to 
use. For example, if the Propeller is on port 4 on Windows:

  flash_payload fatcat.bin -p4 

Or, on Linux, if the Propeller is on /dev/ttyUSB0:

  flash_payload fatcat.bin -p/dev/ttyUSB0

When building FatCat, use the build_all scripts provided, specifying at
least the propeller 2 platform and the type of HMI. The new SD card plugin 
can also be specified by adding SD2. For example:

   build_all P2_EDGE SD2 SIMPLE VT100
or
   build_all P2_EVAL VGA OPTIMIZE

These scripts will build FatCat using the version of FatFs contained in this
folder. The folder also contains build_all_using_library scripts that build 
the same programs, but using the version of FatFs contained in the standard 
C libraries (i.e. stdio). The main difference (as distributed) is that the
library version of FatFs does not support time stamping, whereas the version
in this directory does.

This version of Fatcat contains only core Catalyst utiliites - i.e. the
build_all script will build the following binaries:

   fatcat.bin
   ls.bin
   cp.bin
   mv.bin
   rm.bin
   cat.bin
   format.bin
   help.bin
   rmdir.bin
   mkdir.bin
   set.bin
   time.bin (only built when using the version of FatFs in this directory).

Note that (apart from format) these are simple re-implementations of the 
Catalyst functions which used DosFs. As such, they do not always do things 
the simplest way they could be done using FatFs - but they have been left 
largely "as is" so that they reproduce the Catalyst behavior as faithfully 
as possible. However, due to the addition of long file names, the output 
format of "ls" has been modified slightly (e.g. to put the file name last 
when a long listing is requested).

Also note that the cat, rm, ls, cp and mv commands have been modified to be 
CASE-INSENSITIVE when matching file names. This is required because the exFAT 
file system preserves filename case, whereas FAT file systems do not (unless 
long file name support is enabled, which DosFs does not support). 

So, for example:

  cp MYFILE.TXT myfile2.txt
and
  cp myfile.txt myfile2.txt

will do the same thing under both FatCat and Catalyst. However, the following 
commands will actually result in the same file names under Catalyst, but
different file names under Fatcat:

  cp MYFILE.TXT myfile2.txt
and
  cp MYFILE.TXT MYFILE2.TXT

However, in most cases this will not matter.

The format program is new for FatCat (because DosFs does not provide formatting
functions). It is a general purpose SD card disk formatter. It can format an 
SD card with up to 4 partitions, each one of which can be FAT, FAT32 or exFAT.
To make the SD card bootably on the Propeller 2, the first partiton should be 
FAT32 with 2 FATs and a 32k cluster size (subsequent partitions can use other
options).

For example:

   format 0:0x800000,2,0,0,0,0,"FAT 32" 1:100,4,0,0,0,0,"EX FAT" -v

Use format -h for a list of all options, and see the FatFs documentation of
f_fisk() and f_mkfs() for more details on each option.

Note that if C programs are compiled and executed using FatCat, they must use 
ONLY the FatFs functions (either by compiling FatFs themselves, or by using 
the -lcx2 or -lcix2 library options) to access the SD card, and not the DosFs 
functions (either directly or by using the -lcx or lcix library options). 
Failure to do so will probably result in a corrupted SD card file system.
For example, FatCat requires slightly modified linenoise and getenv/setenv 
functions (which are included in this folder) because the versions in the 
standard Catalina libraries use the DosFs file system internally.

