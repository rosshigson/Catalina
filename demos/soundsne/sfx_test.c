/*
 * A trivial VGM Sound Effects Manager. This program must be compiled with  
 * the command line switch -lsoundsne to enable the SN Emulator sound plugin. 
 *
 * Works best at 250 Mhz or greater.
 *
 * Compile this program with a command like:
 *
 *   catalina -p2 -lci -lsoundsne sfx_test.c -C MHZ_260
 *
 * This is an interactive program. For example, use payload to load and 
 * interact with it as follows:
 *
 *   payload -o2 -i sfx_test
 *
 * The program contains six simple sound effects (intended for use in the
 * spacewar.c demo):
 *
 *    1 - explosion
 *    2 - Player 0 missile
 *    3 - Player 1 missile
 *    4 - Missile hit
 *    5 - shields
 *    6 - thrust
 *
 * The numbers correspond to the keys that activate each sound, and also 
 * (approximately) to the relative priority of the sounds when played (e.g. 
 * the explosion sound has the highest priority).
 *
 * The role of the SFX Manager is play the sound effects simultaneously 
 * wherever possible with minimal interference. Sounds that use different 
 * channels (e.g. the two player missile sounds) can always be played 
 * simultaneously. Sounds that share channels (usually the noise channel) 
 * may be able to be played simultaneously but at reduced quality. Sounds 
 * that depend on exclusive access to the a channel (again, usually the noise
 * channel) MUST be played individually, and this will be done according to 
 * their priority (which typically indicates the importance of the sound to 
 * the players during game play). 
 *
 * The shield and thrust sounds are played repeatedly when activated (but 
 * note the the shield sound has a higher priority and so takes precedence 
 * over the thrust sound). The other sounds are simply played once each time
 * they are activated. If they have the same priority then they are played 
 * simultaneously, otherwise the higher priority sound is played.
 *
 * The SFX Manager is not foolproof, and depends on being called fast enough
 * to not miss any VGM imposed timing deadlines - if not, then strange sounds
 * can result.
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
 *    SAMPLE_RATE - the sample rate to use. For example:
 *
 *       44100   (CD quality - the default)
 *
 * For example:
 *
 *   catalina -p2 -lci -lsoundsne sfx_test.c -C SNE_FREQUENCY=4000000
 */

#include <soundsne.h>
#include <string.h>
#include <stdio.h>

#ifndef _CATALINA_SAMPLE_RATE
#define _CATALINA_SAMPLE_RATE 44100
#endif

extern unsigned long *SNRegisters;

// the VGM files encoded as bytes (created using bindump):

unsigned char shot1[] = {
   #include "shoot0.inc"
};

unsigned char shot2[] = {
   #include "shoot1.inc"
};

unsigned char thrust[] = {
   #include "thrust2.inc"
};

unsigned char shield[] = {
   #include "shield2.inc"
};

unsigned char damage[] = {
   #include "damage2.inc"
};

unsigned char explode[] = {
   #include "explode2.inc"
};

// the structure used to manage and keep track of each Sound Effect

typedef struct sfx_data {
   int      play;           // 0 = don't play, 1 = play once, 2 = repeat
   int      priority;       // (all sfx with equal highest priority will play)
   int      state;          // 0 = not playing, 1 = playing
   unsigned char *data;     // vgm binary data
   unsigned long regist;    // vgm state ...
   unsigned long reg_6;
   unsigned long reg_7;
   unsigned long waitFor; 
   unsigned long loopleft;
   unsigned long looplength;
   unsigned char *readptr;
   unsigned char *database;
   unsigned char *dataptr;
   unsigned char *loopptr;  // ... data
} sfx_data_t;

#define MAX_SFX 6 // number of sound effects

// the table of all known sound effects
sfx_data_t sfx_table[MAX_SFX] = {
   {0, 4, 0, explode, 0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL},
   {0, 3, 0, shot1,   0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL},
   {0, 3, 0, shot2,   0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL},
   {0, 3, 0, damage,  0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL},
   {0, 2, 0, shield,  0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL},
   {0, 1, 0, thrust,  0, 0, 0xF, 0xF, 0, 0, NULL, NULL, NULL, NULL}
};

static void waitSamples(sfx_data_t *sfx, unsigned long n) {
   unsigned long ct;
   unsigned long wait;
   static unsigned long speed_div = 1;

   if (sfx->readptr >= sfx->loopptr) {
     sfx->loopleft -= n;
   }
   wait = ((_clockfreq()/(_CATALINA_SAMPLE_RATE*speed_div)) * (n) );
   if (wait < 50) {
      wait = 50;
   }
   sfx->waitFor += wait;
   ct = _cnt();
   if (sfx->waitFor - ct < 100) {
      sfx->waitFor = _cnt() + 100;
   }
}

