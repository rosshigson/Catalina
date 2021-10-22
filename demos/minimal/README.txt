This directory contains demo programs intended to be built using the special
"minimal" target directory for the Propeller 1.

The minimal target directory is a minimalist target directory intended to 
aid in the understanding of Catalina targets and plugins. The main purpose
of the minimal target directory is that it contains an example of how to
create a Catalina "plugin". The plugin is called the "Generic Plugin", and
is a complete working plugin that can be used to set or reset specific
outputs from another cog. The functions it actually implements are quite
trivial, and are intended only to show how such a Plugin can be created and
then called from a C program. See the README.txt file in the Catalina\minimal 
subdirectory for more details about the minimal target and its contents.

In this directory are the following files:

   build_all        - build script for Linux
   build_all.bat    - build script for Windows

   utilities.h      - header file for utility functions
   utilities.c      - utility functions.

   generic_plugin.h - definition of functions for accessing the Generic Plugin.
   generic_plugin.c - functions for accessing the Generic Plugin.

   simple_test.c    - a simple test program that uses the Generic Plugin.
   complex_test.c   - a complex test program that not only uses the Generic 
                      Plugin services, but dynamically loads and unloads the
                      Generic Plugin to show how it can be done.

You may also see the following files:

   plugin_array.h   - this is a binary version of the Generic Plugin, created
                      using the spinc program from the Catalina__Plugin.spin 
                      file in the minimal target directory. This is created
                      by the build scripts, and contains a compiled binary 
                      version of the Generic Plugin that can be loaded 
                      dynamically by a C program. This is used by the complex
                      test program (complex_test.c).

To build the demo programs, simply execute the command:

   build_all [platform]

The only platform supported by the minimal target directory is the special 
CUSTOM platform, which comes pre-configured for a QuickStart board, but you 
can also specify C3 as the platform - this does not change the configuration,
but it does is change the pin that is toggled by the demo programs to be the 
VGA pin on the the C3. If you do not specify C3, pin 0 will be used. If you
want to use the Hydra (or any other platform that uses an unusual clock) you 
will definitely have to change the platform configuration in Custom_DEF.inc
in the "minimal" target directory.

To run the programs (which are perfectly normal Propeller programs) load them
using a command such as:

   payload simple_test

or 

   payload complex_test

In either case, when loaded and run, the programs will simply toggle one or
more of the Propeller I/O pins. The pins toggled can be set by modifying the
definition of OUTPUTS in the respective C program files - by default, unless
C3 is specified on the command line, both programs toggle pin P0 - which on 
the HYDRA and HYBRID (and some other platforms) is connected to a debug LED
 - so running the programs will cause this LED to flash. On other platforms, 
you may need to use another pin, or an oscilloscope to verify the operation 
of the demo programs.

