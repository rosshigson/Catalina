/*
 * Simple PSRAM test program. Supported only on the Propeller 2.
 *
 * Use -C P2_EDGE or -C P2_EVAL to indicate the board type you have, and
 * compile with -lhyper or -lpsram to indicate whether to use the PSRAM
 * or the HypeRAM add-on board.
 *
 * Optionally add -D DISPLAY_REGISTRY to display the registry. 
 *
 * For example:
 *
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE 
 * or
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE -D DISPLAY_REGISTRY
 *
 *   catalina -p2 -lhyper -lci ex_psram.c -C P2_EVAL 
 * or
 *   catalina -p2 -lhyper -lci ex_psram.c -C P2_EVAL -D DISPLAY_REGISTRY
 *
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#if defined(__CATALINA_libpsram)

#define ram_writeLong psram_writeLong
#define ram_readLong psram_readLong
#define ram_writeWord psram_writeWord
#define ram_readWord psram_readWord
#define ram_writeByte psram_writeByte
#define ram_readByte psram_readByte
#define ram_write psram_write
#define ram_read psram_read

#elif defined(__CATALINA_libhyper)

#define ram_writeLong hyper_writeLong
#define ram_readLong hyper_readLong
#define ram_writeWord hyper_writeWord
#define ram_readWord hyper_readWord
#define ram_writeByte hyper_writeByte
#define ram_readByte hyper_readByte
#define ram_write hyper_write
#define ram_read hyper_read

#else
#error THIS PROGRAM MUST USE THE PSRAM or HYPER LIBRARY (-lpsram or -lhyper)
#endif

#if !defined(__CATALINA_P2_EDGE) && !defined(__CATALINA_P2_EVAL) 
#error THIS PROGRAM MUST BE COMPILED WITH EITHER -C P2_EDGE or -C P2_EVAL
#endif


#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <plugin.h>
#include <psram.h>

#define MAX_CHARS 1024

/*
 * test string to write - note that the string to be copied to XMM RAM must be
 * in HUB RAM to allow for this program to be compiled as an XMM program
 */
#define TEST_STR "Hello, world - this TEST message coming to you from PSRAM"

/*
 * test addresses to use - note that to compile this program as an XMM
 * program, these addreses must be above the area where the program itself 
 * is stored in the XMM RAM
 */
#define TEST_ADDR (char *)(128*1024) // PSRAM address to write the above string
#define BYTE_ADDR (TEST_ADDR + 20)   // PSRAM address to overwrite in the string
#define WORD_ADDR (TEST_ADDR + 20)   // PSRAM address to overwrite in the string
#define LONG_ADDR (TEST_ADDR + 20)   // PSRAM address to overwrite in the string

#ifdef DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < COG_MAX) {
      printf("Registry Entry %2d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      printf("%-24.24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      printf("$%08x ", *(a_ptr +1));     
      printf("\n");
      i++;
   };
   printf("\n");
}
#endif

// zero the buffer (done before reading it from PSRAM)
void zero_buffer(char *buff) {
   int i;
   for (i = 0; i < MAX_CHARS; i++) {
      buff[i] = 0;
   }
}

void main() {
   char str[MAX_CHARS];
   char buff[MAX_CHARS];
   long data;
   int result;

#ifdef DISPLAY_REGISTRY
   display_registry();
#endif

   strncpy(str, TEST_STR, MAX_CHARS);

   while (1) {
      printf("Press a key to write a TEST string to PSRAM\n");
      k_wait();
      if ((result = ram_write(str, TEST_ADDR, strlen(str) + 1)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = ram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0x44434241;

      printf("Press a key to write a BYTE value to PSRAM\n");
      k_wait();
      if ((result = ram_writeByte(&data, BYTE_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = ram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a BYTE value from PSRAM\n");
      k_wait();
      if ((result = ram_readByte(&data, BYTE_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }

      data = 0x44434241;

      printf("Press a key to write a WORD value to PSRAM\n");
      k_wait();
      if ((result = ram_writeWord(&data, WORD_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = ram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a WORD value from PSRAM\n");
      k_wait();
      if ((result = ram_readWord(&data, WORD_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }

      data = 0x44434241;

      printf("Press a key to write a LONG value to PSRAM\n");
      k_wait();
      if ((result = ram_writeLong(&data, LONG_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = ram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a LONG value from PSRAM\n");
      k_wait();
      if ((result = ram_readLong(&data, LONG_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }
   }
}