static void getn(sfx_data_t *sfx, unsigned char *buf, unsigned long n) {
   memcpy(buf, sfx->readptr, n);
   sfx->readptr += n;
}

void sne_setRegister(sfx_data_t *sfx, unsigned char data) {
   if (SNRegisters != NULL) {
      if (data & 0x80) {
       sfx->regist = (data >> 4) & 0x7;
       *(SNRegisters + sfx->regist) = (*(SNRegisters + sfx->regist) & (0x3F<<4)) | (data & 0xF);
     }
     else if ((sfx->regist & 1) || (sfx->regist > 5)) {
        // data word into short register
        *(SNRegisters + sfx->regist) = data & 0xF;
     }
     else {
        // data word into tone register
        *(SNRegisters + sfx->regist) = (*(SNRegisters + sfx->regist) & 0xF) | ((data & 0x3F) << 4);
      }
   }
}

static void sne_updateRegisters(unsigned long *source) {
   if (SNRegisters != NULL) {
      memmove(SNRegisters, source, 8*4);
   }
}

static void sne_flipRegisters() {
   if (SNRegisters != NULL) {
      sne_updateRegisters(SNRegisters);
   }
}

// initialize the sound effect state

void sfx_initVGM(sfx_data_t *sfx) {
   unsigned char *vgm;

   vgm = sfx->data;

   // "Handle" vgm header ((mostly)ignore it)

   sfx->readptr = vgm + *((unsigned long *)(vgm + 0x34)) + 0x34;
   sfx->loopptr = vgm + *((unsigned long *)(vgm + 0x1C));

   if (sfx->loopptr != NULL) {
      sfx->loopptr += 0x1C;
   }
   sfx->looplength = *((unsigned long *)(vgm + 0x20));
   sfx->loopleft = sfx->looplength;
   sfx->waitFor = _cnt() + 10000000;
}

// play one VGM Sound Effect (until a wait is encountered).

void sfx_playVGM(sfx_data_t *sfx) {
   int i, cont, cmd;
   unsigned char *vgm;
   static unsigned char buffer[64] = "";

   vgm = sfx->data;

   // restore registers 6 & 7 for the channel
   *(SNRegisters + 6) = sfx->reg_6;
   *(SNRegisters + 7) = sfx->reg_7;

   // Below is a somewhat minimalistic implementation of the ".vgm" format
   cont = 1;
   while (cont) {

      if (sfx->loopleft == 0) {
         if (sfx->loopptr && sfx->looplength) {
            sfx->loopleft = sfx->looplength;
            sfx->readptr = sfx->loopptr;
         }
      }

      getn(sfx, buffer, 1);          // Read a command byte
      cmd = buffer[0];
      switch (cmd) {
         case 0x50: // PSG write
            getn(sfx, buffer, 1);   // Read the regsiter value from sd
            sne_setRegister(sfx, buffer[0]); // Write the value to SNEcog
            // save registers 6 & 7 for the channel (in case updated!)
            sfx->reg_6 = *(SNRegisters + 6);
            sfx->reg_7 = *(SNRegisters + 7);

            break;

         case 0x52:
         case 0x53: // OPN2 write
            getn(sfx, buffer, 2); // reg value and address
            i = buffer[0];
            if (cmd == 0x53) {
                i += 256;
               //setOPN2Register(i,buffer[1])
            }
            break;

         case 0x80:
         case 0x81:
         case 0x82:
         case 0x83:
         case 0x84:
         case 0x85:
         case 0x86:
         case 0x87:
         case 0x88:
         case 0x89:
         case 0x8A:
         case 0x8B:
         case 0x8C:
         case 0x8D:
         case 0x8E:
         case 0x8F: // Data bank DAC write + wait
            //SN.setOPN2Register($2A,byte[database][dataptr++])
            if (cmd != 0x80) {
               waitSamples(sfx, cmd & 15);
               cont = 0;
            }
            break;

         case 0x70: 
         case 0x71:
         case 0x72:
         case 0x73:
         case 0x74:
         case 0x75:
         case 0x76:
         case 0x77:
         case 0x78:
         case 0x79:
         case 0x7A:
         case 0x7B:
         case 0x7C:
         case 0x7D:
         case 0x7E:
         case 0x7F: // Wait a short amount of time
            waitSamples(sfx, (cmd & 15)+1);
            cont = 0;
            break;

         case 0x61: // Wait an arbitrary amount of time
            getn(sfx, buffer, 2);
            waitSamples(sfx, buffer[0] | (buffer[1]<<8));
            cont = 0;
            break;

         case 0x62: // Wait 1/60 of a second
            waitSamples(sfx, 735);
            cont = 0;
            break;

         case 0x63: // Wait 1/50 of a second
            waitSamples(sfx, 882);
            cont = 0;
            break;

         case 0xE0: // data bank seek (NYI)
            getn(sfx, buffer, 4);
            sfx->dataptr = (unsigned char *)(*((long *)buffer));
            break;

         case 0x67: // data bank init
            getn(sfx, buffer,6);
            if (buffer[1] == 0) {
               sfx->database = sfx->readptr;
               sfx->dataptr = NULL;
               sfx->readptr += *((long *)(buffer+2));
            }
            break;

         case 0x66:
            if (sfx->play > 1) {
              // restart
              sfx_initVGM(sfx);
            }
            else {
              // stop
              if (sfx->state == 1) {
                sfx->play = 0;
                sfx->state = 0;
              }
              cont = 0;
            }
            break;
         default:
            break;
      }
   }
}

