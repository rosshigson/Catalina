Catalyst
========

This directory contains Catalyst - Catalina's SD Card Loader - and some
Catalyst utilities and demo programs.

See the file CATALYST.TXT for an overview, or the Catalyst Reference Manual.

Each subdirectory contains a different part of Catalyst. Each subdirectory
can be built individually, or the 'build_all' sccipt in this directory can
be used to build all components and copy them to the image directory, ready
to be copied to an SD card.

Here are some examples of commands that might be used to build Catalyst for
some common platforms (but also see the notes below, particularly if errors 
are generated about objects exceeding the runtime memory limits during the 
execution of the script, or Catalyst builds ok but fails to execute correctly):

   build_all HYBRID                        <-- to use the default HMI option

   build_all DRACBLADE PC                  <-- to use PC terminal emulator

   build_all RAMBLADE PC VT100             <-- to use a VT100 terminal emulator
 
   build_all DRACBLADE LORES_VGA           <-- to use local VGA and keyboard

   build_all TRIBLADEPROP CPU_2 PC VT100   <-- to use CPU 2 on a TriBladeProp

   build_all C3 FLASH CACHED_1K TTY256 VT100 OPTIMIZE 
                                           <-- to use FLASH on the C3, 
                                               but see the notes below

   build_all QUICKSTART PMC CACHED_1K FLASH TTY VT100 OPTIMIZE <-- for the PMC

   build_all P2_EVAL TTY VT100 MHZ_200     <-- to use VT100 terminal emulator

   build_all P2_EVAL LORES_VGA COLOR_4 MHZ_200 NO_LINENOISE 
                                           <-- to use VGA & USB keyboard

   build_all P2_EDGE SIMPLE VT100 OPTIMIZE MHZ_200  
                                           <-- to use VT100 terminal emulator

NOTES:

When building Catalyst for the Propeller 1, it is very easy to select options
that will cause the main catalyst.binary executable to exceed the available 
Hub RAM. A message to this effect may be generated during the execution of
the build_all script, but it may also happen that the program builds correctly
but does not have sufficient Hub RAM to execute correctly. If Catalyst fails 
to build or execute correctly, try adding the EEPROM_CATALYST option to build 
the main Catalyst binary in EEPROM mode. Then use the build_utilities script 
to build an appropriate EEPROM loader.

For example:

   build_all C3 FLASH CACHED_1K TTY256 VT100 OPTIMIZE EEPROM_CATALYST

In some cases it may also be necessary to build the utilities as LARGE 
programs, which can be done by adding the symbol LARGE_UTILIITES to the 
build_all command. See the Catalyst Reference Manual for more details.

There is one component which will not build for the Propeller 1 - this is 
the "time" utility, which is supported on the Propeller 2 only.

You may also see some messages about programs requiring the multi-threaded 
kernel - these can be safely ignored (this error is generated when programs 
are compiled but not linked - but this is ok because the programs being
compiled are later linked with the correct kernel).
  
Note that you should generally NOT specify a memory model (e.g. COMPACT, 
TINY, SMALL, LARGE) in the build_all command. This is because some parts of 
Catalyst core components MUST be built to use particular memory models, and 
the individual build_all scripts will do this automatically. 

However, you can build individual non-core components of Catalyst in other
memory models - for instance, on the Propeller 2, it may be useful to build
some Catalyst components to use the SMALL or LARGE memory model. To do this, 
after building Catalyst as normal, go to that directory and rebuild the 
individual component. For example, to rebuild just Lua as a LARGE program:

   cd lua-5.4.4
   build_all P2_EDGE SIMPLE VT100 MHZ_200 LARGE
   copy_all ..\image\

Note that for some memory models, some components may not build, so you should
check the output of the compilation and copy commmands carefully to make sure
you are using appropriate memory models for the components you need.

When using the FLASH symbol (supported on the Propeller 1 only), the build_all
script will generate occasional warning messages such as "FLASH is incompatible
with current layout - ignoring" when building the core catalyst components 
(which do not use FLASH). This message is expected and can be ignored.

Note the use of the VT100 compile flag - this tells various Catalyst programs
to expect a VT100 compatible terminal emulator, and is normally used in 
conjunction with the various serial HMI options (PC, TTY, TTY256 or SIMPLE). 

Also, if you want a serial HMI option (such as PC, TTY, TTY256 or SIMPLE) 
you should specify both the HMI option and the VT100 to the build command even
if a serial HMI is the default HMI option for your platform - this is so that
Catalyst knows how to manage line and screen editing on your platform. 
Otherwise you may find that the cls command does not work, and nor does the 
backspace key.

Finally, note that the self-hosted version of Catalina (in the 'catalina'
sub-directory) is never built by default, since it currently only runs on
a subset of supported Propeller 2 platforms. To build it manually, use the 
build_all script in that directory. For example, you might use the commands:

   cd catalina
   build_all P2_EDGE SIMPLE VT100 OPTIMIZE MHZ_200

The output of the build will be copied to the image folder.
