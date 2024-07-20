#include <prop2.h>
#include <serial8.h>
#include <plugin.h>

/*
 * Simple test program for the 8 Port serial plugin. This program tests 
 * two ports at a time (port 0 and port 1). These ports are manually opened
 * by the program, so it does not matter if they are auto-initialized. By
 * default, the ports tested are:
 *
 * port 0 on pins 62 (tx) & 63 (rx)
 * port 1 on pins 20 (tx) & 18 (rx)
 *
 * NOTE:
 *
 * This means you cannot use the TTY HMI option or the debugger (which by 
 * default use these same pins). If TTY is the default HMI option for your 
 * Propeller platform, you must disable it when compiling this program by 
 * choosing another option, or by defining the target symbol NO_HMI - for 
 * example:
 *
 *   catalina test_serial8_2.c -p2 -lci -lserial8 -C NO_HMI
 *
 */

#define BUFF_SIZE 128

void test_port (int PORT, int rx, int tx) {
   int ch = 0;
   int i;
   char txbuff[BUFF_SIZE];
   char rxbuff[BUFF_SIZE];


   s8_openport(PORT, 230400, 0, 
       rx, rxbuff, rxbuff+BUFF_SIZE, 
       tx, txbuff, txbuff+BUFF_SIZE);
   s8_str(PORT, "Hello, World (from the 8 Port Serial plugin)!\n");
   for (i = 0; i < 3; i++) {
      // fetch 3 characters
      s8_strln(PORT, "\nPress a key ...\n");
      ch = s8_rx(PORT);
      s8_str(PORT, "Received:");
      if (isprint(ch)) {
         s8_str(PORT, " \'");
         s8_tx(PORT, ch);
         s8_str(PORT, "\',");
      }
      s8_str(PORT, " ");
      s8_dec(PORT, ch);
      s8_str(PORT, ", ");
      s8_ihex(PORT, ch, 2);
      s8_str(PORT, ", ");
      s8_ibin(PORT, ch, 8);
      s8_newline(PORT);
      s8_padchar(PORT, 79, '_');
      s8_newline(PORT);
      s8_rxflush(PORT);
   }
   s8_str(PORT, "\nGoodbye!\n\n");
   s8_txflush(PORT);
   s8_closeport(PORT);
}

void main() {

   int port = 0;

   s8_closeport(0);
   s8_closeport(1);

   while (1) {
      if (port == 0) {
         test_port(port, 63, 62);
         port = 1;
      }
      else {
         test_port(port, 18, 20);
         port = 0;
      }
   }
}
