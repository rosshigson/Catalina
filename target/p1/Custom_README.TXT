Custom Catalina Target Package
==============================

This file contains notes specific to the Custom Propeller platform.

By default, the settings in the Custom files are suitable for just about any 
Propeller platform that uses a 5Mhz clock, such as the Parallax QuickStart or 
Demo boards, but are intended to be changed to suit the specific platform used.

Custom support can be enabled by either adding the option -C CUSTOM to each 
catalina command line, or by adding ACTIVITY to the CATALINA_DEFINE 
environment variable - e.g:

   catalina hello_world.c -lc -C CUSTOM

Note that CUSTOM is the default if no other platform is specified, so the same
effect can be achieved by simply saying:

   catalina hello_world.c -lc

The Custom platform currently supports only serial comms HMI options, such as 
the TTY, PC amd PROPTERMINAL options (the default is TTY). 

The Custom platform has no intrinsic XMM RAM support defined, but can be used 
with any existing XMM add-on board, such as the HX512, Propeller Memory Card, 
RamPage or SuperQuad.

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
