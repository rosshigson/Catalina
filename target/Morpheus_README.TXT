Morpheus Catalina Target Package
================================

This file contains notes specific to the support of the Morpheus platform 
provided by this target package.

Morpheus support is enabled by either adding the option -C MORPHEUS to each 
catalina command line, or by adding MORPHEUS to the CATALINA_DEFINE 
environment variable. In addition, the CPU must be specified by adding the
option -C CPU_1 or -C CPU_2 to the command line, or adding CPU_1 or CPU_2
to the CATALINA_DEFINE environment variable.

Morpheus is a complex beast since it has two Propeller CPUs. Each CPU can be 
used independently, or they can be used together. Each of the CPUs also has 
various optional items of hardware.

Catalina LMM programs can be run on either CPU, but many of the LMM targets 
assume one or more of the HMI devices (screen, keyboard, mouse) that are only 
directly available directly on CPU #1. Using them the other CPU is possible,
but requires the execution of a proxy server on CPU #1)

Loading and tunning programs on the various CPUs, and/or running XMM programs, 
can be quite complex. From the point of view of Catalina, each CPU has quite 
a different set of capabilities. For example, only one of the CPUs (#2) 
supports XMM RAM. 

This means that unlike simpler platforms (such as the Hydra or the Hybrid) 
there is often no obvious 'default' target on Morpheus. It is necessary to 
differentiate between XMM programs intended to be executed on CPU #1 or 2.

This directory contains a Catalyst SD Loader program intended to be used by 
the Catalyst program load programs from the onboard SD Card. This loader can 
load either normal SPIN programs or Catalina programs. Programs that fit into 
31k (such as Catalina LMM programs) require no special handling. Catalyst 
also also knows how to load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards - but 
as there is not much call for FAT12 these days, it is currently disabled to 
save code space.

Below is a summary of each CPU, and a description of the different possible
configurations of the CPU supported by Catalina. Other configurations are 
also possible, but may require new targets to be created.


CPU #1
======

CPU #1 has on-board keyboard and mouse capabilities, plus an expansion slot for
supporting an SD card. The CPU 1 keyboard and mouse hardware is compatible with
various Parallax boards, but in any case a comboKeyboard driver (written by 
Mike Green) is used by all targets offering Keyboard support. The mouse support
is provided by a driver derived from the standard Parallax driver.

The optional SD Card adapter can be used both to store and load programs, 
and also act as a file system accessible to Catalina C programs. 

CPU #1 has pins dedicated for communicating with CPU #2. Catalina uses two pins
for serial comms with CPU #2, and one pin for resetting CPU #2. 

Catalina PC and PPROPTERMINAL HMI plugins supports the use of serial comms 
for the HMI in place of such dedicated HMI hardware and can be used for
CPU #1. 

In addition, there are "proxy" HMI drivers that can give programs running
on CPU #1 access to the HMI devices on CPU #2.

CPU #1 supports up to 32Kb of SPI (i.e. serial) RAM, and 1MB of SPI FLASH. 
These serial memory devices are much slower than the parallel memory devices 
that are normally used for XMM RAM, but a caching SPI driver is provided to 
speed up access. This caching driver is optional when using only the SPI RAM, 
but MUST be used to access the SPI FLASH.

Catalina can use the SPI devices on CPU #1 in several combinations for running
XMM programs. By default, the SMALL and LARGE layouts will use only the SPI
RAM as XMM RAM. They will not use the SPI FLASH, and they will access the SPI 
RAM directly, which can be quite slow. For example:

   catalina hello_world.c -lc -C MORPHEUS -C CPU_1 -C LARGE

This can be modified in two ways. First, you can enable the caching XMM driver 
(e.g. by defining the the CACHED symbol):

    catalina hello_world.c -lc -C MORPHEUS -C CPU_1 -C LARGE -C CACHED

Also, for larger programs you can also enable the use of SPI FLASH. Note that
the cache must also be enabled (you cannot use SPI FLASH without also using 
the cache):

   catalina hello_world.c -lc -C MORPHEUS -C CPU_1 -C LARGE -C CACHED -C FLASH

The -P and -R command line options can be used to move the base address of the
read/write (-P) and read-only (-R) segments. However, when building programs 
with the symbol MORPHEUS defined, these will default to the correct values.

The size of the cache used can be set by defining one of the following symbols 
on the Catalina command line:

    CACHED_1K : allocate a 1K cache
    CACHED_2K : allocate a 2K cache
    CACHED_4K : allocate a 4k cache
    CACHED_8K : allocate an 8k cache 
    CACHED    : (same as CACHED_8K)
    
Generally, the larger the cache, the faster the resulting program is likely to
execute, but the cache also consumes a considerable proportion of Hub RAM which
some programs cannot space - so the cache should be as small as possible. Also
note that the caching driver consumes an additional cog!

CPU #2
======

CPU #2 has a VGA display, but no keyboard, mouse or SD card support. Also, the 
VGA port allows 8 colour bits as opposed to the more common 6 bits, and this
means that the standard Parallax drivers cannot be used. However, Catalina 
provides a special High resolution VGA driver for use with this VGA port.

Catalina PC and PPROPTERMINAL HMI plugins supports the use of serial comms 
for the HMI in place of such dedicated HMI hardware and can be used for
CPU #2. 

In addition, there are "proxy" HMI drivers that can give programs running
on CPU #2 access to the devices on CPU #1.

CPU #2 has up to 8MB SRAM that can be used as XMM RAM (with the MEM+ expansion
board installed). 


For More Information
====================

Refer to the "Getting Started with Catalina" for more information about
using Catalina on a multi-CPU system like the TriBladeProp.


License
=======

This Catalina Target Package (CTP) is provided under the GNU Lesser Public 
License, with the following specific exceptions:

•	Use of the Catalina Binder (or any other tool) to combine application 
   components with Catalina Target Package components does not constitute 
   a derivative work and does not require the author to provide source code 
   for the application, or provide the ability for users to link their 
   applications against a user-supplied version of the CTP.

   However, if you link the application to a modified version of the CTP, 
   then the changes to the CTP must be provided under the terms of the LGPL
   in sections 1, 2, and 4.

•	You do not have to provide a copy of the CTP license with applications
   that incorporate the CTP, nor do you have to identify the CTP license in
   your program or documentation as required by section 6 of the LGPL.

   However, applications must still identify their use of the CTP. The 
   following example statement can be included in user documentation to
   satisfy this requirement:

      [application] incorporates components provided as part of the 
      Catalina C Compiler for the Parallax Propeller.

A full copy of the LGPL is included in the file called COPYING.LESSER, and 
is also available from http://www.gnu.org/licenses.             

