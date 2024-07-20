Minimal Catalina Target Package
===============================

This directory contains a much simplified Propeller 1 target package that 
supports only the Catalina LMM TINY memory model. It is intended to be used 
to understand how Catalina programs are built, and also as an example to 
assist people who wish to develop their own Catalina targets or plugins.

There are some demo programs that use this minimal target package in the
directory demos\minimal subdirectory. To compile them, use the build_all 
batch file. For example, from a Catalina Command Line on Windows, you
might say:

   cd %LCCDIR%\demos\minimal
   build_all

You can also use this target directory simply by adding -T <directory> to a 
normal Catalina command, such as:

   cd %LCCDIR%\Catalina\demos
   catalina -T "%LCCDIR%\minimal" -lc test_leds.c 

However, if you intend using it for multiple commands, it is easier to set
the CATALINA_TARGET environment variable. To do this, within a command 
window under Windows, type:

   set CATALINA_TARGET=%LCCDIR%\minimal

NOTE: Do not use quotes when specifying the target in the above command!

Under Linux, type:

   CATALINA_TARGET=/opt/catalina/minimal; export CATALINA_TARGET

You can use the 'catalina_env' command to display the current setting. To do 
this, type:

   catalina_env

You should see something like this:

   CATALINA_DEFINE  = [default]
   CATALINA_INCLUDE = [default]
   CATALINA_LIBRARY = [default]
   CATALINA_TARGET  = "C:\Program Files (x86)\Catalina\minimal"
   CATALINA_LCCOPT  = [default]
   CATALINA_TEMPDIR = [default]
   LCCDIR           = "C:\Program Files (x86)\Catalina"


The files in this directory are a fully functional target, but are 
intentionally minimalist as they are intended as an educational aid. 

This target directory has the following limitations over the "normal"
Catalina target directory:

   - It only supports a single platform. To specify the details of your
     platform, edit the Custom_DEF.inc file.

   - It does not support any debug targets (POD or BlackBox).

   - It does not support programs that must accept command line variables.

   - It only supports LMM TINY programs (not CMM, XMM SMALL or XMM LARGE).

   - It only supports the simple serial loader (not EEPROM, SDCARD or FLASH)

   - It does not support the ALTERNATE or THREADED kernels.

   - It only includes one Generic Plugin, which is enabled by defining the 
     symbol PLUGIN on the command line, and which is defined in the file 
     Catalina_Plugin.spin.

Here is a list of the files in this target directory, and their purpose:

   Catalina_Common.spin - common definitions for all platforms
   Custom_DEF.inc       - platform-specific definitions (PIN definitions etc).
   Custom_CFG.inc       - platform-specific configurations (for plugins etc).
   catalina_default.s   - PASM code for programs using the default target.
   Catalina_LMM.spin    - the LMM kernel (will be included with all programs).
   Catalina_Plugin.spin - a Generic Plugin (to demonstrate how to create one).
   Extras.spin          - load and start all plugins.
   lmm_default.spin     - the default LMM target.
   lmm_progbeg.s        - PASM code that must go BEFORE a compiled LMM program.
   lmm_progend.s        - PASM code that mist go AFTER a compiled LMM program.
   README.txt           - this file!


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
