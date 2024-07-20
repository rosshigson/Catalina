Catalina Load Utilities
=======================

This directory contains only one C program - reversi.c, which implements the 
game of Reversi. But the build_all script in this directory builds this 
program up to nine times, in order to demonstrate the various Catalina 
Propeller load utilities. 

Most of the load utilities are to do with loading XMM SRAM, FLASH RAM, or
EEPROMS on various Propeller platforms, and some of these do not apply to the
Propeller 2. For instance, the Propeller 2 has no programmable EEPROM. It does
have programmable FLASH RAM, but it uses a script (flash_payload) to load this 
rather than a special load utility.

To build all the different versions of Reversi, specify your platform but NO
HMI or MEMORY MODE OPTIONS (such as the memory mode, cache size, flash or XMM 
options) on the command line - i.e. execute a command such as:

   build_all C3
or
   build_all HYDRA
or
   build_all QUICKSTART
or
   build_all P2_EDGE
or
   build_all P2_EVAL

Note that on hhe Propeller 1 up to 9 versions of the program will be built,
but on the Propeller 2 at most 3 versions of the program will be built. 

The build_all script will build all versions of the program to use the serial
TTY HMI option except on the HYDRA and HYBRID, where the serial port cannot be 
used at the same time as the XMM RAM, so it will use the TV HMI option instead.
This also means that a special cable and serial loader utility must be used in 
some cases that use the Mouse port. Refer to the Catalina Reference Manual for
the Propeller 1 for more details.

Also, note that before you can load and execute the programs the script
builds, you must execute the 'build_utilities' script for the same platform, 
and specify a cache size of 1K for both SRAM and FLASH (if these are supported
by your platform). The script is interactive - simply execute the command

   build_utilities

and it will prompt you for all the required information.  Finally, note that 
not all the executables will build for all platforms - e.g. some platforms 
have no XMM RAM or no FLASH RAM, and that if any error messages are generated,
it means the resulting binary will not work correctly even if one is produced.

The rest of this file describes each version of the reversi program that might 
be built by the build_all script, how it was compiled, and the payload command
and load utilities that can be used to load it.

reversi.bin
===========

This is built on all Propeller 2 platforms, and is the standard Parallax 
binary format. Ignoring any platform-specific options, it might be produced 
with a command such as:

   catalina -p2 -lci reversi.c

This program can be loaded into RAM using a payload command like:

   payload reversi -i

This file does not need any special load utilities, but the Propeller 2 does
use a special load script (called 'flash_payload') to load FLASH. So this 
program can be loaded into FLASH on the Propeller 2 using the a command like:

   flash_payload reversi -i

Note that you may need to adjust the P2 DIP switches to load and then run a 
program in FLASH.

The -i option is only needed for serial HMI options.

reversi_sram_small.bin
======================

This is built on Propeller 2 platforms which support SRAM as XMM RAM. 
It might be produced with a command such as:

   catalina reversi.c -p2 -lci -C SMALL -C CACHED_1K -o reversi_sram_small

It can be loaded into SRAM using a payload command like:

   payload SRAM reversi_sram_small -i

The -i option is only needed for serial HMI options.

reversi_sram_large.bin
======================

This is built on Propeller 2 platforms which support SRAM as XMM RAM. 
It might be produced with a command such as:

   catalina reversi.c -lci -C LARGE -C CACHED_1K -o reversi_sram_large

It can be loaded into SRAM using a payload command like:

   payload SRAM reversi_sram_large -i

The -i option is only needed for serial HMI options.


The remainder of this file is applicable only to the Propeller 1. If you have
a Propeller 2 platform you can stop here.

reversi.binary
==============

This is built on all Propeller 1 platforms, and is the standard Parallax 
binary format. Ignoring any platform-specific options, it might be produced 
with a command such as:

   catalina -lci reversi.c

It can be loaded into RAM using a payload command like:

   payload reversi -i

This file does not need any special load utilities. 

The -i option is only needed for serial HMI options.

reversi.eeprom
==============

This is built on all Propeller 1 platforms, and is the standard Parallax 
eeprom format. It might be produced with a command such as:

   catalina -e -lci reversi.c

It can be loaded into RAM using a payload command like:

   payload reversi.eeprom -i

The -i option is only needed for serial HMI options.

It can also be loaded into EEPROM using a payload command like:

   payload reversi.eeprom -e -i
or
   payload EEPROM reversi.eeprom -i

Note that you must specify the .eeprom format if there is also a .binary
format in the same directory.

This file does not need any special load utilities. The -e option to payload
and the EEPROM load utility are not the same, except that in this one case 
(where the file to be loaded is 32kb or less) both methods will work. The 
EEPROM load utility is mainly intended to load EEPROMs larger than 32kb.

reversi_eeprom.binary
=====================

This is built on all Propeller 1 platforms. It might be produced with a 
command such as:

   catalina reversi.c -lci -C EEPROM -o reversi_eeprom

It can be loaded into EEPROM using a payload command like:

   payload EEPROM reversi_eeprom -i

The -i option is only needed for serial HMI options.

