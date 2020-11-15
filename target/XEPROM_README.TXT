XMM Executed from EEPROM (XEPROM) Catalina Target Package
=========================================================

This file contains notes specific to the support for executing XMM code from
EEPROM provided by this target package.

Executing XMM Code from EEPROM can be done on any Propeller provided that it 
has an EEPROM larger than 32Kb. 

A two-phase approach to loading XEPROM programs is used - the first 32Kb is 
loaded into Hub RAM first (as normal) but all this initial phase does is load
and start the plugins, loads the data segments from the EEPROM into Hub RAM, 
then loads and starts the XMM Kernel which executes the XMM code (which 
remains in the EEPROM).

The files relevant to executing XMM xode from EEPROM in this target package are:

   XEPROM_README.TXT       This file
   XEPROM_XMM_DEF.inc      The pin and XMM Memory definitions for this board
   XEPROM_XMM_CFG.inc      #defines to configure other Catalina plugins
   XEPROM_XMM.inc          The XMM API code for this board

Also, there is a specific loader (Catalina_XMM_XEPROM_Loader.spin) used for 
loading and executing XEPROM programs, which is included automatically by 
the xmm_default.spin and xmm_blackcat.spin programs (although note that 
debugging programs executing from EEPROM is not supported yet).

The Catalina files DEF.inc, CFG.inc and XMM.inc have also been modified to 
include these files when the XEPROM symbol is defined.

Execution from EEPROM option supports only the SMALL memory model, and it
also requires that the cache be used. Execution from EEPROM is specified
by defining the symbol XEPROM. Note that the XEPROM symbol must be specifed 
IN ADDITION TO the symbol used for the base platform. 

For example, a compilation command to use XEPROM on the QuickStart Platform 
(QUICKSTART) might look like:

     catalina hello_world.c -lc -C QUICKSTART -C SMALL -C XEPROM -C CACHED

As usual, the Catalina utilities have to be compiled for the platform. This 
can be done using the "build_utiliites" command. This will compile the EEPROM
loader, which can then be used (in conjunction with payload) to load the XMM
program into EEPROM. For example, after executing build_utilities, loading 
the above program might use a command such as:

    payload EEPROM hello_world -i

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
