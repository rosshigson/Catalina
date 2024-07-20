Embedded Catalina Target Package
================================

This directory contains a Catalina Target Package intended to support a single 
custom Propeller 1 platform in embedded applications. 

Since this target package is intended only to support one platform, there is
no need to specify the CUSTOM symbol on the command line - it is assumed.

All the usual Catalina memory models (LMM, XMM SMALL, XMM LARGE) and loaders
(simple serial, SDCARD, EEPROM, FLASH) are supported.

To use the "embedded" target package (instead of the "standard" target package)
simply specify the path using the -T option on the catalina command line on 
each compile, or specify it in the CATALINA_TARGET environment variable. Note 
that on the command line, the path must be quoted if it contains spaces, but 
not in the environment variable. 

For example:

   catalina test.c -lc -T "c:\Program Files (x86)\Catalina\embedded"

or
   set CATALINA_TARGET = c:\Program Files (x86)\Catalina\embedded
   catalina test.c -lc


The embedded target includes the potential to support an XMM-enabled platform, 
but the current XMM API implementation is a dummy, and will simply report that
XMM is not supported. It will have to be modified to suit the actual Propeller 
platform. To do this, modify the Custom_XMM.inc file.

The Custom platform is assumed to have a 5Mhz clock, and use clock modes xtal1 
and pll16x (i.e. and run at 80Mhz) - this is suitable for many Propeller
platforms, including the Parallax QuickStart board. if this is not correct, 
change the clock values in the Custom_DEF.inc file.

The embedded target loads no plugins other than those required to achieve ANSI 
compatibility (i.e. the floating point and SD card plugins). In particular, 
there are no HMI plugins, which significantly simplifies the target package, 
and makes the embedded target suitable for use in deeply embedded applications. 

If additional plugins are required, they can be loaded by specifying them in 
the file Extras.spin - examples of loading plugins are included (the two
examples used are the Real-Time Clock plugin and the 4 Port Serial plugin).

A good way to demonstrate the target package is to compile the test program
for the 4 port serial plugin, but using the embedded target package instead of
the default one - to do this, go to the demos\serial4 subdirectory, and then
use a command like:

   catalina -lci -lserial4 test_serial4.c -T "%LCCDIR%\embedded"

Then load the program using the Payload loader in interactive mode:

   payload test_serial4 -i


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
