Propeller Memory Card Catalina Target Package
=============================================

This file contains notes specific to the support of the Propeller Memory Card
XMM RAM board provided by this target package.

The Propeller Memory Card (PMC) contains 4Mb of Flash RAM, 128Mb of SRAM and a 
mini SD Card. It is not a complete propeller board, but is designed to fit on 
a QuickStart Human Interface Board. It can also be adapted to other Propeller 
development boards with sufficient free pins. 

The files relevant to the Propeller Memory Card in this target package are:

   PMC_README.TXT       This file
   PMC_XMM_DEF.inc      The pin and XMM Memory definitions for this board
   PMC_XMM_CFG.inc      #defines to configure other Catalina plugins
   PMC_XMM.inc          The XMM API code for this board

The Catalina files DEF.inc, CFG.inc and XMM.inc have also been modified to 
include these files when the PMC symbol is defined.

This package assumes the board is connected to a QuickStart Human Interface
board, but it can be adapted to other boards by changing the XMM RAM and
FLASH pin definitions in PMC_XMM_DEF.inc. Note that the SD Card Pin definitions
are not in this file - they will need to be modified in the XXX_DEF.inc file 
for the appropriate base platform (e.g. QuickStart_DEF.inc).

The Propeller Memory Card is used by specifying the symbol PMC IN ADDITION TO
the symbol used for the base platform. For example, your compilation command 
might look like:

     catalina hello_world.c -lc -C QUICKSTART -C PMC

Note that both the PMC and the QuickStart Human Interface Board contain an SD 
card slot. The QuickStart board support files have been modified so that if PMC
is specified, the SD card slot on the PMC is used in place of the SD card slot 
on the QuickStart Human Interface Board.

The PMC is also compatible with the Demo baord (which by itself has no SD Card):

     catalina hello_world.c -lc -C DEMO -C PMC

The Propeller Memory Card supports both the SMALL and LARGE memory model. Both 
require that the cache be used, but either just the SRAM can be used, or just 
the FLASH, or both. For example:

  To use only the SRAM (for code):

     catalina hello_world.c -lc -C QUICKSTART -C PMC -C CACHED -C SMALL

  To use only the SRAM (for code and data):
  
     catalina hello_world.c -lc -C QUICKSTART -C PMC -C CACHED -C LARGE

  To use only the FLASH (for code):

     catalina hello_world.c -lc -C QUICKSTART -C PMC -C CACHED -C SMALL -C FLASH

  To use both the SRAM (for data) and the FLASH (for code):

     catalina hello_world.c -lc -C QUICKSTART -C PMC -C CACHED -C LARGE -C FLASH

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
