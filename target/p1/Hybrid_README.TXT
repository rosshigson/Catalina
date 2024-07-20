Hybrid Catalina Target Package
==============================

This file contains notes specific to the support of the Hybrid platform 
provided by this target package.

Hybrid support is enabled by either adding the option -C HYBRID to each 
catalina command line, or by adding HYBRID to the CATALINA_DEFINE environment 
variable.

The Hybrid has only TV output (i.e. no VGA), and HiRes TV output is the default.

The Hybrid keyboard and mouse hardware is compatible with various Parallax
boards, but a comboKeyboard driver (written by Mike Green) is used by all
targets with Keybaord support. The mouse support is provided by a driver
derived from the standard Parallax driver.

Catalina includes the Catalyst SD Loader program that can be used to load 
programs from the onboard SD Card. This loader can load either normal SPIN 
programs or Catalina programs. Programs that fit into 31k (such as Catalina 
LMM programs) require no special handling. Catalyst also also knows how to 
load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards - but 
as there is not much call for FAT12 these days, it is currently disabled to 
save code space.

Note that on the Hybrid, the 512K SRAM is an optional card, and when such a
card is in use, the normal serial port cannot be used. However, Catalina 
makes special provision for using the mouse port as a serial port, so that 
XMM programs can be loaded via the mouse port, and debugged using the 
BlackBox serial debugger via the mouse port. 


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
