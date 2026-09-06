/*
 * Simple SN Emulator MD Library test program. This program must be compiled 
 * with the command line switch -lsoundsne to enable the SN Emulator sound 
 * plugin.
 *
 * Works best at 250 Mhz or greater.
 *
 * Compile this program with a command like:
 *
 *   catalina -p2 -lci -lsoundsne md_play.c -C MHZ_260
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
 * So, for example:
 *
 *    catalina -p2 -lci -lsoundsne md_play.c -C SNE_FREQUENCY=4000000
 *
 */

#include <stdio.h>
#include <soundmd.h>
#include <musictab.h>
  
#if !defined(__CATALINA_SNE_FREQUENCY) || (__CATALINA_SNE_FREQUENCY != 4000000)
#error THIS PROGRAM EXPECTS SNE_FREQUENCY OF 4000000 (e.g. -C SNE_FREQUENCY=4000000)
#endif

#define TEST_CHAN   2   // Channel to test (0, 1 or 2 only - 3 is noise)

#define TEST_TONE   0   // 0 = play note, 1 = play tone 
                        // (playing notes uses ADSR, playing tones does not)

// Timing constants
#define START_NOTE  48  // first sensible frequency
#define PAUSE_TIME 300  // pause between note in ms

#define PLAY_TIME   0   // playing time managed by app
#define WAIT_TIME 500   // waiting time for note to play

void md_loop(void) {

  // Note on/off FSM variables
  static enum { PAUSE, NOTE_ON, WAIT_FOR_TIME, NOTE_OFF } state = PAUSE; // current state
  static uint32_t timeStart = 0;  // md_millis() timing marker
  static uint8_t noteId = START_NOTE;  // the next note to play
 
  md_play(); // run the sound machine every time through loop()

  // Manage the timing of notes on and off depending on 
  // where we are in the rotation/playing cycle
  switch (state) {
    case PAUSE: // pause between notes
      if (md_millis() - timeStart >= PAUSE_TIME) {
        state = NOTE_ON;
      }
      break;

    case NOTE_ON:  // play the next MIDI note
      if (mt_findId(noteId)) {
        uint16_t f = (uint16_t)(mt_getFrequency() + 0.5);  // round it up
        char buf[10];

        printf("[%3d] ", noteId);
        printf("%s", mt_getName(buf, sizeof(buf)));
        printf(" @ %d Hz\n", f);
#if TEST_TONE
        md_tone(TEST_CHAN, f, VOL_MAX, PLAY_TIME);
#else
        md_note(TEST_CHAN, f, VOL_MAX, PLAY_TIME);
#endif
      }
      else {
        printf("[%3d] not found\n", noteId);
      }

      // wraparound the note number if reached end midi notes
      noteId++;
      if (noteId >= NOTES_COUNT)
        noteId = START_NOTE;

      // next state
      timeStart = md_millis();
      state = WAIT_FOR_TIME;
      break;

    case WAIT_FOR_TIME:
      if (md_millis() - timeStart >= WAIT_TIME)
      {
        timeStart = md_millis();
#if TEST_TONE
        md_tone(TEST_CHAN, 0, VOL_OFF, 0);
        state = PAUSE;
#else
        md_note(TEST_CHAN, 0, VOL_OFF, 0);
        state = NOTE_OFF;
#endif
      }
      break;

    case NOTE_OFF:  // wait for note to complete
      if (md_isIdle(TEST_CHAN))
      {
        timeStart = md_millis();
        state = PAUSE;
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

   while(1) {
      md_loop();
   }
}
