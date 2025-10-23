/*
 * Simple test program intended to test the SIMPLE serial plugin for the P2. 
 *
 * Compile it using the command-line option -C SIMPLE
 *
 * For example:
 *
 *   catalina test_simple.c -p2 -lci -C SIMPLE
 *
 */

#include <stdio.h>
#include <ctype.h>
#include <prop2.h>
#include <hmi.h>
#include <plugin.h>

void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;
   
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      printf("Cog %d (%X) %s\n", i, (unsigned)rqst,  _plugin_name(type));
   }
}

void print_chars(int count, char ch) {
   int i;
   for (i = 0; i < count; i++) {
      printf("%c", ch);
   }
   printf("\n");
}

void main() {

   int i;
   int ch;

   char str[] = 
      "Now is the time for all good men to come to the aid of the party. "
      "Twinkle, twinkle little star. How I wonder what you are. "
      "The quick brown fox jumps over the lazy dog. ";

   // in the main function, we will use simple serial port to 
   // interact with one of the serial ports ...

   printf("Hello, World (from the SIMPLE Serial plugin)!\n\n");
   print_plugin_names();
   printf("\nPress a key to begin...\n");
   k_wait();

   while (1) {
      // print a test string once per second, and also print 
      // any characters received
      printf(str);
      fflush(stdout);
      _waitsec(1);
      if (k_ready()) {
         ch = k_get();
         if (ch != -1) {
            // print out the received character in various formats
            printf("\n");
            print_chars(79, '-');
            printf("Received:");
            if (isprint(ch)) {
               printf(" \'%c\',", ch);
            }
            printf(" %03d, 0x%02x\n", ch, ch);
            print_chars(79, '-');
         }
      }
   }
}
