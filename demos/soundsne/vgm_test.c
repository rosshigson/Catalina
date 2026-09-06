/*
 * Simple VGM test program. This program must be compiled with the command 
 * line switch -lsoundsne to enable the SN Emulator sound plugin.
 *
 * Works best at 250 Mhz or greater.
 *
 * Compile this program with a command like:
 *
 *   catalina -p2 -lci -lsoundsne vgm_test.c -C MHZ_260
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
 * For example:
 *
 *   catalina -p2 -lci -lsoundsne vgm_test.c -C SNE_FREQUENCY=4000000
 *
 * The program plays whatever VGM tune is in "music.inc". To make this file
 * from (for example) the vgm file Sonic.vgm, use the following command:
 *
 *    bindump -b -c -p "   0x" Sonic.vgm >music.inc
 */

#include <stdio.h>
#include <soundsne.h>

#define SPEED_DIV 1

// the VGM file encoded as bytes (using bindump):
unsigned char music[] = {
   #include "music.inc"
};

void main() {

   _waitsec(1); // in case external terminal emulator in use

   sne_initialize(); // initialize the sound library

   // verify we have loaded the SNE plugin
   if (sne_getRegisters() == NULL) {
      printf("SNE plugin not found!\n");
      exit(1);
   }
   else {
      printf("SNE plugin found, registers at %08x\n", sne_getRegisters());
      printf("Clock Freq = %d (Hz)\n", _clockfreq());
      printf("Speed Div  = %d\n",  SPEED_DIV);
   }

   sne_playVGM(music, SPEED_DIV); // play the VGM
}
