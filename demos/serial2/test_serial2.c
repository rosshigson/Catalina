#include <prop2.h>
#include <serial2.h>
#include <plugin.h>

#ifdef __CATALINA_libthreads
#include <threads.h>
#endif

/*
 * Simple test program for the 2 Port serial plugin. This program only tests 
 * one port at a time (as defined by PORT, below).
 *
 * NOTE:
 *
 * By default, the 2 port serial plugin enables port 0 on propeller pins 
 * 63 & 62 and port 1 on pins 52 & 50. This means you cannot use the TTY HMI 
 * option or the debugger (which by default use these same pins). If TTY is 
 * the default HMI option for your Propeller platform, you must disable it 
 * when compiling this program by defining the target symbol NO_HMI.
 * For example:
 *
 *   catalina test_serial2.c -p2 -lci -lserial2 -C NO_HMI
 *
 * However, if your platform also has a VGA display connected, you 
 * can use multithreading to also use the stdio functions on that HMI. 
 * For example, to use the VGA HMI option in addition to the 2 port serial 
 * plugin, compile this program with a command such as:
 *
 *   catalina test_serial2.c -p2 -lci -lserial2 -lthreads -C LORES_VGA
 */

#define PORT 0

void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;
   
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      s2_str(PORT, "Cog ");
      s2_dec(PORT, i);
      s2_str(PORT, " (");
      s2_hex(PORT,(unsigned)rqst, 8);
      s2_str(PORT, ") ");
      s2_strln(PORT, _plugin_name(type)); 
   }
   s2_txflush(PORT);
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
         printf("tx buffer space is currently %d bytes\n", s2_txcheck(PORT));
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

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // start a thread to interact with the normal HMI
   _thread_start(&function, &stack[STACK_SIZE], 0, NULL);

#endif

   // in the main function, we will use the 2 port serial functions to 
   // interact with one of the serial ports ...

   s2_strln(PORT, "Hello, World (from the 2 Port Serial plugin)!");
   s2_txflush(PORT);
   print_plugin_names();
   s2_strln(PORT, "Press a key to begin...\n");
   s2_rx(PORT);

   while (1) {
      // print a test string once per second, unless a character is received
      s2_str(PORT, str);
      s2_txflush(PORT);
      ch = s2_rxtime(PORT, 1000);
      if (ch != -1) {
         // print out the received character in various formats
         s2_newline(PORT);
         s2_padchar(PORT, 79, '_');
         s2_newline(PORT);
         s2_str(PORT, "Received:");
         if (isprint(ch)) {
            s2_str(PORT, " \'");
            s2_tx(PORT, ch);
            s2_str(PORT, "\',");
         }
         s2_str(PORT, " ");
         s2_dec(PORT, ch);
         s2_str(PORT, ", ");
         s2_ihex(PORT, ch, 2);
         s2_str(PORT, ", ");
         s2_ibin(PORT, ch, 8);
         s2_newline(PORT);
         s2_padchar(PORT, 79, '_');
         s2_newline(PORT);
         s2_rxflush(PORT);
      }
   }
}
