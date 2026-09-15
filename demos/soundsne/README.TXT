This directory contains programs that demonstrate the SN76489 Emulator sound 
plugin for the Propeller 2 and the Catalina libraries that support the plugin. 

The sound plugin is enabled simply by linking with the library, typically 
by adding -lsoundsne to a Catalina compilation command. For example:

   catalina -p2 -lci -lsoundsne sne_test.c 

Refer to the section titled Sound support in the Propeller 2 Reference 
Manual for more information on the HD_VGA HMI plugin and the graphic2 library.

Configuring the Sound plugin
============================

The sound driver is compatible with the Parallax Propeller 2 A/V add-on board,
and is configured the same way - i.e. by using the platform configuration 
files in the target\p2 directory - e.g. for the CUSTOM platform, it would be 
P2CUSTOM.inc, or for the P2_EDGE platform it would be P2EDGE.inc). The 
relevant entry for the Propeller 2 A/V board is:

   _VGA_BASE_PIN = 0


The Demo programs
=================

The following SN Emulator demo programs are provided:

   sne_test             - test the basic sne library functions by playing a
                          tune using the sne_playtune() function.

   vgm_test             - tests the basic sne VGM functions by playing a
                          VGM tune using the sne_playvgm() function.

   md_play              - plays a series of MIDI notes using ADSR.

   md_noise             - plays a series of noises using ADSR.

   md_adsr              - allows the definition of an ADSR envelope, and
                          playing notes and noises using that ADSR envelope.
                          This is an interactive program.

   sfx_test             - implements a simple VGM sound effects manager, 
                          which allows multiple sound effects to be played
                          simultaneously using different channels of the
                          SN Emulator. The same SFX manager and sounds 
                          are used in the spacewar demo program. This is
                          an interactive program.

These programs all use stdout to display information, and some are interactive 
and expect input from stdin, so they can all be started using the payload 
terminal emulator in interactive mode. For example:

   payload -o2 -i sfx_test

There is also a version of the spacewar program in this directory:

   spacewar             - this version of spacewar includes VGM sound effects.
                          Six sound effects are used in the game - explosions, 
                          missiles (different sounds for each player), damage, 
                          shields and thrust. Note that to allow a cog to be 
                          used for the SFX manager, USE_USB_A or USE_USB_B 
                          must be specified, which means a USB Hub must also 
                          be used so that both gamepads can be plugged into 
                          the same USB port. 

Spacewar does not use stdin or stdout - it requires two USB gamepads to play. 

The sound effects used by both the sfx_test and spacewar demos are:

   shoot0.inc           - made from shoot0.vgm
   shoot1.inc           - made from shoot1.vgm
   damage2.inc          - made from damage2.vgm
   thrust2.inc          - made from thrust2.vgm
   shield2.inc          - made from shield2.vgm
   explode2.inc         - made from explode2.vgm

These *.inc files were made using the bindump utility from the vgm files
(see vgm_test.c for details on how to do this) which were themselves created 
using the online app available at:

   https://harmlesslion.com/sn_sfxr/

This app allows sound effects to be created and downloaded that use individual
channels of the SN76489 chip. Choosing which channels to use allows up to 
three sound effects (plus a noise) to be played simultaneously. Utilizing the
different channels plus a simple priority value allows a sound effects manager
to know which sound effects can be played simultaneously - see the sfx_test 
demo program for an example.

Note that the sound effect files are embedded into the sfx_test and spacewar 
programs during compilation, and do NOT need to be available when they are
executed.

Building the Demos
==================

There is a build_all script provided to build all the demos. For example:

To build for the default platform (P2_CUSTOM) and default options:

   build_all 

To build for a P2 EDGE and enable only one USB port (this is required for 
the spacewar program to have a cog to run the SFX manager in its own cog). 
Either USE_USB_A or USE_USB_B can be specified:

   build_all P2_EDGE USE_USB_A 

To build using the optimizer and compiling in COMPACT mode (NO_FLOAT is 
required in COMPACT mode for the spacewar program to have a cog to run the 
SFX Manager in its own cog):
            
   build_all P2_EVAL USE_USB_A OPTIMIZE COMPACT NO_FLOAT

