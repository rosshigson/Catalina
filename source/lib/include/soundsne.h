#ifndef __SOUNDSNE_H
#define __SOUNDSNE_H

/* 
 * Catalina support for the SN76489 emulator by Ross Higson. 
 *
 * The soundsne library contains functions that emulate the Spin2 
 * functions used to test and demonstrate the original Spin2 driver.
 *
 */

#include <plugin.h>

/*
 * sne_initialize   - Initialize sound plugin. This function must
 *                    be called to initialize the driver library.
 */
void sne_initialize();

/*
 * sne_getRegisters - Retrieve a pointer to the SNE plugin data block.
 *                    Returns NULL if the plugin cannot be found, or
 *                    a pointer to the 8 long data block. Can be used
 *                    if the registers are to be set manually, or to
 *                    tell if the plugin is loaded.
 */
unsigned long *sne_getRegisters();

/*
 * sne_reset        - Reset all 8 registers in the SNE data block
 *                    to 15 (i.e. maximum attenuation, or minimum volume). 
 *                    This is done once during initialization, but can 
 *                    subseuqently be done manually.
 * 
 */
void sne_reset();

/*
 * sne_setFreq      - Set the frequency of a single channel.
 * 
 */
void sne_setFreq(int channel, unsigned long frequency);

/*
 * sne_setVolume    - Set the volume of a single channel
 * 
 */
void sne_setVolume(int channel, unsigned long volume);

/*
 * sne_play         - Set the volume and frequence of a single channel.
 * 
 */
void sne_play(int channel, int frequency, int volume);

/*
 * sne_playTune     - play a tune encoded as a stream of 3 byte entries. 
 *                    Each entry represents a note for channels 0, 1 and 2,
 *                    typically representing lead, drum(noise) and bass notes. 
 *
 *                    The tune is played at the specified play_rate (in Hz).
 *
 *                    Each byte in the tune represents a note for one channel. 
 *                    A note > 0 turns the note on for that channel, and zero 
 *                    means to let the current note decay. A note of 255 in
 *                    channel 0 indicates the end of the tune (which will be
 *                    repeated indefinitely if 1 is specified for the repeat 
 *                    parameter).
 *
 *                    For the drum(noise) channel, each note is represented 
 *                    as a value 0 .. 7 which specifies the type and period
 *                    of the noise:
 *
 *                      bits   1&0  meaning
 *                             ---  -------
 *                             0 0  clock/512
 *                             0 1  clock/1024
 *                             1 0  clock/2048
 *                             1 1  use channel 2 tone frequency
 *
 *                      bit 2 = 0 for periodic noise, 1 for white noise
 *                      See the SN76489 documentation for more details.
 *
 *                    For channels 0 and 2, each note is specified as a value 
 *                    in the range 30 .. 254 which specifies an octave and 
 *                    one of 12 tones from a table of 12 short tone period 
 *                    values. The octave is (note-30) div 12, and tone is 
 *                    (note-30) mod 12.
 *
 *                    The relationship between tone period and frequency is:
 *                       frequency = (emulator clock)/(32*period)
 *                    or
 *                       period = (emulator clock)/(32*frequency)
 *
 *                    The emulator clock is set to 3579545 Hz, which means, 
 *                    for example, that a 440 Hz tone (note "A") is period:
 *                       3579545/(32*440) = 254
 */
void sne_playTune(unsigned char *tune, 
                  unsigned short *tones, 
                  unsigned long play_rate,
                  unsigned int repeat);

/*
 * sne_playVGM      - play a turn encoded in VGM format
 * 
 */
void sne_playVGM(unsigned char *vgm, unsigned long speed_div);

#endif
