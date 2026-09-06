/*
 * Simple SN Emulator MD Library ADSR test program. This program must be 
 * compiled with the command line switch -lsoundsne to enable the SN Emulator
 * sound plugin. 
 *
 * Works best at 250 Mhz or greater.
 *
 * Compile this program with a command like:
 *
 *   catalina -p2 -lci -lsoundsne md_adsr.c -C MHZ_260
 *
 * This is an interactive program. For example, use payload to load and 
 * interact with it as follows:
 *
 *   payload -o2 -i md_adsr
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
 *    catalina -p2 -lci -lsoundsne md_adsr.c -C SND_FREQUENCY=4000000
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <ctype.h>
#include <soundmd.h>
#include <musictab.h>
  
#if !defined(__CATALINA_SNE_FREQUENCY) || (__CATALINA_SNE_FREQUENCY != 4000000)
#error THIS PROGRAM EXPECTS SNE_FREQUENCY OF 4000000 (e.g. -C SNE_FREQUENCY=4000000)
#endif

#define RCV_BUF_SIZE 32

char rcvBuf[RCV_BUF_SIZE];  // buffer for characters received from the console

adsrEnvelope_t adsr[MAX_CHANNELS];

uint16_t timePlay = 200;       // note playing time in ms
uint16_t volume   = VOL_MAX;   // note playing volume
uint8_t channel   = 0;         // Channel being exercised

char *getNum(uint16_t *n, char *psz) {
  *n = 0;

  while (*psz >= '0' && *psz <= '9')
  {
    *n = (*n * 10) + (*psz - '0');
    psz++;
  }
  
  if (*psz != '\0') psz--;
  
  return(psz);
}

void handlerZ(char* param) { 
  printf("Reset\n");
  sne_reset();
}
      
void handlerN(char *param)
// Play note
{
  uint16_t midiNote;

  getNum(&midiNote, param);

  if (timePlay <= adsr[channel].Ta + adsr[channel].Td + adsr[channel].Tr) {
    timePlay = adsr[channel].Ta + adsr[channel].Td + adsr[channel].Tr;
  }
  if (mt_findId(midiNote)) {
    uint16_t f = (uint16_t)(mt_getFrequency() + 0.5);  // round it up
    char buf[32];

    printf("Play %d (%s) @ %d Hz for %d ms\n", 
           midiNote, mt_getName(buf, sizeof(buf)), f, timePlay);
    md_note(channel, f, volume, timePlay);
  }
}

void handlerO(char *param)
{
  noiseType_t n = PERIODIC_0;

  switch (toupper(param[0]))
  {
  case 'P':
    switch (param[1])
    {
    case '0': n = PERIODIC_0; break;
    case '1': n = PERIODIC_1; break;
    case '2': n = PERIODIC_2; break;
    }
    break;

  case 'W':
    switch (param[1])
    {
    case '0': n = WHITE_0; break;
    case '1': n = WHITE_1; break;
    case '2': n = WHITE_2; break;
    }
    break;
  }

  if (timePlay <= adsr[channel].Ta + adsr[channel].Td + adsr[channel].Tr) {
    timePlay = adsr[channel].Ta + adsr[channel].Td + adsr[channel].Tr;
  }

  printf("Noise %d for %d ms\n", n, timePlay);
  md_noise(n, volume, timePlay);
}

void handlerC(char *param)
// set channel
{
  uint16_t n;
  
  getNum(&n, param);

  if (n < MAX_CHANNELS) channel = n;
  printf("Channel %d\n", channel);
}

void handlerV(char* param)
// Channel Volume
{
  getNum(&volume, param);
  if (volume > VOL_MAX) {
    volume = VOL_MAX;
  }
  printf("Volume %d\n", volume);
}

void handlerT(char *param)
// time duration
{
  getNum(&timePlay, param);
  printf("Time %d\n", timePlay);
}

void handlerI(char* param)
// Invert true/false
{
  uint16_t n;

  getNum(&n, param);
  adsr[channel].invert = (n != 0);
  printf("Invert %d\n", adsr[channel].invert);
}
      
void handlerA(char* param)
// Attack ms
{
  getNum(&adsr[channel].Ta, param);
  printf("Ta %d\n", adsr[channel].Ta);
}

void handlerD(char* param)
// Decay ms
{
  getNum(&adsr[channel].Td, param);
  printf("Td %d\n", adsr[channel].Td);
}

void handlerS(char* param)
// Sustain deltaVs
{
  uint16_t n;

  getNum(&n, param);
  adsr[channel].deltaVs = n;
  printf("deltaVs %d\n", adsr[channel].deltaVs);
}

void handlerR(char *param)
// Release ms
{
  getNum(&adsr[channel].Tr, param);
  printf("Tr %d\n", adsr[channel].Tr);
}

void handlerP(char* param)
{
  uint8_t i;

  printf("\nChan\tInv\tTa\tTd\tdVs\tTr\n");
  for (i = 0; i < MAX_CHANNELS; i++)
  {
    printf("%d", i);               printf("\t");
    printf("%d", adsr[i].invert);  printf("\t");
    printf("%d", adsr[i].Ta);      printf("\t");
    printf("%d", adsr[i].Td);      printf("\t");
    printf("%d", adsr[i].deltaVs); printf("\t");
    printf("%d", adsr[i].Tr);      printf("\t");
    printf("\n");
  }
  printf("\n");
}


void handlerH(char *param) {
  printf("\ncmd  param    meaning\n");
  printf("===  =====    =======\n");
  printf(" i     b      Set Invert ADSR (invert b=1, noninvert b=0)\n");
  printf(" a     t      Set Attack time to t ms\n");
  printf(" d     t      Set Decay time to t ms\n");
  printf(" s     v      Set Sustain delta level to v units [0..15]\n");
  printf(" r     t      Set Release time to t ms\n");
  printf(" c     n      Set channel to n ([0..2] for note, 3 for noise)\n");
  printf(" v     v      Set channel volume to v [0..15]\n");
  printf(" t     t      Set play time duration to t ms\n");
  printf(" n     m      Play MIDI Note m\n");
  printf(" o     tf     Play Noise sound type t [P,W] freq f [0..2]\n");
  printf(" p            Show current ADSR parameters\n");
  printf(" z            Software reset\n");
  printf(" h            Show this help\n");
  printf(" ?            Show this help\n\n");
}

void setup(void)
{
  uint8_t i;
  md_begin();
  for (i = 0; i < MAX_CHANNELS; i++) {
    adsr[i].invert = false;
    adsr[i].deltaVs = 3;
    adsr[i].Ta = 20;
    adsr[i].Td = 30;
    adsr[i].Tr = 50;
    md_setADSR(i, &adsr[i]);
    md_setVolume(i, 0);
  };

  printf("\nMD_SN76489 ADSR Envelope\n");
}

void do_command() {
  int cmd;
  char *param;
  int i;

  while (!k_ready()) {
     md_play();
     _waitms(10);
  }
  cmd = 0;
  while ((cmd!='\n') && ((cmd < 32) || (cmd > 127))) {
     cmd = k_get();
  }
  if (cmd == '\n') {
     return;
  }
  printf("%c", cmd); fflush(stdout);
  i = 0;
  while ((i < RCV_BUF_SIZE-1) && ((rcvBuf[i] = k_wait()) != '\n')) {
     printf("%c",rcvBuf[i]); fflush(stdout);
     i++;
  }
  printf("\r\n"); fflush(stdout);
  rcvBuf[i] = 0;
  i = 0;
  while ((i < RCV_BUF_SIZE-1) && (rcvBuf[i] != '\n') 
      && (rcvBuf[i] != 0) && !isalnum(rcvBuf[i])) {
     i++;
  }
  if (isalnum(rcvBuf[i])) {
     param = &rcvBuf[i];
  }
  else {
     param = NULL;
  }

  switch (tolower(cmd)) {
     case 'i':
        handlerI(param);
        break;
     case 'a':
        handlerA(param);
        break;
     case 'd':
        handlerD(param);
        break;
     case 's':
        handlerS(param);
        break;
     case 'r':
        handlerR(param);
        break;
     case 'c':
        handlerC(param);
        break;
     case 'v':
        handlerV(param);
        break;
     case 't':
        handlerT(param);
        break;
     case 'n':
        handlerN(param);
        break;
     case 'o':
        handlerO(param);
        break;
     case 'p':
        handlerP(param);
        break;
     case 'z':
        handlerZ(param);
        break;
     case 'h':
     case '?':
        handlerH(param);
        break;
     default:
        printf("Unknown command\n");
        handlerH(NULL);
        break;
  }
}

void main(void)
{
   _waitsec(1); // in case external terminal emulator in use

  setup();

   // verify we have loaded the SNE plugin
   if (sne_getRegisters() == NULL) {
      printf("SNE plugin not found!\n");
      exit(1);
   }
   else {
      printf("SNE plugin found, registers at %08x\n", sne_getRegisters());
      printf("Clock Freq = %d (Hz)\n", _clockfreq());
   }

  handlerH(NULL);

  while(1) {
     printf("\n> ");fflush(stdout);
     do_command();
  }
}
