/*
 * Simple SN Emulator MD Library test program. This program must be compiled 
 * with the command line switch -lsoundsne to enable the SN Emulator sound 
 * plugin.
 *
 * Works best at 250 Mhz or greater.
 *
 * Compile this program with a command like:
 *
 *   catalina -p2 -lci -lsoundsne md_noise.c -C MHZ_260
 *
 * Some SN Emulator values can be set on the command line (however, there is 
 * generally no need to override the default values, except to more closely
 * emulate a specific computer or game console that used the real SN chip):
 *
 *    SNE_FREQUENCY - clock frequency input to the SN emulator. For example:
 *
 *       3579545 (NTSC console frequency - the default)
 *       3546893 (PAL console frequency)
 *       4000000 (another commonly used frequency)
 * 
 *    SNE_SAMPLE_RATE - the sample rate to use. For example:
 *
 *       1411200 (32 x CD quality - the default)
 *
 *    NOISE_FREQUENCY - the frequency to use for noise. 
 *
 * So, for example:
 *
 *    catalina -p2 -lci -lsoundsne md_noise.c -C NOISE_FREQUENCY=300
 *
 */

#include <stdio.h>
#include <soundmd.h>
#include <musictab.h>
  
#if !defined(__CATALINA_SNE_FREQUENCY) || (__CATALINA_SNE_FREQUENCY != 4000000)
#error THIS PROGRAM EXPECTS SNE_FREQUENCY OF 4000000 (e.g. -C SNE_FREQUENCY=4000000)
#endif

#ifndef __CATALINA_NOISE_FREQUENCY
#define __CATALINA_NOISE_FREQUENCY 3000 // noise frequency (set in channel 2)
#endif

void noise_setup(void) {

  printf("\nMD_SN76489 Noise Tester\n");

  md_setFrequency(2, __CATALINA_NOISE_FREQUENCY);
}

void noise_loop(void)
{
// Timing constants
#define PAUSE_TIME 300  // pause between note in ms

#define PLAY_TIME  0    // playing time managed by application
#define WAIT_TIME  750

  // Noise cycle
  noiseType_t N[] =
  {
    PERIODIC_0, PERIODIC_1,
    PERIODIC_2, PERIODIC_3,
    WHITE_0, WHITE_1,
    WHITE_2, WHITE_3
  };

  // Note on/off FSM variables
  static enum { PAUSE, NOTE_ON, WAIT_FOR_TIME, NOTE_OFF } state = PAUSE; // current state
  static uint32_t timeStart = 0;  // millis() timing marker

  static uint8_t idxNoise = 0;
  
  md_play(); // run the sound machine every time through loop()

  // Manage the timing of notes on and off depending on 
  // where we are in the rotation/playing cycle
  switch (state)
  {
    case PAUSE: // pause between notes
    {
      if (md_millis() - timeStart >= PAUSE_TIME) {
        state = NOTE_ON;
      }
    }
    break;

    case NOTE_ON:  // play the next noise setting
    {
      md_noise(N[idxNoise], VOL_MAX, PLAY_TIME);
      printf("Noise Type %d\n", idxNoise);

      // move to next noise cyle value
      idxNoise = (idxNoise + 1) % (sizeof(N)/sizeof(noiseType_t));
      if (idxNoise == 0) printf("\n");

      // set up the timer for next state
      timeStart = md_millis();
      state = WAIT_FOR_TIME;
    }
    break;

    case WAIT_FOR_TIME:
    {
      if (md_millis() - timeStart >= WAIT_TIME)
      {
        md_noise(NOISE_OFF, VOL_OFF, 0);
        timeStart = md_millis();
        state = NOTE_OFF;
      }
    }
    break;

    case NOTE_OFF:  // wait for time to turn the note off
    {
      if (md_isIdle(NOISE_CHANNEL))
      {
        timeStart = md_millis();
        state = PAUSE;
      }
    }
    break;
  }
}

void main() {

   _waitsec(1); // in case external terminal emulator in use

   md_begin(); // initialize the MD sound library

   // verify we have loaded the SNE plugin
   if (sne_getRegisters() == NULL) {
      printf("SNE plugin not found!\n");
      exit(1);
   }
   else {
      printf("SNE plugin found, registers at %08x\n", sne_getRegisters());
      printf("Clock Freq = %d (Hz)\n", _clockfreq());
   }

   noise_setup();

   while(1) {
      noise_loop();
   }
}
