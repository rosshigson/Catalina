/*
 * Simple PSRAM test program. Supported only on the Propeller 2. 
 *
 * NOTE: For a similar HyperRAM program, see ex_hyper.c
 *
 * Optionally add -D DISPLAY_REGISTRY to display the registry. 
 *
 * For example:
 *
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE 
 * or
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE -D DISPLAY_REGISTRY
 *
 * The program can also be compiled as an XMM program. For example:
 *
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE -C LARGE
 * or
 *   catalina -p2 -lpsram -lci ex_psram.c -C P2_EDGE -C SMALL
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#ifndef __CATALINA_libpsram
#error THIS PROGRAM MUST BE COMPILED WITH THE PSRAM LIBRARY (-lpsram)
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
      if ((result = psram_write(str, TEST_ADDR, strlen(str) + 1)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = psram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0x44434241;

      printf("Press a key to write a BYTE value to PSRAM\n");
      k_wait();
      if ((result = psram_writeByte(&data, BYTE_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = psram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a BYTE value from PSRAM\n");
      k_wait();
      if ((result = psram_readByte(&data, BYTE_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }

      data = 0x44434241;

      printf("Press a key to write a WORD value to PSRAM\n");
      k_wait();
      if ((result = psram_writeWord(&data, WORD_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = psram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a WORD value from PSRAM\n");
      k_wait();
      if ((result = psram_readWord(&data, WORD_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }

      data = 0x44434241;

      printf("Press a key to write a LONG value to PSRAM\n");
      k_wait();
      if ((result = psram_writeLong(&data, LONG_ADDR)) < 0) {
         printf("write error: %d\n", result);
      }
      else {
         printf("write ok\n");
      }

      zero_buffer(buff);

      printf("Press a key to read a string from PSRAM\n");
      k_wait();
      if ((result = psram_read(buff, TEST_ADDR, MAX_CHARS)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("%s\n", buff);
      }

      data = 0;

      printf("Press a key to read a LONG value from PSRAM\n");
      k_wait();
      if ((result = psram_readLong(&data, LONG_ADDR)) < 0) {
         printf("read error: %d\n", result);
      }
      else {
         printf("read: %08X\n", result);
      }
   }
}
