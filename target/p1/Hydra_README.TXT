Hydra Catalina Target Package
=============================

This file contains notes specific to the support of the Hydra platform provided
by this target package.

Hydra support is enabled by either adding the option -C HYDRA to each 
catalina command line, or by adding HYDRA to the CATALINA_DEFINE environment 
variable.

The Hydra can be configured for both VGA and TV outputs, but HiRes TV output
is the default.

The Hydra keyboard and mouse hardware is different to many other platforms, 
but all the targets with keyboard support use the comboKeyboard driver
(written by Mike Green) to hide those differences. Unfortunately, there
is no equivalent comboMouse driver, so Hydra targets with mouse support
must all use a mouse driver derived from the Hydra mouse driver.

Catalina includes the Catalyst SD Loader program that can be used to load 
programs from the onboard SD Card. This loader can load either normal SPIN 
programs or Catalina programs. Programs that fit into 31k (such as Catalina 
LMM programs) require no special handling. Catalyst also also knows how to 
load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards - but 
as there is not much call for FAT12 these days, it is currently disabled to 
save code space.

Note that on the Hydra, the SD Card is an optional card, as is the 512K SRAM 
card. However, note that both cards cannot be used at the same time. Also note 
that when an optional card is in use, neither the VGA output nor the normal 
serial port can be used. However, Catalina makes special provision for using 
the mouse port as a serial port, so that XMM programs can be loaded via the
mouse port, and debugged using the BlackBox serial debuggers via the mouse 
port. 


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
