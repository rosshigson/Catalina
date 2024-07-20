/*
 * Simple Hyper RAM / PSRAM XMM load program. 
 *
 * Supported only on the Propeller 2
 * .
 * The program will be loaded into Hyper RAM or PSRAM but not started. That has
 * to be done by loading the required plugins and an XMM kernel (e.g. by using
 * the start.c program). However, note that while this program can load either
 * XMM SMALL or XMM_LARGE programs, the start.c program can only start XMM 
 * LARGE programs.
 *
 * For example:
 *
 *   catalina -p2 -lhyper -lcx loader.c -C P2_EVAL -C SIMPLE 
 *
 * or
 *
 *   catalina -p2 -lpsram -lcx loader.c -C P2_EDGE -C SIMPLE 
 *
 * Optionally add -C DISPLAY_TEST     to test RAM before load.
 * Optionally add -C DISPLAY_PROLOGUE to display the prologue.
 * Optionally add -C DISPLAY_DATA     to display all data loaded.
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#ifdef __CATALINA_LARGE
#error THIS PROGRAM CANNOT BE COMPILED IN LARGE MODE
#endif

#include <stdio.h>
#include <stdint.h>
#include <plugin.h>
#if defined(__CATALINA_HYPER)||defined(__CATALINA_libhyper)
#include <hyper.h>
#define ram_read hyper_read
#define ram_write hyper_write
#elif defined(__CATALINA_PSRAM)||defined(__CATALINA_libpsram)
#include <psram.h>
#define ram_read psram_read
#define ram_write psram_write
#else
#error THIS PROGRAM MUST BE COMPILED WITH PSRAM OR HYPER DEFINED (e.g. -C HYPER)
#endif

#define PROLOGUE_SIZE   0x00200    // size of prologue (one sector)
#define PROLOGUE_OFFS   0x10000    // file offset of prologue (64kb)
#define LAYOUT_OFFS        0x10    // offset of layout in prologue
#define PROLOGUE_ORGH   0x01000    // Hub RAM (orgh) of prologue

#define RAM_TEST      0x01000      // RAM address to write test data
#define RAM_DEST      0x00000      // RAM address to write file data

#define MAX_BYTES 1024             // bytes to read/write at a time
                                   // (must be at least PROLOGUE_SIZE)


#define __CATALINA_DISPLAY_PROLOGUE

// zero the buffer 
void zero_buffer(unsigned char *buff, int size) {
   int i;
   for (i = 0; i < size; i++) {
      buff[i] = 0;
   }
}

unsigned long load_long(unsigned char *buff, int offs) {
   return (buff[offs+3]<<24) 
        + (buff[offs+2]<<16) 
        + (buff[offs+1]<<8) 
        + (buff[offs]);
}

#ifdef __CATALINA_DISPLAY_TEST
char test[] = "This is a TEST string for RAM";
#endif

int main(int argc, char *argv[]) {
   unsigned char buff1[MAX_BYTES];
   unsigned char buff2[MAX_BYTES];
   unsigned char prologue[PROLOGUE_SIZE];
   unsigned int dest = RAM_DEST;
   int result;
   FILE *file;
   int i,j;
   unsigned long val;

   // data read from prologue:
   unsigned long seglayout = 0;
   unsigned long Catalina_Code = 0;
   unsigned long Catalina_Cnst = 0;
   unsigned long Catalina_Init = 0;
   unsigned long Catalina_Data = 0;
   unsigned long Catalina_Ends = 0;
   unsigned long Catalina_RO_Base = 0;
   unsigned long Catalina_RW_Base = 0;
   unsigned long Catalina_RO_Ends = 0;
   unsigned long Catalina_RW_Ends = 0;
   unsigned long init_PC = 0;

   if (argc <= 1) {
      printf("No file to load specified\n");
      exit(1);
   }
   if ((file = fopen((const char *)argv[1], "rb")) == NULL) {
      printf("Cannot open file '%s'\n", argv[1]);
      exit(1);
   }

#ifdef __CATALINA_DISPLAY_TEST
   printf("Writing a TEST string to RAM\n");
   if ((result = ram_write(test, (char *)RAM_TEST, strlen(test) + 1)) < 0) {
      printf("write error: %d\n", result);
      exit(1);
   }
   else {
      printf("write ok\n");
   }
   zero_buffer(buff1, MAX_BYTES);
   printf("Reading a TEST string from RAM\n");
   if ((result = ram_read(buff1, (char *)RAM_TEST, MAX_BYTES)) < 0) {
      printf("read error: %d\n", result);
   }
   else {
      if (strcmp(test, buff1) == 0) {
         printf("read/write test passed\n");
      }
      else {
         printf("read/write test failed\n");
         exit(1);
      }
   }
#endif

   if (fseek(file, PROLOGUE_OFFS, SEEK_SET) != 0) {
      printf("Cannot find prologue in file '%s'\n", argv[1]);
      exit(1);
   } 
   zero_buffer(prologue, PROLOGUE_SIZE);
   for (i = 0; i < PROLOGUE_SIZE; i++) {
      int ch = fgetc(file);
      if (ch == EOF) {
         printf("Cannot read prologue in file '%s'\n", argv[1]);
         exit(1);
      }
      prologue[i] = ch;
      //printf("%02X ", prologue[i]);
   }
   
   seglayout        = load_long(prologue, LAYOUT_OFFS+0);
   Catalina_Code    = load_long(prologue, LAYOUT_OFFS+4);
   Catalina_Cnst    = load_long(prologue, LAYOUT_OFFS+8);;
   Catalina_Init    = load_long(prologue, LAYOUT_OFFS+12);
   Catalina_Data    = load_long(prologue, LAYOUT_OFFS+16);
   Catalina_Ends    = load_long(prologue, LAYOUT_OFFS+20);
   Catalina_RO_Base = load_long(prologue, LAYOUT_OFFS+24);
   Catalina_RW_Base = load_long(prologue, LAYOUT_OFFS+28);
   Catalina_RO_Ends = load_long(prologue, LAYOUT_OFFS+32);
   Catalina_RW_Ends = load_long(prologue, LAYOUT_OFFS+36);
   init_PC          = load_long(prologue, LAYOUT_OFFS+40);

#ifdef __CATALINA_DISPLAY_PROLOGUE
   printf("\nPrologue:\n");
   printf("Layout           = %08X\n", seglayout);
   printf("Catalina_Code    = %08X\n", Catalina_Code);
   printf("Catalina_Cnst    = %08X\n", Catalina_Cnst);
   printf("Catalina_Init    = %08X\n", Catalina_Init);
   printf("Catalina_Data    = %08X\n", Catalina_Data);
   printf("Catalina_Ends    = %08X\n", Catalina_Ends);
   printf("Catalina_RO_Base = %08X\n", Catalina_RO_Base);
   printf("Catalina_RW_Base = %08X\n", Catalina_RW_Base);
   printf("Catalina_RO_Ends = %08X\n", Catalina_RO_Ends);
   printf("Catalina_RW_Ends = %08X\n", Catalina_RW_Ends);
   printf("init_PC          = %08X\n", init_PC);
#endif

   if ((seglayout != 2) && (seglayout != 5)) {
      printf("prologue contains unrecognized layout (%d)\n", seglayout);
      exit(1);
   }
   if ((result = ram_write(prologue, (char *)dest, i)) < 0) {
      printf("prologue write error: %d\n", result);
      exit(1);
   }
   if ((result = ram_read(buff2, (char *)dest, i)) < 0) {
      printf("prologue read error: %d\n", result);
      exit(1);
   }
   if (strncmp(prologue, buff2, i) != 0) {
      printf("prologue compare error: %d\n", result);
      exit(1);
   }
   if (seglayout == 5) {
      dest += PROLOGUE_SIZE;
   }
   else {
      // we need to add unused space back in for short layout 2
      dest += PROLOGUE_ORGH + PROLOGUE_SIZE;
   }

   while (!feof(file)) {
      zero_buffer(buff1, MAX_BYTES);
      zero_buffer(buff2, MAX_BYTES);
      i = 0;
      while (i < MAX_BYTES) {
         int ch = fgetc(file);
         if (ch == EOF) {
            break;
         } 
         buff1[i++] = ch;
      }
      if (i > 0) {
         unsigned long val;

#ifdef __CATALINA_DISPLAY_DATA
         printf("Writing to %08lX\n", dest);
         for (j = 0; j < i/4; j++) {
            val = load_long(buff1, j*4);
            printf("%08lX ", val);
            if ((j % 8) == 7) {
               printf("\n");
            }
         }
         printf("\n");
#endif
         if ((result = ram_write(buff1, (char *)dest, i)) < 0) {
            printf("write error: %d\n", result);
            exit(1);
         }
         if ((result = ram_read(buff2, (char *)dest, i)) < 0) {
            printf("read error: %d\n", result);
            exit(1);
         }
         if (strncmp(buff1, buff2, i) != 0) {
            printf("compare error\n");
            exit(1);
         }
      }
      dest += MAX_BYTES;
   }

   _waitsec(1);
   return 0;
}
