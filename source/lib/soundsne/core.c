#include <soundsne.h>
#include <string.h>

unsigned long *SNRegisters = NULL;

/*
 * sne_initalize - call this function before calling any other
 */
void sne_initialize() {
   SNRegisters = sne_getRegisters();
   if (SNRegisters != NULL) {
      sne_reset();
   }
}

/*
 * find the sound plugin and return the pointer in the request block
 * (this is set up on plugin load to point to the SNE data block). 
 * Return NULL if no sound plugin is found.
 */
unsigned long *sne_getRegisters() {
   int i;
   for (i = 0; i < COG_MAX; i++) {
      if (REGISTERED_TYPE(i) == LMM_SND) {
         // found - return request block value
         return (unsigned long *)(REQUEST_BLOCK(i)->request);
      }
   }
   return NULL; // not found
}

/*
 * sne_reset
 */
void sne_reset() {
   int i;
   for (i = 0; i < 8; i++) {
     *(SNRegisters+i) = 15;
   }
}

/*
 * sne_setFreq
 */
void sne_setFreq(int channel, unsigned long frequency) {
   if (SNRegisters != NULL) {
      //printf("setFrequency: channel %d = %d\n", channel, frequency);
      // note: pointer arithmetic
      *(SNRegisters + (channel<<1)) = frequency;
   }
}

/*
 * sne_setVolume
 */
void sne_setVolume(int channel, unsigned long volume) {
   if (SNRegisters != NULL) {
      //printf("setVolume: channel %d = %d\n", channel, volume);
      // note: pointer arithmetic
      *(SNRegisters + (channel<<1) + 1) = volume;
   }
}

/*
 * sne_play
 */
void sne_play(int channel, int frequency, int volume) {
   if (SNRegisters != NULL) {
      // note: pointer arithmetic
      *(SNRegisters + (channel<<1)) = frequency; 
      *(SNRegisters + (channel<<1) + 1) = volume;
   }
}
