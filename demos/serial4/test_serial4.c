#include <ctype.h>
#include <prop.h>
#include <serial4.h>
#include <plugin.h>
#include <hmi.h>

#ifdef __CATALINA_libthreads
#include <threads.h>
#endif

/*
 * Simple test program for the 4 Port serial plugin. This program only tests 
 * one port at a time (as defined by PORT, below).
 *
 * NOTE:
 *
 * To edit the configuration of the port, or to add additional ports, edit
 * the file Extras.spin in the Catalina target directory.
 *
 * By default, the 4 port serial plugin only enables one port (port 0) on 
 * propeller pins 30 & 31. This means you cannot also use the PC HMI option 
 * (which uses the same pins). If PC is the default HMI option for your 
 * Propeller platform, you must disable it when compiling this program by 
 * choosing another option, or by defining the target symbol NO_HMI - for 
 * example:
 *
 *   catalina test_serial4.c -lci -lserial4 -C NO_HMI
 *
 * However, if your platform also has a TV or VGA display connected, you 
 * can use multithreading to also use the stdio functions on that HMI. 
 * For example, to use the TV HMI option in addition to the 4 port serial 
 * plugin, compile this program with a command such as:
 *
 *   catalina test_serial4.c -lci -lserial4 -lthreads -C TV
 */

#define PORT 0

void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;
   
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      s4_str(PORT, "Cog ");
      s4_dec(PORT, i);
      s4_str(PORT, " (");
      s4_hex(PORT,(unsigned)rqst, 8);
      s4_str(PORT, ") ");
      s4_strln(PORT, _plugin_name(type)); 
   }
   s4_txflush(PORT);
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
         printf("tx buffer space is currently %d bytes\n", s4_txcheck(PORT));
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

   // in the main function, we will use the 4 port serial functions to 
   // interact with one of the serial ports ...

   s4_strln(PORT, "Hello, World (from the 4 Port Serial plugin)!");
   s4_txflush(PORT);
   print_plugin_names();
   s4_strln(PORT, "Press a key to begin...\n");
   s4_rx(PORT);

   while (1) {
      // print a test string once per second, unless a character is received
      s4_str(PORT, str);
      s4_txflush(PORT);
      ch = s4_rxtime(PORT, 1000);
      if (ch != -1) {
         // print out the received character in various formats
         s4_newline(PORT);
         s4_padchar(PORT, 79, '_');
         s4_newline(PORT);
         s4_str(PORT, "Received:");
         if (isprint(ch)) {
            s4_str(PORT, " \'");
            s4_tx(PORT, ch);
            s4_str(PORT, "\',");
         }
         s4_str(PORT, " ");
         s4_dec(PORT, ch);
         s4_str(PORT, ", ");
         s4_ihex(PORT, ch, 2);
         s4_str(PORT, ", ");
         s4_ibin(PORT, ch, 8);
         s4_newline(PORT);
         s4_padchar(PORT, 79, '_');
         s4_newline(PORT);
         s4_rxflush(PORT);
      }
   }
}