// The SN Emulator SFX manager - this function must be repeatedly called at a 
// rate fast enough to ensure that sound deadlines in the various individual 
// VGM sound files are not missed - otherwise strange sounds will result.

void sne_sfx() {
   int x;
   unsigned long min_waitFor;
   int priority;
   int playing;

   // determine what SHOULD be playing, according to the sound priorities
   priority = 0;
   for (x = 0; x < MAX_SFX; x++) {
      if ((sfx_table[x].play > 0) && (sfx_table[x].priority > priority)) {
         priority = sfx_table[x].priority;
      }
   }
   // abort any lower priority one-off sounds that are still playing
   for (x = 0; x < MAX_SFX; x++) {
      if ((sfx_table[x].play != 2) && (sfx_table[x].state == 1) 
      &&  (sfx_table[x].priority != priority)) {
         sfx_table[x].play = 0;
         sfx_table[x].state = 0;
         sne_reset(); //brutal!
         sfx_initVGM(&sfx_table[x]);
      }
   }
   // set up the SNE registers according to what SHOULD BE playing
   playing = 0;
   for (x = 0; x < MAX_SFX; x++) {
      if ((sfx_table[x].play > 0) && (sfx_table[x].priority == priority)) {
         playing = 1;
         if (sfx_table[x].state == 0) {
            sfx_initVGM(&sfx_table[x]);
            sfx_table[x].state = 1;
         }
         // note that we do a signed operation here, to detect 
         // the case that we just missed a VGM time deadline
         if ((long)sfx_table[x].waitFor - (long)_cnt() <= 0) {
            sfx_playVGM(&sfx_table[x]);
         }
      }
   }
   if (playing) {
      // calculate minimum time to wait before the next SN Emulator update
      min_waitFor = _cnt() + 1000000;
      for (x = 0; x < MAX_SFX; x++) {
        if ((sfx_table[x].state == 1) 
        &&  (sfx_table[x].waitFor < min_waitFor)) {
           min_waitFor = sfx_table[x].waitFor;
        }
      }

      // Wait until the right time to update the SN registers
      _waitcnt(min_waitFor);    
      sne_flipRegisters();
   }
   else {
      // otherwise we have nothing to do - reset the SN Emulator 
      // and delay a small amount of time (to avoid looping too fast!)
      sne_reset();
      _waitms(5);
   }
}

void main() {
   int x;

   _waitsec(1); // in case xternal VT100 emulator in use

   sne_initialize(); // initialize the sound library

   // verify we have loaded the SNE plugin
   if (sne_getRegisters() == NULL) {
      printf("SNE plugin not found!\n");
      exit(1);
   }
   else {
      printf("SNE plugin found, registers at %08x\n", sne_getRegisters());
      printf("Clock Freq = %d (Hz)\n", _clockfreq());
   }

   printf("\n\nPress keys '1' .. '%c' for Sound Effects\n\n", '0' + MAX_SFX);

   // initialize all the SFX sounds 

   for (x = 0; x < MAX_SFX; x++) {
     sfx_initVGM(&sfx_table[x]);
   }

   while (1) {
     
      // call the SNE SFX manager to update the sound effects
      sne_sfx();

      // check for keystrokes '0' .. '5'
      if (k_ready()) {
         int k;
         k = k_get();
         if (isdigit(k) && (k > '0')) {
            k = k - '1';
            if (k < MAX_SFX) {
               printf("SFX %d", k + 1);
               if (k < 4) {
                  // play sounds 1 to 4 once only
                  printf(" once\n");
                  sfx_table[k].play = 1;
               }
               else {
                  // for sounds 5 & 6 toggle repeat play
                  if (sfx_table[k].play == 2) {
                     printf(" off\n");
                     sfx_table[k].play = 0;
                  }
                  else {
                     printf(" on\n");
                     sfx_table[k].play = 2;
                  }
               }
            }
         }
      }
   }
}
