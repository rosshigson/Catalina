/*
 * Simple Hub RAM dump program. 
 *
 * Supported only on the Propeller 2.
 *
 *   catalina -p2 -lci dump.c -C P2_EDGE -C SIMPLE 
 *
 * Accepts a command-line parameter to specify the address to dump, which
 * can be specified as a plain decimal number, or as $hex, or as 0xhex
 * For example:
 *
 *    dump 1000      <-- decimal 1000
 *    dump $1000     <-- hex 1000
 *    dump 0x1000    <-- hex 1000
 *
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#include <stdio.h>
#include <stdint.h>
#include <plugin.h>

#define MAX_LONGS 8             // size to read/write at a time

// zero the buffer 
void zero_buffer(unsigned long *buff, int size) {
   int i;
   for (i = 0; i < size; i++) {
      buff[i] = 0;
   }
}

int ram_read(unsigned long *dst, char *src, int bytes) {
   int i;
   unsigned char b1, b2, b3, b4;
   unsigned long l;

   for (i = 0; i < bytes/4; i++) {
      b1 = *((unsigned char *)src); src++;
      b2 = *((unsigned char *)src); src++;
      b3 = *((unsigned char *)src); src++;
      b4 = *((unsigned char *)src); src++;
      l = (b4<<24) + (b3<<16) + (b2<<8) + (b1);
      *dst = l;
      dst++;
   }
   return 0;
}

int main(int argc, char *argv[]) {
   unsigned long buff[MAX_LONGS];
   unsigned long addr = 0;
   long data;
   int result;
   int i;
   char ch;

#if __CATALINA_VT100
   _waitms(500);
#endif
   if (strncmp(argv[1],"$",1) == 0) {
      sscanf(argv[1]+1, "%x", &addr);
   }
   else if ((argv[1][0] == '0') && (toupper(argv[1][1]) == 'X')) {
      sscanf(argv[1]+2, "%x", &addr);
   }
   else {
      sscanf(argv[1], "%d", &addr);
   }
   printf("Dumping RAM Address 0x%06X (%ld)\n", addr, addr);
   printf("Press a key to continue (ESC to exit)\n");

   while (1) {
      zero_buffer(buff, MAX_LONGS);
      if ((result = ram_read(buff, (char *)addr, MAX_LONGS*4)) < 0) {
         printf("read error: %d\n", result);
      }
   
      printf("%06X:");
      for (i = 0; i < MAX_LONGS; i++) {
         printf("%08X ", buff[i]);
      }
      printf("\n");
      ch = k_wait();
      if (ch == 0x1b) {
         break;
      }
      addr += MAX_LONGS*4;
   }
   return 0;
}
