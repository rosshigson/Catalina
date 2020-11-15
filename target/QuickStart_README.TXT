QuickStart Catalina Target Package
==================================

This file contains notes specific to the support of the Parallax QuickStart
board, with the QuickStart Human Interface board installed. It also supports
the Parallax Memory Card.

QuickStart support is enabled by either adding the option -C QUICKSTART to 
each catalina command line, or by adding QUICKSTART to the CATALINA_DEFINE 
environment variable - e.g:

   catalina hello_world.c -lc -C QUICKSTART

The QuickStart board itself supports only serial comms HMI options, such as 
the TTY, PC and PROPTERMINAL options. However, when equipped with the Human
Interface board, all HMI options are supported, as well as an SD Card. 
The default HMI option is HiRes TV.

To enable the use of the Propeller Memory Card, a seprate PMC symbol must
also be specified on the command line - e.g:

   catalina hello_world.c -lc -C QUICKSTART -C PMC

The PMC symbol enables the XMM RAM support, and also changes the pins used
for the SD Card (since the pins are different between the Human Interface
Board and the Propeller Memory Card). When using XMM RAM, the cache must also
be used, so a complete command line would be something like:

   catalina hello_world.c -lc -C QUICKSTART -C PMC -C LARGE -C CACHED

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
