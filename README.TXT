Catalina release 4.7 is a full release. You can install this over an existing
version of Catalina, but it is recommended that you instead uninstall any
previous Catalina release before installing, or install this release to a 
different location. 

If you are installing under Linux, you should execute the following command 
to set your permissions correctly after installing (this command is a script 
in the Catalina bin directory, and may itself need to have its permissions 
manually set to allow execution):

   Set_Linux_Permissions

The following changes have been made since the previous release of Catalina. 
If you have not used a previous release of Catalina, you can ignore the
following list:

RELEASE 4.7

1. p2_asm now enables the -v33 option to p2asm by default. This enables the
   latest PASM assembly code, and would nearly always be what you want to do. 
   To revert to the previous behaviour, edit the file p2_asm.bat.

2. Dumbo basic updated to version 1.0, which implements much more of the
   original GWBASIC syntax. See the README.TXT file in the catalyst\dumbo
   directory for more details.

3. Added the 8 port serial driver. This driver is only supported on the
   Propeller 2. It supports up to 8 serial ports on the Propeller 2. See 
   the Catalina Propeller 2 Reference Manual for more details.

4. Fixed a bug in the 2 port serial driver that meant the second port would
   not receive characters correctly.

5. Fixed a bug in the serial2 and serial4 demo programs which meant they may 
   not have worked if they were compiled with threading enabled.

6. The build_all scripts in all the serial demo directories (i.e. serial2, 
   serial4 & serial8) will now only build the demos for the correct propeller. 
   The serial2 and serial8 libraries are only supported on the Propeller 2, 
   and serial4 is only supported on the Propeller 1.

7. Modified the catalina_cog.h include file to fix a name collision with
   propeller2.h. On the Propeller 2, library functions that are defined
   in propeller2.h are now not also defined in catalina_cog.h

8. Added smartpins.h to define the smartpins modes for the Propeller 2.

9. Added an implementation of _muldiv64(), to match the SPIN MULDIV64 function.





