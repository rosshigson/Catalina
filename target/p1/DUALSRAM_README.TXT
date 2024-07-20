DualSRAM Catalina Target Package
================================

This file contains notes specific to the support of the DualSRAM XMM RAM
add-on board provided by this target package.

The DualSRAM board was developed by @Wingineer19. It contains two 512kb SRAM
SPI memory chips and two EEPROMs, which may be 128kb or 256kb.
 
It is not a complete propeller board, but is designed to be used in
conjunction with another board, such as a FLiP mdule. 

The files relevant to the DualSRAM in this target package are:

   DUALSRAM_README.TXT       This file
   DUALSRAM_XMM_DEF.inc      The pin and XMM Memory definitions for this board
   DUALSRAM_XMM_CFG.inc      #defines to configure other Catalina plugins
   DUALSRAM_XMM.inc          The XMM API code for this board

The Catalina files DEF.inc, CFG.inc and XMM.inc have also been modified to 
include these files when the DUALSRAM symbol is defined.

The DualSRAM is used by specifying the symbol DUALSRAM, IN ADDITION TO the 
symbol used for the base platform. For example. if your base platform is a 
FLiP module, your compilation command might look like:

     catalina hello_world.c -lc -C FLIP -C DUALSRAM

The RamPage2 supports both the SMALL and LARGE memory model. Using the cache
is optional.

  To use the SRAM in direct mode:

     catalina hello_world.c -lc -C FLIP -C DUALSRAM -C SMALL
  or
     catalina hello_world.c -lc -C FLIP -C DUALSRAM -C LARGE

  To use the SRAM in cached mode:
  
     catalina hello_world.c -lc -C FLIP -C DUALSRAM -C CACHED -C SMALL
  or
     catalina hello_world.c -lc -C FLIP -C DUALSRAM -C CACHED -C LARGE

Of course, the Catalina utilities have to be compiled with the same cache 
options as the program is compiled to use. This can be done using the 
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

