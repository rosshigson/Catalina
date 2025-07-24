/******************************************************************************
 *                      PSRAM/HyperRAM Delay Test Program                     *
 *                                                                            *
 * With thanks to rogloh for the original SPIN version. This version does not *
 * restart the External RAM driver dynamically, so it cannot adjust either    *
 * the pins or the delay time - it simply tests the configuration currently   *
 * set in the platfrom  configuration file it has been compiled to use        *
 * (i.e. P2EDGE.inc or P2EVAL.inc).                                           *
 *                                                                            *
 * To use it, compile the program in NATIVE or COMPACT mode, specifying the   *
 * platform and library to use, and then run the program across a range of    *
 * clock speeds to see if the delay is reliable. The program can be compiled  *
 * to use either PSRAM or HYPER RAM by specifying the appropriate library (if *
 * supported by the platform). For example:                                   *
 *                                                                            *
 *   catalina -p2 -lci delay.c -C P2_EDGE -lpsram                             *
 * or                                                                         *
 *   catalina -p2 -lci delay.c -C P2_EDGE -lhyper                             *
 * or                                                                         *
 *   catalina -p2 -lci delay.c -C P2_EVAL -lhyper                             *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <prop2.h>
#include <hmi.h>

// verify compile time options are valid 
#if !defined(__CATALINA_P2)
  #error ERROR: Only Propeller 2 platforms supported
#endif

#if !defined(__CATALINA_NATIVE) && !defined(__CATALINA_COMPACT)
  #error ERROR: This program must be compiled in NATIVE or COMPACT mode
#endif

#if !defined(__CATALINA_P2_EDGE) && !defined(__CATALINA_P2_EVAL)
  #error ERROR: Only P2 Edge and P2 Evaluation board supported
#endif

#if defined(__CATALINA_libpsram)
  #if defined(__CATALINA_P2_EVAL)
    #error ERROR: PSRAM is only supported on the P2 Edge
  #endif
#elif !defined(__CATALINA_libhyper)
  #error ERROR: This program must be compiled with -lhyper or -lpsram
#endif

#if defined(__CATALINA_libhyper)
#include <hyper.h>
#define mem_read  hyper_read
#define mem_write hyper_write
#endif

#if defined(__CATALINA_libpsram)
#include <psram.h>
#define mem_read  psram_read
#define mem_write psram_write
#endif

#define BUFSIZE     128 
#define RAM_START   0

//clock source (used below)
#define CLKSRC_XTAL 1
#define CLKSRC_XIN  2

// setup one of these based on your P2 HW input clock, 
#define CLKIN_HZ 20000000    // assume 20MHz crystal by default, otherwise
                             // this should be set to xinfreq

#define CLKSRC CLKSRC_XTAL   // enable this for crystal clock source (default)
//#define CLKSRC CLKSRC_XIN  // enable this for direct input clock source 
                             // on XI (no crystal)

// parameters used when automatically determining PLL settings
#define TOLERANCE_HZ 500000    // pixel clock accuracy will be 
                               // constrained by this when no exact ratios 
                               // are found

#define MAXVCO_HZ    350000000 // for safety, but you could try to overclock 
                               // even higher at your own risk

#define MINVCO_HZ    100000000

#define MINPLLIN_HZ  500000    // setting lower can find more PLL ratios 
                               // but may begin to introduce more PLL jitter

// global variables
static uint32_t writebuffer[BUFSIZE];  // data to be written
static uint32_t readbuffer[BUFSIZE];   // data that is read back
static uint32_t init_freq  = 0;
static uint32_t init_mode  = 0;
static uint32_t escape = 0;

/*
 * getPin : get pin configured in platform configuration file
 */
uint32_t getPin(void) {
#if defined(__CATALINA_COMPACT)
   PASM(" word I16B_PASM\n"
        " alignl\n");
#endif
#if defined(__CATALINA_libpsram)
   return PASM(" mov r0, #PSRAM_DATABUS\n");
#else
   return PASM(" mov r0, #HYPER_BASE_PIN\n");
#endif
}

