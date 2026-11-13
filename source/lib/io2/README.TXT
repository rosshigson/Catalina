This directory contains the "built-in" version of FatFs. It is built as part 
of the libcx2 and libcix2 libraries, and so used simply by using stdio when 
C programs are compiled using -lcx2 (or -lcix2) in place of -lcx or -lcix in 
a Catalina command (which continue to use DosFs).

Since FatFs also requires 64 bit integer support, this directory also contains 
the int64 library functions. This means that porgrams linked with --lcx2 or
-lcix2 shout NOT also be linked with -lint64, or the 64 bit integer functions
will be multiply defined.

The "built-in version of FatFs is pre-configured with a default partition
table that allows for up to four partitions on physical drive 0 - if a 
different configuration is required, a stand-alone version of FatFs must 
be used. The partition table is in vol2par.c:

   PARTITION VolToPart[] = {
       {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
       {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
       {0, 3},    /* "3:" ==> 3rd partition in physical drive 0 */
       {0, 4},    /* "4:" ==> 4th partition in physical drive 0 */
   };

FatFs is supported only on the Propeller 2.

Like DosFs, FatFs can be used with either the old and new SD plugins.  The 
old SD plugin is used by default, or if -C SD is specified on the command 
line. To use the new SD plugin, specify -C SD2 on the command line.

So there are now several possible ways to compile a Propeller 2 program that 
uses the SD card, including:

   catalina -p2 program.c -lcx           <== use DosFs and the old SD plguin
   catalina -p2 program.c -lcx -C SD2    <== use DosFs and the new SD plguin
   catalina -p2 program.c -lcx2          <== use FatFs and the old SD plguin
   catalina -p2 program.c -lcx2 -C SD2   <== use FatFs and the new SD plguin
