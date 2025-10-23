#include <ctype.h>
#include <tty.h>
#include <plugin.h>
#include <hmi.h>

/*
 * Simple test program for the Full Duplex serial plugin.
 *
 * NOTE:
 *
 * By default, the Full Duplex Serial plugin enables the serial port on 
 * propeller pins 30 & 31. This means you cannot also use the PC HMI option 
 * (which uses the same pins). If PC is the default HMI option for your 
 * Propeller platform, you must disable it when compiling this program by 
 * choosing another option, or by defining the target symbol NO_HMI - for 
 * example:
 *
 *   catalina test_serial4.c -lci -ltty -C NO_HMI
 *
 * However, if your platform also has a TV or VGA display connected, you 
 * can use multithreading to also use the stdio functions on that HMI. 
 * For example, to use the TV HMI option in addition to the Full Duplex 
 * Serial plugin, compile this program with a command such as:
 *
 *   catalina test_serial4.c -lci -ltty -lthreads -C TV
 */

void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;

   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      tty_str("Cog ");
      tty_dec(i);
      tty_str(" (");
      tty_hex((unsigned)rqst, 4);
      tty_str(") ");
      tty_strln(_plugin_name(type)); 
   }
   tty_txflush();
}

#ifdef __CATALINA_libthreads

// if threading is enabled, define a function that will 
// simply echo characters read from stdin to stdout ...

#include <threads.h>

// 30 is normally enough, but 100 is required if libtiny is used ...
#define STACK_SIZE MIN_THREAD_STACK_SIZE + 100 

int function(int id, char *not_used[]) {
   printf("Hello, world (from stdio)!\n");
   while (1) {
      if (k_ready()) {
         // getchar blocks, so don't call it unless 
         // we know there is a character available
         printf("%c", getchar());
      }
      _thread_yield();
   }
   return 0;
}
#endif

void main() {

   int ch;

   char str[] = 
      "Now is the time for all good men to come to the aid of the party. "
      "Twinkle, twinkle little star. How I wonder what you are. "
      "The quick brown fox jumps over the lazy dog. ";

#ifdef __CATALINA_libthreads

   // if threading is enabled, define a stack for the thread function,
   // and then start the thread ...

   long stack[STACK_SIZE];
   // start a thread to interact with the normal HMI
   _thread_start(&function, &stack[STACK_SIZE], 0, NULL);

#endif

   // in the main function, we will use the 4 port serial functions to 
   // interact with one of the serial ports ...

   tty_strln("Hello, World (from the modified Full Duplex Serial plugin)!");
   tty_txflush();
   print_plugin_names();
   tty_strln("Press a key to begin...\n");
   tty_rx();

   while (1) {
      // print a test string once per second, unless a character is received
      tty_str(str);
      tty_txflush();
      ch = tty_rxtime(1000);
      if (ch != -1) {
         // print out the received character in various formats
         tty_newline();
         tty_padchar(79, '_');
         tty_newline();
         tty_str("Received:");
         if (isprint(ch)) {
            tty_str(" \'");
            tty_tx(ch);
            tty_str("\',");
         }
         tty_str(" ");
         tty_dec(ch);
         tty_str(", ");
         tty_ihex(ch, 2);
         tty_str(", ");
         tty_ibin(ch, 8);
         tty_newline();
         tty_padchar(79, '_');
         tty_newline();
         tty_rxflush();
      }
   }
}
