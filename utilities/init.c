/*
 * init - initialize unused RAM, or a specified block. Will never initialize
 *        memory used by the program itself, any allocated memory, or the
 *        stack (it makes an estimate of stack usage!).
 *
 * Usage:
 *
 *    init [addr [size [ value ] ] ]
 *    Note: all parameters are hex values.
 *
 * Compile with a command like the following (note that because we use -lci 
 * instead of -lc we must also use -ltiny to get sscanf!):
 *
 *    catalina init.c -lci -ltiny -C COMPACT -O5 -C C3 -C TTY 
 * or
 *    catalina init.c -p2 -lci -ltiny -C COMPACT -O5 -C P2_EDGE -C TTY
 */
#include <stdio.h>

#ifndef __CATALINA_libc
#ifndef __CATALINA_libtiny
#error THIS PROGRAM MUST BE COMPILED WITH  -lc, -lcx or -ltiny
#endif
#endif

#ifdef __CATALINA_P2
#define HUB_MAX    0x80000
#define FREE_MEM   0x7BFFC
#define BLOCK_SIZE 0x8000 // 32k
#else
#define HUB_MAX    0x8000
#define FREE_MEM   0x7FFC
#define BLOCK_SIZE 0x1000 // 4k
#endif

#define STACK_SIZE 64 // estimate allowance for stack usage

// usage: init addr size val
//        addr is a hex address, default is sbrk()
//        size is a hex number,  default is BLOCK_SIZE
//        val  is a hex number,  default is zero
void main(int argc, char *argv[]) {
   unsigned long min;
   unsigned long max;
   unsigned long addr = 0;
   unsigned long size = BLOCK_SIZE;
   unsigned int val = 0;
   int chunks, i;

   min = sbrk();
   max = *(unsigned long *)FREE_MEM - STACK_SIZE;
   t_printf("min =  %lX\n", min);
   t_printf("max =  %lX\n", max);

   if (argc >= 3) {
      sscanf(argv[3], "%x", &val);
      val &= 0xff;
   }

   if (argc >= 2) {
      sscanf(argv[2], "%x", &size);
      if (size > HUB_MAX) {
         size = HUB_MAX;
      }
   }
   else {
      size = max - min;
   }

   if (argc >= 1) {
      sscanf(argv[1], "%x", &addr);
   }

   if (addr < min) {
      addr = min;
   }

   if (addr + size > max) {
      size = max - addr;
   }

   t_printf("Set %x bytes starting at %x to %X\n", size, addr, val);
   t_printf("Press a key to start\n");

   chunks = size/BLOCK_SIZE;
   for (i = 0; i < chunks; i++) {
      t_printf("Setting %x bytes at %x to %X\n", BLOCK_SIZE, addr, val);
      memset ((void *)addr, val, BLOCK_SIZE);
      addr += BLOCK_SIZE;
   }
   if (addr + size >= max) {
      // do last chunk, which may be partial
      t_printf("Setting %lX bytes at %lX to %X\n", max - addr, addr, val);
      memset((void *)addr, val, max - addr);
   }
   t_printf("Done\n");

   // never exit
   while(1) { }
}

