This directory contains programs that demonstrate the SN76489 Emulator sound 
plugin for the Propeller 2 and the Catalina libraries that support the plugin. 

The sound plugin is enabled simply by linking with the library, typically 
by adding -lsoundsne to a Catalina compilation command. For example:

   catalina -p2 -lci -lsoundsne sne_test.c 

The sound library consists of three parts, each with its own C header 
file:

Basic SN Emulator support functions - soundsne.h 
================================================

This part of the library is based on the original SN76489 Emulator written 
for the Propeller 1 by Johannes Ahlebrand and adapted to the Propeller 2 by 
Ada Gottensträter. 

Here is a summary of the functions (see the header file and the plugin itself
in target/p2/cogsne.t for full details):

   sne_initialize   - Initialize SNE plugin. This function must be called 
                      before any other to initialize the driver library.

   sne_getRegisters - Retrieve a pointer to the SNE plugin data block.
                      Returns NULL if the plugin cannot be found. Can be 
                      used if the registers are to be set manually, or to
                      tell if the plugin is loaded.

   sne_reset        - Reset all the registers in the SNE data block to 15 
                      (i.e. maximum attenuation, or minimum volume). 
                      This is done once during initialization, but can 
                      subseuqently be done manually.

   sne_setFreq      - Set the frequency of a single channel.

   sne_setVolume    - Set the volume of a single channel.

   sne_play         - Set the volume and frequency of a single channel 
                      (i.e. play the tone).

   sne_playTune     - play a tune encoded as a stream of 3 byte entries. 
                      Each entry represents a note for one of three channels,
                      typically representing lead, drum (noise) and bass notes. 

                      The tune is played at the specified play_rate (in Hz).

                      Each byte in the tune represents a note for one channel. 
                      A note > 0 turns the note on for that channel, and zero 
                      means to let the current note decay. A note of 255 in
                      channel 0 indicates the end of the tune (which will be
                      repeated indefinitely if 1 is specified for the repeat 
                      parameter).

                      For the drum (noise) channel, each note is represented 
                      as a value 0 .. 7 which specifies the type and period
                      of the noise:

                        bits   1&0  meaning
                               ---  -------
                               0 0  clock/512
                               0 1  clock/1024
                               1 0  clock/2048
                               1 1  use channel 2 tone frequency

                        bit 2 = 0 for periodic noise, 1 for white noise
                        See the SN76489 documentation for more details.

                      For channels 0 and 2, each note is specified as a value 
                      in the range 30 .. 254 which specifies an octave and 
                      one of 12 tones from a table of 12 short tone period 
                      values. The octave is (note-30) div 12, and tone is 
                      (note-30) mod 12.

                      The relationship between tone period and frequency is:
                         frequency = (emulator clock)/(32*period)
                      or
                         period = (emulator clock)/(32*frequency)

                      The emulator clock is set to 3579545 Hz, which means, 
                      for example, that a 440 Hz tone (note "A") is period:
                         3579545/(32*440) = 254

   sne_playVGM      - play a tune or sound effect encoded in VGM format. 
                      Note that the VGM file format can support many sound
                      chips, so the file should be one intended for play by 
                      an SN76489. There are many VGM file utilities for
                      creating and editing VGM files, such as the Furnace 
                      chiptune tracker available at:

                         https://github.com/tildearrow/furnace


Information about musical notes - musictab.h
=============================================

This part of the library was inspired by the Arduino MD_MusicTable functions 
written by Marco Colli (see https://github.com/MajicDesigns/MD_MusicTable).

Below is a summary of the functions - see the header file for full details:

The following functions find a note in the table using various criteria:

   mt_findId         - find a note by MIDI note number (0 .. 127).

   mt_findName       - find a note by note name (a string up to 3 characters,
                       e.g. "A" or "F#") and octave.

   mt_findNoteOctave - find a note by note ID (0 .. 11) and octave.

   mt_lookupNoteId   - return the note ID (0 .. 11) for a simple note
                       string (eg, "A" or "F#").

The following functions return specific values from the table (for the last
note found by the functions above):

   mt_getFrequency  - frequency in Hz.

   mt_getName       - ISO name (note and octave eg A4).

   mt_getNote       - note name only (eg A, C#).

   mt_getOctave     - octave number.

   mt_getId         - MIDI note number.

   mt_getNoteId     - Note ID in octave.
    

An MD_SN76489 Sound Generator library - soundmd.h
=================================================

This part of the library was inspired by the MD_SN76489 Sound Generator Library
developed by Marco Colli (see https://github.com/MajicDesigns/MD_SN76489). 

Below is a summary of the functions - see the header file for full details:

   md_begin             - initialize the MD library. Msu be called before any
                          other MD library function.

   md_setVolume         - Set the volume set point for channel and remember the 
                          setting. Application values are 0-15 for min to max. 
                          Attenuator values are the complement of this (15-0).

   md_setAllVolume      - Set the same volume set point for all channels.

   md_setFrequency      - Calculate register values and set them.

   md_setAllFrequency   - Set the same frequency for all channels.

   md_setNoise          - Set the noise channel parameters.

   md_tone              - Output a sound with frequency freq on the specified 
                          channel. The tone is played without using ADSR.

   md_note              - Output a sound with frequency freq on the specified
                          channel using the ADSR envelope curently defined for 
                          the channel.

   md_noise             - Output a noise as specified on NOISE_CHANNEL, using 
                        - the ADSR envelope curently defined for the channel. 

   md_setADSR           - set the ADSR envelope for a channel.

   md_setAllADSR        - Set the same ADSR envelope for all channels.

   md_isIdle            - Return the idle state of a channel.

   md_play              - play the ADSR for all channels.

   md_millis            - return number of milliseconds since first call.


Functons from the different sound library components can be used in the same 
program, but note that using the sne_* functions (e.g. sne_setFreq etc) may 
disrupt the ADSR envelope currently in use by the md_* library functions. 
Also note that the md_* library functions typically use 0 to mean minimum 
volume, whereas the sn_* library functions use 15 (i.e. max attentuation 
rather than min volume).

The Demo programs
=================

The following SN Emulator demo programs are provided:

   sne_test             - test the basic sne library functions by playing a
                          tune using the sne_playtune() function.

   vgm_test             - tests the basic sne VGM functions by playing a
                          VGM tune using the sne_playvgm() function.

   md_play              - plays a series of MIDI notes using ADSR.

   md_noise             - plays a series of noises using ADSR. This is an
                          interactive program.

   md_adsr              - allows the definition of an ADSR envelope, and
                          playing notes and noises using that ADSR envelope.
                          This is an interactive program.

   sfx_test             - impplements a simple VGM sound effects manager, 
                          which allows multiple sound effects to be played
                          simultaneously using different channels of the
                          SN Emulator. The same SFX manager and sounds 
                          are used in the spacewar demo program. This is
                          an interactive program.

These programs all use stdout to display information, and some are interactive 
and expect input from stdin, so they can all be started using the payload 
terminal emulator in interactive mode. For example:

   payload -o2 -i sfx_test

There is also a verson of the spacewar program in this directory:

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

To build for a P2 EDGE and only enable only one USB port (this is required
for the spacewar program to have a cog to run the SFX manager in its own cog). 
Either USE_USB_A or USE_USB_B can be specified:

   build_all P2_EDGE USE_USB_A 

To build using the optimizer and compiling in COMPACT mode (NO_FLOAT is 
required in COMPACT mode for the spacewar program to have a cog to run the 
SFX MAnager in its own cog):
            
   build_all P2_EVAL USE_USB_A OPTIMIZE COMPACT NO_FLOAT

