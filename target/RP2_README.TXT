RamPage2 Catalina Target Package
================================

This file contains notes specific to the support of the RamPage2 XMM RAM board
provided by this target package.

The RamPage2 (RP2) contains 4Mb Flash RAM, 256Mb of SRAM and a mini SD Card. 
It is not a complete propeller board, but is designed to fit on a Propeller 
Platform or a QuickStart board. It can also be adapted to any other Propeller 
development board with sufficient free pins. 

The files relevant to the RamPage2 in this target package are:

   RP2_README.TXT       This file
   RP2_XMM_DEF.inc      The pin and XMM Memory definitions for this board
   RP2_XMM_CFG.inc      #defines to configure other Catalina plugins
   RP2_XMM.inc          The XMM API code for this board

The Catalina files DEF.inc, CFG.inc and XMM.inc have also been modified to 
include these files when the RP2 symbol is defined.

This package assumes the board is connected to a Propeller Platform board, but 
it can be adapted to other boards by changing the XMM RAM and FLASH pin 
definitions in RP2_XMM_DEF.inc. Note that the SD Card Pin definitions are not 
in this file - they will need to be modified in the XXX_DEF.inc file for the 
appropriate base platform (e.g. PP_DEF.inc).

The RamPage2 is used by specifying the symbol RP2, IN ADDITION TO the symbol 
used for the base platform. For example, if you are using the RamPage2 with 
the Propeller Platform (PP), your compilation command might look like:

     catalina hello_world.c -lc -C PP -C RP2

Note that both the RP2 and the PP contain an SD card slot. Both the QuickStart
Human Interface Board and PP board support files have been modified so that if
RP2 is specified, the SD card slot on the RamPage2 is used in place of the SD 
card slot on the base platform board or QuickStart Human Interface Board.

The RamPage2 supports both the SMALL and LARGE memory model. Both require that 
the cache be used, but either just the SRAM can be used, or just the FLASH, or 
both. For example, assuming the RamPage2 is used with the Propeller Platform 
(PP):

  To use only the SRAM (for code):

     catalina hello_world.c -lc -C PP -C RP2 -C CACHED -C SMALL

  To use only the SRAM (for code and data):
  
     catalina hello_world.c -lc -C PP -C RP2 -C CACHED -C LARGE

  To use only the FLASH (for code):

     catalina hello_world.c -lc -C PP -C RP2 -C CACHED -C SMALL -C FLASH

  To use both the SRAM (for data) and the FLASH (for code):

     catalina hello_world.c -lc -C PP -C RP2 -C CACHED -C LARGE -C FLASH

If the RamPage2 is used with the QuickStart board, replace PP with QUICKSTART
in the above commands.

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
