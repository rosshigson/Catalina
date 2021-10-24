Catalina Sound Plugin
=====================

This directory contains 2 demo programs for Catalina's sound plugin. The sound 
plugin is based on the SPIN driver written by Nick Sabalausky, and this driver
is known to work on a wide variety of Propeller platforms including the HYDRA 
and the C3.

The soound plugin is not supported on the Propeller 2.

You can compile the demo programs using the build_all script provided. 

For example:

   build_all HYDRA COMPACT

or 

   build_all C3 COMPACT NO_GAMEPAD


This will build two programs:

   sound_demo - A simple demonstration of the sound driver. This demo uses the
                TV display & keyboard, and is suitable for either the HYDRA
                or the C3. It may also work on other platforms with compatible
                audio hardware.


   spacewar - A version of the SpaceWar! program with sound effects enabled.
              This program uses VGA and the keyboard. See below for how to
              compile it to use the GAMEPAD on the HYDRA.

              This program must be compiled with the COMPACT memory model.
              The program does not require XMM RAM, but the inclusion of the 
              sound drivers makes it too large to load using the normal loader
              - so instead, it is compiled to use the EEPROM loader, and it 
              must be loaded into a 64kb (or larger) EEPROM using the Payload 
              EEPROM loader. This requires that you first build the utilities 
              for the your platform. For instance, to build the utilities and 
              then load the program, you could use the following commands:

                 build_utilities
                 payload EEPROM spacewar


To compile SpaceWar to use 600x800 resolution, and also to use the gamepads 
instead of the keyboard (for the HYDRA only), use the following command: 

   build_all HYDRA COMPACT VGA_800 GAMEPAD NO_KEYBOARD

While the spacewar program must be built with the COMPACT memory model (since
it is so large), the sound_demo program can be compiled using the COMPACT, 
TINY or SMALL memory models. 

More details of the functions provided by the sound library are given in the 
file 'catalina_sound.h' in the Catalina 'include' direcory - they are an exact
match for the methods in the original SPIN version of the driver.

