#include <soundsne.h>
#include <string.h>

extern unsigned long *SNRegisters;

static unsigned short note2freq(unsigned char note, unsigned short *tones) {
    int octave;
    octave = note/12;
    note -= octave*12;
    return (tones[note]>>octave);
}

/*
 * sne_playtune
 */
void sne_playTune(unsigned char *tune,
                  unsigned short *tones, 
                  unsigned long play_rate,
                  unsigned int repeat) {
   unsigned char *musicPointer = tune;
   unsigned char note;
   int channel;
   long volume[4] = {0, 0, 0, 0};

   if (SNRegisters != NULL) {
      while (1) {
        _waitcnt(_cnt() + (_clockfreq()/play_rate));
        for (channel = 0; channel < 3; channel++) {
           note = *(musicPointer++);
           if (note == 255) {
              if (repeat) {
                 // Restart tune
                 musicPointer = tune;
                 note = *musicPointer++;
              }
              else {
                 // exit
                 return; 
              }
           }
           if (note) {
              // Note on if note > 0
              //printf("note = %d\n", note);
              if (channel != 1) {
                  // Handle bass and lead tone (channel 0 and 2)
                  volume[channel] = 15;
                  sne_setFreq(channel, note2freq(note-30, tones));
               }
               else {                                
                  // Handle drum (channel 3)
                  volume[3] = 15;
                  sne_setFreq(3, note);
               }
            }
         }
         for (channel = 0; channel < 4; channel++) {
            // Handle amplitude decay
            if ((volume[channel] -= 2) < 0) {
              volume[channel] = 0;
            }
            sne_setVolume(channel, (15-volume[channel]));
         }
      }
   }
}

