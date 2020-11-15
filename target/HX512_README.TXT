Hydra Xtreme 512K SRAM Card Catalina Target Package
===================================================

This file contains notes specific to the support of the Hydra Xtreme 512k
SRAM Card provided by this target package.

The Hydra Xtreme (HX512) contains 512Kb of SRAM. However (as shipped) the 
Xtreme only allows random access of the first 64kb, which only allows 
Catalina programs to have code segments up to 64kb (plus data segments of 
up to 32kb).

To use the full 512Kb as addiitonal program code space, a new set of firmware 
needs to be programmed into the HX512.

This firmware is included in the utilities directory of this release in a file 
called 'Extended_Addressing_PLD_V0.1.zip' - this modification was developed by 
Eric Moyer, and is described in the thread "Extended addressing for Extreme 
512K" (http://forums.parallax.com/showthread.php?t=95106)

Note that installing this firmware requires a special programming cable - 
see the HX512 documentation for more details, and also note the errata posted
in the thread "Building the Lattice ISP Programmer (aka CPLD prgramming cable)
for the Hydra HX512" (http://forums.parallax.com/showthread.php?t=113554)

This board support package is designed to be used in conjunction with the
Hydra or Hybrid platforms, which provide an expansion slot specifically for
the HX512. Howeverm the HX512 can also be adapted to other Propeller 
development boards with sufficient free pins. 

The files relevant to the HX512 in this target package are:

   HX512_README.TXT       This file
   HX512_XMM_DEF.inc      The pin and XMM Memory definitions for this board
   HX512_XMM_CFG.inc      #defines to configure other Catalina plugins
   HX512_XMM.inc          The XMM API code for this board

The Catalina files DEF.inc, CFG.inc and XMM.inc have also been modified to 
include these files when the HX512 symbol is defined.

This package assumes the board is connected to a Hydra or Hybrid board, but it
can be adapted to other boards by changing the XMM RAM and pin definitions in 
HX512_XMM_DEF.inc. 

For historical reasons, when the Hydra or Hybrid base platforms are used, the 
HX512 is selected automatically whenever XMM RAM is implied by the other 
command line options. On other platforms, it must be specifed by defining the 
symbol HX512 IN ADDITION TO the symbol used for the base platform. For example,
your compilation command for the Propeller Platform (PP) might look like:

     catalina hello_world.c -lc -C PP -C HX512

The HX512 supports both the SMALL and LARGE memory model. Both require that 
the cache be used, but either just the SRAM can be used, or just the FLASH, or 
both. For example, on the Hydra:

  To use only the SRAM (for code):

     catalina hello_world.c -lc -C HYDRA -C CACHED -C SMALL

  To use only the SRAM (for code and data):
  
     catalina hello_world.c -lc -C HYDRA -C CACHED -C LARGE

  To use only the FLASH (for code):

     catalina hello_world.c -lc -C HYDRA -C CACHED -C SMALL -C FLASH

  To use both the SRAM (for data) and the FLASH (for code):

     catalina hello_world.c -lc -C HYDRA -C CACHED -C LARGE -C FLASH

On platforms other than the HYDRA or HYBRID, the symbol HX512 will also be
required - for example, on the Propeller Platform (PP):

     catalina hello_world.c -lc -C PP -C HX512 -C CACHED -C SMALL

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
