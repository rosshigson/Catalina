#include <soundsne.h>
#include <string.h>

extern unsigned long *SNRegisters;

static unsigned long waitFor;
static unsigned char *readptr;
static unsigned char *database;
static unsigned char *dataptr;
static unsigned char *loopptr;
static unsigned long loopleft, looplength;
static unsigned char buffer[64];
static unsigned long speed_divisor;

static int noiseReset = 0;
static int regist = 0;

#define CD_SAMPLE_RATE 44100

static void waitSamples(unsigned long n) {
   unsigned long ct;
   unsigned long wait;
   if (readptr >= loopptr) {
     loopleft -= n;
   }
   wait = ((_clockfreq()/(CD_SAMPLE_RATE*speed_divisor)) * (n) );
   if (wait < 50) {
      wait = 50;
   }
   waitFor += wait;
   ct = _cnt();
   if (waitFor - ct < 100) {
      waitFor = _cnt() + 100;
   }
}

static void getn(unsigned char *buf, unsigned long n) {
   memcpy(buf, readptr, n);
   readptr += n;
}

void sne_setRegister(unsigned char data) {
   if (SNRegisters != NULL) {
      if (data & 0x80) {
       regist = (data >> 4) & 0x7;
       *(SNRegisters + regist) = (*(SNRegisters + regist) & (0x3F<<4)) | (data & 0xF);
     }
     else if ((regist & 1) || (regist > 5)) {
        // data word into short register
        *(SNRegisters + regist) = data & 0xF;
     }
     else {
        // data word into tone register
        *(SNRegisters + regist) = (*(SNRegisters + regist) & 0xF) | ((data & 0x3F) << 4);
      }
      if (regist == 6) {
         // | This is ONLY needed to make the "shadow registers" work 
         // | properly with "noise reset"
         // | and is NOT needed if writing directly to the normal registers
         // | Feel free to remove these lines if that's the case
         noiseReset = 1;  
      }
   }
}

static void sne_updateRegisters(unsigned long *source) {
// ┌──────────────────────────────────────────────────────────────┐
// │                  Update all 8 SN registers                   │
// ├──────────────────────────────────────────────────────────────┤
// │ source - A pointer to an array containing 16 bytes to update │
// │          the 8 SN registers with.                            │
// └──────────────────────────────────────────────────────────────┘
   if (SNRegisters != NULL) {
      memmove(SNRegisters, source, 8*4);
   }
}

static void sne_flipRegisters() {
// ┌──────────────────────────────────────────────────────────────┐
// │Writes all the values from the shadow regs to the normal regs │
// ├──────────────────────────────────────────────────────────────┤
// │NOTE!! This method is ONLY needed when shadow registers are   │
// │used                                                          │
// └──────────────────────────────────────────────────────────────┘
   if (SNRegisters != NULL) {
      if (noiseReset) {
         *(SNRegisters + 6) &= 255;
         noiseReset = 0;
      }
      else {
         *(SNRegisters + 6) |= 256;
      }

      sne_updateRegisters(SNRegisters);
   }
}

void sne_playVGM(unsigned char *vgm, unsigned long speed_div) {
   int i, cont, cmd;

   sne_setFreq(2, 0);
   speed_divisor = speed_div;

   // "Handle" vgm header ((mostly)ignore it)

   readptr = vgm + *((unsigned long *)(vgm + 0x34)) + 0x34;
   loopptr = vgm + *((unsigned long *)(vgm + 0x1C));

   if (loopptr != NULL) {
      loopptr += 0x1C;
   }
   looplength = *((unsigned long *)(vgm + 0x20));
   loopleft = looplength;

   // Below is a somewhat minimalistic implementation of the ".vgm" format
   // Have a look at the .vgm file format documentation for better understanding
   waitFor = _cnt() + 10000000;
   while (1) {

      cont = 1;
      while (cont) {

         if (loopleft == 0) {
            if (loopptr && looplength) {
               loopleft = looplength;
               readptr = loopptr;
            }
         }

         getn(buffer, 1);          // Read a command byte
         cmd = buffer[0];
         switch (cmd) {
            case 0x50: // PSG write
               getn(buffer, 1);            // Read the regsiter value from sd
               sne_setRegister(buffer[0]); // Write the value to SNEcog
               break;

            case 0x52:
            case 0x53: // OPN2 write
               getn(buffer, 2); // reg value and address
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
                  waitSamples(cmd & 15);
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
            case 0x7F: // Wait a short amount of timea
               waitSamples((cmd & 15)+1);
               cont = 0;
               break;

            case 0x61: // Wait an arbitrary amount of time
               getn(buffer, 2);
               waitSamples(buffer[0] | (buffer[1]<<8));
               cont = 0;
               break;

            case 0x62: // Wait 1/60 of a second
               waitSamples(735);
               cont = 0;
               break;

            case 0x63: // Wait 1/50 of a second
               waitSamples(882);
               cont = 0;
               break;

            case 0xE0: // data bank seek (NYI)
               getn(buffer, 4);
               dataptr = (unsigned char *)(*((long *)buffer));
               break;

            case 0x67: // data bank init
               getn(buffer,6);
               if (buffer[1] == 0) {
                  database = readptr;
                  dataptr = NULL;
                  readptr += *((long *)(buffer+2));
               }
               break;

            case 0x66:
               return;
               break;
            default:
               break;
         }
      }

      _waitcnt(waitFor);    // Wait until the right time to
      sne_flipRegisters(); // Update the SN registers
   }
}
