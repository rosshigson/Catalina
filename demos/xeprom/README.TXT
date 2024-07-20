This directory contains demo programs for how to read data from the EEPROM
when using the Catalina XEPROM mode, which allows the EEPROM to be used to
execute XMM programs. Note that this requires an EEPROM larger than 32kb,
and that XEPROM mode is currently supported only on the Propeller 1.

There are two C programs in this folder (estring.c and elong.c). To build the 
programs, use the "build_all" command, specifying the platform for which you 
want to build (C3, HYBRID etc). Do not specify a memory model to the command - 
the programs must use the SMALL XMM memory model.

For example:

   build_all HYDRA
or
   build_all C3 TTY

The following programs will be built: 

   estring    - a C demo program that demonstrates reading strings from EEPROM.

   elong      - a C demo program that demonstrates reading longs from EEPROM, 
                and also the difference between reading a long from the EEPROM
                versus reading it from Hub RAM.

Note that you need a platform with an EEPROM larger than 32kb, and you need
a method of programming the resulting binary into the EEPROM. On the Hydra 
you can use the Hydra Asset Manager to do this. On other platforms you can
use the build_utilities command and then use the EEPROM program loader. 

For example:
   build_utilities                   <== specify your platform and options
   payload -i EEPROM estring.binary  <== assumes you used a serial HMI option
 

