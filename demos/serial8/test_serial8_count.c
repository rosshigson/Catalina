#include <ctype.h>
#include <string.h>
#include <prop2.h>
#include <serial8.h>
#include <plugin.h>

#ifdef __CATALINA_libthreads
#include <threads.h>
#endif

/*
 * Simple test program for the 8 Port serial plugin count functions. 
 * This program only tests one port at a time (as defined by PORT, below).
 *
 * NOTE:
 *
 * By default, the 8 port serial plugin enables port 0 on propeller pins 
 * 63 & 62 and port 1 on pins 52 & 50. This means you cannot use the TTY HMI 
 * option or the debugger (which by default use these same pins). If TTY is 
 * the default HMI option for your Propeller platform, you must disable it 
 * when compiling this program by defining the target symbol NO_HMI.
 * For example:
 *
 *   catalina test_count.c -p2 -lci -lserial8 -C NO_HMI
 *
 * However, if your platform also has a VGA display connected, you 
 * can use multithreading to also use the stdio functions on that HMI. 
 * For example, to use the VGA HMI option in addition to the 8 port serial 
 * plugin, compile this program with a command such as:
 *
 *   catalina test_count.c -p2 -lci -lserial8 -lthreads -C LORES_VGA
 */

#define PORT 0

#define BUFF_SIZE 512

void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;
   
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      s8_str(PORT, "Cog ");
      s8_dec(PORT, i);
      s8_str(PORT, " (");
      s8_hex(PORT,(unsigned)rqst, 8);
      s8_str(PORT, ") ");
      s8_strln(PORT, _plugin_name(type)); 
   }
   s8_txflush(PORT);
}

#ifdef __CATALINA_libthreads

// if threading is enabled, define a function that will 
// simply echo characters read from stdin to stdout ...

#include <threads.h>

// 30 is normally enough, but 100 is required if libtiny is used ...
#define STACK_SIZE MIN_THREAD_STACK_SIZE + 100 

int function(int id, char *not_used[]) {
   int tx_count;

   printf("Hello, world (from stdio)!\n");

   while (1) {
      if (k_ready()) {
         // getchar blocks, so don't call it unless 
         // we know there is a character available
         printf("%c\n", getchar());
         printf("tx buffer space is currently %d bytes\n", s8_txcheck(PORT));
      }
      _thread_yield();
   }
   return 0;
}
#endif

void main() {

   int ch;
   int count;
   char rx_buffer[BUFF_SIZE];
   char tx_buffer[BUFF_SIZE];

   char str[] = 
      "Now is the time for all good men to come to the aid of the party. "
      "Twinkle, twinkle little star. How I wonder what you are. "
      "The quick brown fox jumps over the lazy dog. ";

#ifdef __CATALINA_libthreads

   // if threading is enabled, define a stack for the thread function,
   // and then start the thread ...

   long stack[STACK_SIZE];

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // start a thread to interact with the normal HMI
   _thread_start(&function, &stack[STACK_SIZE], 0, NULL);

#endif

   // in the main function, we will use the 8 port serial functions to 
   // interact with one of the serial ports ...

   // first, close the port and re-open it with a larger rx and tx buffer
   s8_closeport(PORT);
   s8_openport(PORT, 230400, 0, 
               63, &rx_buffer[0], &rx_buffer[BUFF_SIZE],
               62, &tx_buffer[0], &tx_buffer[BUFF_SIZE]
              );

   s8_strln(PORT, "Hello, World (from the 8 Port Serial plugin)!");
   s8_txflush(PORT);
   print_plugin_names();
   s8_strln(PORT, "Press a key to begin...\n");
   s8_rx(PORT);

   while (1) {
      // print a test string then wait until 10 characters are received,
      // then print them
      while ((count = s8_txcheck(PORT)) > strlen(str)) {
        s8_str(PORT, str);
      }
      _waitms(5); // allow some chars to be sent - change to see effect
      count = s8_txcount(PORT);
      s8_str(PORT,"\n\ntx count = ");
      s8_dec(PORT, count);
      s8_strln(PORT, "");

      count = s8_rxcount(PORT);
      s8_str(PORT,"\nrx count = ");
      s8_dec(PORT, count);
      s8_strln(PORT, "");

      ch = s8_rxtime(PORT, 1000);
      if (ch != -1) {
         // print out the received character in various formats
         s8_newline(PORT);
         s8_padchar(PORT, 79, '_');
         s8_newline(PORT);
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
         _waitsec(1);
      }
   }
}
