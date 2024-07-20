This directory contains a demo program for the Catalina implementation of
Mike Green's SPI/I2C driver (sdspiFemto). 

This driver is supported only on the Propeller 1.

The plugin itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libspi". To use the plugin, all you need to do is link your program with this
library - the plugin will be loaded automatically.

There is only one C program in this folder (test_spi.c). To build it, use the 
"build_all" command, specifying the platform for which you want to build (e.g.
C3, HYDRA, HYBRID, TRIBLADEPROP CPU_1 etc).

For example:

   build_all HYBRID
or
   build_all HYDRA COMPACT
or
   build_all TRIBLADEPROP CPU_2
or
   build_all C3 TTY

The following programs are built: 

   test_spi -     A test program that uses the spi driver to test both the
                  EEPROM on the I2C bus, and an SD Card on the SPI bus 
                  (Note: On the C3, which requires special logic to use
                  the SD Card, only the I2C bus is tested).

   dump_eeprom - a program that uses the I2C bus to dump the contents
                 of the EEPROM (should work on all platforms).

NOTES ON THE libspi LIBRARY:
============================

The spi functions are intended to be equivalent to the functions in the Spin 
version of this driver, but are prefixed by "spi_". For details, see the 
include file (in the directory 'Catalina\include') called 'catalina_spi.h'.

