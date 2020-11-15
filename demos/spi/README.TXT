This directory contains a demo program for the Catalina implementation of
Mike Green's SPI/I2C driver (sdspiFemto). 

The plugin itself (like other plugins) is in the catalina target directory,
and the wrapper functions needed to access it are in a library called 
"libspi". To use the plugin, all you need to do is link your program with this
library - the plugin will be loaded automatically.

There is only one C program in this folder (test_spi.c). To build it, use the 
"build_all" command, specifying the platform for which you want to build (e.g.
HYDRA, HYBRID, TRIBLADEPROP CPU_1 etc).

For example:

   build_all HYBRID
or
   build_all HYDRA COMPACT
or
   build_all TRIBLADEPROP CPU_2

The following programs are built: 

   test_spi.binary - a compiled version of the C demo program that uses 
                     the spi driver.

NOTES ON THE libspi LIBRARY:
============================

The spi functions are intended to be equivalent to the functions in the Spin 
version of this driver, but are prefixed by "spi_". For details, see the 
include file (in the directory 'Catalina\include') called 'catalina_spi.h'.




