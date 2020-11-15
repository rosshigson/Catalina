RamBlade Catalina Target Package
=================================

This file contains notes specific to the support of the RamBlade platform 
provided by this target package.

RamBlade support is enabled by either adding the option -C RAMBLADE to each 
catalina command line, or by adding RAMBLADE to the CATALINA_DEFINE 
environment variable.

The RamBlade has none of the usual external TV, VGA or Keyboard/Mouse drivers,
but it does support serial I/O, so only the PC and PROPTERMINAL HMI options 
can be used. The PC HMI option is used by default. 

The RamBlade contains an onboard micro SD Card interface.

The RamBlade contains 512Mb of SRAM which can be used to run XMM programs.

The RamBlade generally comes with multiple crystals that can be used to
achieve various speeds above the normal 80Mhz clock (e.g. 100Mhz or 108Mhz).
However, by default, Catalina is configured for a 100Mhz clock (using a 
6.25Mhz crystal using xtal1 mode and pll16x). If you have a different crystal
installed you will need to edit the RamBlade_DEF.inc file and select the 
appropriate clock speed.

The Catalyst directory contains an SD Loader program that can be used in 
conjunction with the onboard SD Card to load either normal SPIN programs or 
Catalina programs from an SD Card. Programs that fit into 31k (such as 
Catalina LMM programs) require no special handling. Catalyst also also 
knows how to load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards 
- but as there is not much call for FAT12 these days, it is currently disabled
to save code space.



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

