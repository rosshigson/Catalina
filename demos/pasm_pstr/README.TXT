This directory contains demo programs for Catalina's _PSTR macro. 

This macro is supported on both the Propeller 1 and 2, but these demo programs
expect to use an EEPROM on an I2C bus and and will work only on a Propeller 1
with an EEPROM of 64k or larger (which includes most if not all Propeller 1 
platforms).

To build the demos, use the "build_all" command, specifying the Propeller 1
platform for which you want to build (e.g. C3) any any other options, such
as HMI opions.  They expect to use a serial HMI option. Do not specify a 
memory model - the programs must be built as SMALL programs that use the 
XEPROM XMM drivers.

For example:

   build_all C3
or
   build_all C3 TTY

The following programs are built: 

   loadmenus -  A program that loads menu data into the upper area of the 
                EEPROM. The default address is 16384.

   readmenus -  A program that uses the I2C bus to display the contents
                of the EEPROM at a specified address. The default address
                is 16384.

These programs are built to use XEPROM mode, and must be loaded using
Catalina's EEPROM loader. To build that, run the 'build_utilities' script, 
and specify your platform. Then execute the demos as follows:

  payload EEPROM loadmenus
  payload EEPROM readmenus -i VT100

Note that loadmenus produces no output, and that readmenus displays the menu
data loaded using loadmenus but does not accept any input (despite what the
screen says!). the output from readmenus is best displayed using a VT100 
emulator. Using the interactive terminal mode of payload (i.e. by adding the 
-i option instead of -I vt100) is sufficient to demonstrate the programs are 
working, but some of the menu data will not be displayed correctly because 
payload's interactive mode does not do full VT100 emulation.