/*
 * getDelay : get delay configured in platform configuration file
 */
uint32_t getDelay(void) {
#if defined(__CATALINA_COMPACT)
   PASM(" word I16B_PASM\n"
        " alignl\n");
#endif
#if defined(__CATALINA_libpsram)
   return PASM(" mov r0, #PSRAM_DELAY\n");
#else
   return PASM(" mov r0, #HYPER_DELAY_RAM\n");
#endif
}

/*
 * getdec : get a decimal number, processing backspace, delete and escape
 */
uint32_t getdec(uint32_t def) {
   uint32_t num = 0;
   int ch, c;

   c = 0;
   while(1) {
      ch = k_get();
      if (ch == '\n') {
         if (c == 0) {
            num = def;
            printf("%d", def);
         }
         printf("\n");
         break;
      }
      if (((ch == 8) || (ch == 127)) && c) {
         printf("%c %c", 8, 8);
         num = num/10;
         c--;
      }
      if (ch == 27) {
         break;
      }
      if ((ch < '0') || (ch > '9') || (c == 10)) {
         continue;
      }
      printf("%c", ch);
      num = num * 10 + (ch - '0');
      c++;
   }
   return num;
}

/*
 * compareBuf : compare read and write buffers, 
 *              returning number of mismatches and first bad match
 */
uint32_t compareBuf(int32_t *firstbad) {
   uint32_t mismatches = 0;
   uint32_t i;

   *firstbad = -1;
   for (i = 0; i < BUFSIZE; i++) {
      if (readbuffer[i] != writebuffer[i]) {
         mismatches++;
         if (*firstbad < 0) { 
           // capture first bad position found
           *firstbad = i;
         }
      }
   }
   return mismatches;
}

/*
 * randomizeBuf : fill write buffer with random data
 */
void randomizeBuf() {
   uint32_t r;
   uint32_t i;
   for (i = 0; i < BUFSIZE; i++) { 
      writebuffer[i] = getrand();
   }
}

/* 
 * computeClockMode : returns best mode for the given frequency
 */
uint32_t computeClockMode(uint32_t desiredHz) {
   uint32_t vco, finput, fval, p, div, m, error, bestError;
   uint32_t mode = 0;

   bestError = -1;
   for (p = 0; p <= 30; p += 2) {
      // compute the ideal VCO frequency fval at this value of P
      if (p != 0) {
         if (desiredHz > MAXVCO_HZ/p) { // test it like this to not overflow
            break;
         }
         fval = desiredHz * p;
      }
      else {
         fval = desiredHz;
         if (fval > MAXVCO_HZ) {
            break;
         }
      }
      // scan through D values, and find best M, retain best case
      for (div = 1; div <= 64; div++) {
         // compute the PLL input frequency from the crystal 
         // through the divider
         finput = CLKIN_HZ/div;
         if (finput < MINPLLIN_HZ) {
            // input getting too low, and only gets lower so quit now
            break;
         }

         // determine M value needed for this ideal VCO frequency 
         // and input frequency
         m = fval / finput;

         // check for the out of divider range case
         if (m > 1024) {
            break;
         }

         // zero is special and gets a second chance
         if (m == 0) {
             m++;
         }

         // compute the actual VCO frequency at this particular M, D setting
         vco = finput * m;
         if (vco < MINVCO_HZ) {
             break;
         }
         if (vco > MAXVCO_HZ) {
             break;
         }

         // compute the error and check next higher M value if possible, 
         // it may be closer
         error = abs(fval - vco);
         if ((m < 1024) && ((vco + finput) < MAXVCO_HZ)) {
            if (error > abs(fval - (vco + finput))) {
                error = abs(fval - (vco + finput));
                m++;
            }
         }
         // retain best allowed frequency error and divider bits found so far
         if ((error < bestError) && (error < TOLERANCE_HZ+1)) {
            bestError = error;
            mode = ((div-1) << 18) + ((m-1) << 8) + (((p/2 - 1) & 0xf) << 4);

           // quit whenever perfect match found
           if (bestError == 0) {
              break;
           }
         }
      }
      if (bestError == 0) {
         break;
      }
   }

   // final clock mode format is 0000_000E_DDDD_DDMM_MMMM_MMMM_PPPP_CCSS
   if (mode) {
      // set 15 or 30pF capacitor loading based on input crystal frequency
      mode |= (1<<24); // enable PLL
      if (CLKSRC == CLKSRC_XTAL) { 
         // enable oscillator and caps for crystal
         mode |= ((CLKIN_HZ < 16000000) ? 0xF : 0xB); // %1111 : %1011;
      }
      else {
         mode |= 0x7; // %0111; // don't enable oscillator
      }
   }
   return mode;
}

