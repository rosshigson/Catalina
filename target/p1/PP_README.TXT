Propeller Platform Catalina Target Package
==========================================

This file contains notes specific to the support of the Gadget Gangster 
Propeller Platform provided by this target package.

Gadget Gangster support is enabled by either adding the option -C PP to each 
catalina command line, or by adding PP to the CATALINA_DEFINE environment 
variable - e.g:

   catalina hello_world.c -lc -C PP

The PP is assumed to have a 5Mhz clock, and use clock modes xtal1 and pll16x 
(i.e. and run at 80Mhz) - if this is not correct, change the clock values in 
Catalina_Common.spin.

The PP support also includes the "El Jugador" expansion board, which adds
TV output, Audio output and 2 Gamepad ports.

All PP targets have been configured to use the HIRES_TV HMI option by default.

Since the PP has neither keyboard nor mouse ports, the PP_HMI.inc file contains
the following lines, which prevent the loading of either the keyboard or mouse 
plugins. If you add these devices to your PP, simply configure the correct pin 
definitions in PP_DEF.inc and delete the following lines from PP_HMI.inc:

   ' PP has no mouse
   #ifndef NO_MOUSE
   #define NO_MOUSE
   #endif

   ' PP has no keyboard
   #ifndef NO_KEYBOARD
   #define NO_KEYBOARD
   #endif


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
