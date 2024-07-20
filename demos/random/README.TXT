This directory contains a program to demonstrate manually loading, using and 
then unloading the RANDOM plugin. This plugin is supported on the Propeller 1
only (the Propeller 2 has a built-in random number generator).

The program can be built using the 'build_all' batch file provided. 

E.g:

   build_all

   build_all DISPLAY_REGISTRY

   build_all C3 TTY OPTIMIZE DISPLAY_REGISTRY

   build_all C3 TTY COMPACT DISPLAY_REGISTRY

   build_all HYDRA COMPACT OPTIMIZE DISPLAY_REGISTRY

Only one program will be built - random.binary. Run it with a command like:

   payload -i random.binary

With no parameters, the program will be built for the CUSTOM platform, which
uses a serial interface as HMI. This is suitable for most Propeller boards.

Add DISPLAY_REGISTRY to the 'build_all' command display the registry after 
loading and after unloading the plugin. Otherwise the program will simply 
print 10 random numbers and then exit.

You do not need to specify RANDOM on the 'build_all' command line. While this 
does no real harm, it will cause a second RAMDOM plugin to be loaded, which 
will never be used.

Note that the RANDOM plugin registers itself on startup, which means that 
the program does not need to do anything other than load it - most plugins 
register themselves, but in some cases there is not enough cog RAM for the 
registration code, so the plugin is instead registered using either Spin 
code (on the Propeller 1) or PASM code (on the Propeller 2). An example 
of doing this in Spin code on the Propeller 1 is the sound driver (in the 
file Catalina_Sound_drv_052_22khz_16bit.spin). This plugin registers itself
using the Spin function Register from Catalina_Common.spin. If that plugin
were manually loaded, then corresponding C code to do the registration 
(i.e. using the C _register_plugin() function defined in plugin.h) would need
to be included to allow the C library code to locate the plugin. Finally, 
if the plugin provides services, those services would also need to be 
registered (i.e. using the macros SERVICE_ENTRY etc defined in plugin.h).