/*
 * testRAM - test external RAM using the current frequency and mode,
 *           returning failure count
 */
uint32_t testRAM() {
   uint32_t failcount = 0;
   int32_t status = 0;
   int32_t pos = -1;
   uint32_t i, j;
   uint32_t mismatches = 0;

   for (i = 1; i <= 100; i++) {
      status = k_get();
      if (status == 27) {
         escape = 1;
         break;
      }
      // randomize buffer
      randomizeBuf();
      // write data to RAM
      status = mem_write(writebuffer, RAM_START, BUFSIZE*4);
      if (status != 0) {
         _clkset(init_mode, init_freq);
         printf("Write failed, iteration %3d, status = %d\n", i, status);
         break;
      }
      // clear read buffer
      for (j = 0; j < BUFSIZE; j++) {
         readbuffer[j] = 0;
      }
      // read data from RAM
      status = mem_read(readbuffer, RAM_START, BUFSIZE*4);
      if (status != 0) {
         _clkset(init_mode, init_freq);
         printf("Read failed, iteration %d, status = %d\n", i, status);
         break;
      }
      mismatches = compareBuf(&pos);
      if (mismatches > 0) {
         failcount++;
         /*
         // enable for diagnosis only (disrupts testing) ...
         _clkset(init_mode, init_freq);
         printf("\nIteration %d has %d block read errors\n", 
            i, mismatches);
         printf("  sent %08X and received %08X at offset %d\n",
            writebuffer[pos], readbuffer[pos], pos);
         break;
         */
      }
   }
   return failcount;
}

void main(void) {
   uint32_t failcount  = 0;
   uint32_t start_freq = 50;
   uint32_t end_freq   = 350;
   uint32_t new_freq;
   uint32_t new_mode;

   _waitsec(1); // pause in case we are using external terminal emulator

   init_freq  = _clockfreq();
   init_mode  = _clockmode();
   printf("Initial Frequency = %9d, Initial mode = %08X\n\n", 
       init_freq, init_mode);

   printf("External RAM is on pin %d\n", getPin());
   printf("Specified RAM Delay is %d\n\n", getDelay());
   _waitms(500); // let serial output complete

   printf("Enter starting frequency to test in MHz (50-350) : [50] ");
   start_freq = getdec(50);
   printf("Enter ending frequency to test in MHz %3d-350)  : [350] ", 
       start_freq);
   end_freq = getdec(350);

   printf("\nFrequency Success%%\n");
   for (new_freq = start_freq*1E6; new_freq <= end_freq*1E6; new_freq += 1E6) {
      new_mode = computeClockMode(new_freq);
      if (new_mode == 0) {
         printf("Frequency %9d is unattainable, stopping\n", new_freq);
         escape = 1;
      }
      else {
         printf("%9d   ", new_freq);
         _waitms(500); // let serial output complete
         _clkset(new_mode, new_freq);
         failcount = testRAM();
         _clkset(init_mode, init_freq);
         printf("%3d%%\n", (100-failcount));
         //printf("%3d%%     (mode %08X)\n", (100-failcount), new_mode);
      }
      if (escape) {
         break;
      }
   }

   if (escape) {
      printf("Aborted!\n");
   }
   else {
      printf("Completed\n");
   }
   _waitms(500); // let serial output complete
}
