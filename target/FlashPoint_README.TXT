FlashPoint (SuperQuad & RamPage) Catalina Target Package
========================================================

This file contains notes specific to the support of the FlashPoint XMM boards
(RamPage and SuperQuad) provided by this target package.

Both the RamPage and the SuperQuad are XMM add-on modules, not complete 
propeller platforms. The SuperQuad provides 2Mb of FLASH RAM, and the 
RamPage provides 2Mb of Flash RAM and 128Kb of SRAM. They can be used on
any Propeller platform with 6 (SuperQuad) or 8 (RamPage) free contiguous 
I/O pins. Note that 2 additional pins are required in each case if power
is to be supplied to the boards via I/O pins.

In many respects the two boards are very similar, so they share a common set 
of "FlashPoint" configuration files. The files relevant to both the RamPage 
and SuperQuad in this target package are:

   FlashPoint_README.TXT      This file
   FlashPoint_XMM_DEF.inc     The pin and XMM Memory definitions for this board
   FlashPoint_XMM_CFG.inc     #defines to configure other Catalina plugins
   FlashPoint_XMM.inc         The XMM API code for this board

The SuperQuad supports the Catalina SMALL memory model. The RamPage supports
both the SMALL and LARGE memory model. Both require that the cache be used.
On the RamPage, either SRAM or FLASH, or both, can be used.

The configuration files provided are suitable use with a Propeller Platform,
using pins P8-P15 (SuperQuadPage) or P6-P15 (RamPage). Note that power is
provided via Prop I/O pins in both cases. These pin definitions can be changed
to suit other platforms in the definitions file (FlashPoint_XMM_DEF.inc).

Note that when configuring the SuperQuad or RamPage, you must not only
specify the pins, you must also specify whether or not the lower nibble and
the upper nibble of each byte needs to be shifted left or right to align with 
the signal pins SIO0 .. SIO3, plus whether or not the order of the signal pins
is reversed (e.g. when using the pin definitions given above for the C3, the 
SuperQuad signal pins are reversed but the RamPage signal pins are not), plus
whether or not the Vss and Vdd are connected to Prop I/O pins or to the 
appropriate power rails.

The SuperQuad and RamPage are used by specifying the appropriate symbol
(SUPERQUAD or RAMPAGE) IN ADDITION TO the symbol used for the base platform. 
For example, if using the Propeller Platform (PP) as your base paltform, your 
compilation command might look like:

     catalina hello_world.c -lc -C PP -C SUPERQUAD

The SuperQuad supports only the SMALL memory model, but the RAMPAGE supports 
both the SMALL and LARGE memory model. Both boards require that the cache be 
used, but on the RAMPAGE, either just the SRAM can be used, or just the FLASH, 
or both. For example:

  To use only the SRAM (for code):

     catalina hello_world.c -lc -C PP -C RAMPAGE -C CACHED -C SMALL

  To use only the SRAM (for code and data):
  
     catalina hello_world.c -lc -C PP -C RAMPAGE -C CACHED -C LARGE

  To use only the FLASH (for code):

     catalina hello_world.c -lc -C PP -C RAMPAGE -C CACHED -C SMALL -C FLASH

  To use both the SRAM (for data) and the FLASH (for code):

     catalina hello_world.c -lc -C PP -C RAMPAGE -C CACHED -C LARGE -C FLASH

Of course, the Catalina utilities have to be compiled with the same cache and
Flash options as the program is compiled to use. This can be done using the 
"build_utiliites" command.


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