In this case, the file is larger than 32kb and it cannot be loaded using the
standard Parallax utilities - we need to use the payload EEPROM load utility. 
This is actually a "two phase" load process, and allows us to load and execute
larger programs on a Propeller 1 than are otherwise possible. Refer to the 
Catalina Reference Manual for the Propeller 1 for more details on the EEPROM 
memory model and the advantages of two phase loads. 

reversi_sram_small.binary
=========================

This is built on all Propeller 1 platforms which support SRAM as XMM RAM. 
It might be produced with a command such as:

   catalina reversi.c -lci -C SMALL -C CACHED_1K -o reversi_sram_small

It can be loaded into SRAM using a payload command like:

   payload SRAM reversi_sram_small -i

The -i option is only needed for serial HMI options.

Note: On the HYDRA and HYBRID platforms, you must use a special cable and
serial loader that uses the Mouse port. See the Catalina Reference Manual
for the Propeller 1 for detals of the cable required. The command to use is:

   payload MOUSE reversi_sram_small

reversi_sram_large.binary
=========================

This is built on all Propeller 1 platforms which support SRAM as XMM RAM. 
It might be produced with a command such as:

   catalina reversi.c -lci -C LARGE -C CACHED_1K -o reversi_sram_large

It can be loaded into SRAM using a payload command like:

   payload SRAM reversi_sram_large -i

The -i option is only needed for serial HMI options.

Note: On the HYDRA and HYDRA platforms, you must use a special cable and
serial loader that uses the Mouse port. See the Catalina Reference Manual
for the Propeller 1 for detals of the cable required. The command to use is:

   payload MOUSE reversi_sram_small

reversi_flash_small.binary
==========================

This is built on all Propeller 1 platforms which support FLASH RAM as XMM RAM. 
It might be produced with a command such as:

   catalina reversi.c -lci -C FLASH -C SMALL -C CACHED_1K -o reversi_flash_small

It can be loaded into FLASH using a payload command like:

   payload FLASH reversi_flash_small -i

The -i option is only needed for serial HMI options.

However, there is something important to note here - although the program
is loaded into FLASH and executed by the above command, if you reboot the 
Propeller, it will not generally be re-run, because the Propeller 1 does
not normally execute the program that is in FLASH - it executes the program
that is in EEPROM. So Catalina provides another utility - Flash_Boot - to 
execute the program already in FLASH. You can therefore execute reversi again 
by using a command like:

   payload Flash_Boot -i

To do this every time the Propeller is rebooted, program Flash_Boot into
the EEPROM, using a command like this:

   payload Flash_Boot -e -i


reversi_flash_large.binary
==========================

This is built on all Propeller 1 platforms which support FLASH RAM as XMM RAM
and also have some XMM SRAM. It might be produced with a command such as:

   catalina reversi.c -lci -C FLASH -C LARGE -C CACHED_1K -o reversi_flash_large

It can be loaded into FLASH using a payload command like:

   payload FLASH reversi_flash_large -i

The -i option is only needed for serial HMI options.

However, just as will the previous FLASH program (reversi_flash_small) there 
is something important to note here - although the program is loaded into 
FLASH and executed by the above command, if you reboot the Propeller, it will 
not generally be re-run, because the Propeller 1 does not normally execute 
the program that is in FLASH - it executes the program that is in EEPROM. 
So Catalina provides another utility - Flash_Boot - to execute the program 
already in FLASH. You can therefore execute reversi again by using a command 
like:

   payload Flash_Boot -i

To do this every time the Propeller is rebooted, program Flash_Boot into
the EEPROM, using a command like this:

   payload Flash_Boot -e -i

reversi_sdcard.binary
=====================

This is built on all Propeller 1 platforms which support an SD Card. It can be 
produced with a command such as:

   catalina reversi.c -lci -C SDCARD -o reversi_sdcard

In this case, the file is larger than 32kb and we need to use an SD Card 
load utility. This is actually a two-phase load, and allows us to load and
run larger C programs on a Propeller 1 than are otherwise possible. Refer
to the Catalina Reference Manual for the Propeller 1 for more details on 
the SDCARD memory model and the advantages of two phase loads. 

The bset way to load this program is to use the Catalyst program loader. See 
the demos\catalyst folder for full details of compiling and installing 
Catalyst on your Propeller platform. Once you have done that, you can copy 
the executable to your SD card, and give it the extension ".smm" - this tells
Catalyst the program uses the SDCARD memory layout. For example, if your
SD card is in drive D: on Windows, then you might use a command like:

   copy reversi_sdcard.binary d:reversi.smm

Then insert the SD Card into your Propeller platform and in Catalyst
just execute the command:

   reversi

reversi_xeprom.binary
=====================

This is built on all Propeller 1 platforms which support using their EEPROM
as XMM RAM, which is any Propeller 1 with an EEPROM larger than 32kb. It can 
be produced with a command such as:

   catalina reversi.c -lci -C XEPROM -C SMALL -C CACHED_1K -o reversi_xeprom

It can be loaded into EEPROM using a payload command like:

   payload EEPROM reversi_xeprom -i

Note that only the SMALL memory model is supported for XEPROM execution.


