This folder contains a version of FatCat, based on Catalyst version 9.3

FatCat is simply Catalyst built to use FatFs (which understands both exFAT 
and FAT volumes) rather than DosFs (which understands FAT volumes only).
FatFs also supports long file names, wheras DosFs does not.

Note that FatCat is supported on the Propeller 2 only. This version has
been tested only on exFAT and FAT volumes with a sector size of 512 bytes
and a cluster size of 32 kilobytes.

Since the Propeller 2 cannot BOOT from an exFAT volume, if the SD card is
formatted as exFAT then FatCat will have to be programmed to boot from Flash. 
But it can then load and execute files off the SD card, just as Catalyst can.

To program the FatCat binary into Flash, ensure the Propeller 2 FLASH switch 
is on, and then use the flash_payload command, specifying the serial port to 
use. For example, if the Propeller is on port 4 on Windows:

  flash_payload fatcat.bin -p4 

Or, on Linux, if the Propeller is on /dev/ttyUSB0:

  flash_payload fatcat.bin -p/dev/ttyUSB0

When building FatCat, use the build_all scripts provided, specifying the 
propeller 2 platform and the type of HMI. The new SD card plugin can also
be specified by adding SD2. For example:

   build_all P2_EDGE SIMPLE VT100
or
   build_all P2_EVAL VGA SD2 OPTIMIZE

This version of Fatcat contains only the core Catalyst utiliites - i.e. the
build_all script will build the following binaries:

   fatcat.bin
   ls.bin
   cp.bin
   mv.bin
   rm.bin
   cat.bin
   help.bin
   rmdir.bin
   mkdir.bin
   set.bin

Note that these are simple re-implementations of the Catalyst functions which 
used DosFs. As such, they do not always do things the simplest way they could
be done using FatFs - but they have been left largely "as is" so that they
reproduce the Catalyst behavior as faithfully as possible. However, due to
the addition of long file names, the output format of "ls" has been modified 
slightly (e.g. to put the file name last when a long listing is requested).

Note that if other C programs are compiled and executed using FatCat, they 
must use ONLY the FatFs functions to access the SD card, not the C stdio 
functions (because those functions use DosFs internally). Failure to do this 
will probably results in a corrupted SD card file system. For example, FatCat 
required slightly modified linenoise and setenv functions (which are included 
in this folder) because the versions in the Catalina library use the DosFs 
file system internally.

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
