/*
 * test signal raising
 */

#include <stdlib.h>
#include <signal.h>
#include <hmi.h>

void my_signal_handler (int sig) {
   t_string (1, "signal = ");
   t_integer (1, sig);
   t_string (1, "\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
}


int main(void) {
   t_string (1, "Test signals\n\n");
   t_string (1, "Test passed if you see 'signal = 1' followed by 'signal = 6'\n\n");

   if (signal (1, &my_signal_handler) == SIG_ERR) {
      t_string (1, "Error setting signal handler\n");
   }
   if (signal (6, &my_signal_handler) == SIG_ERR) {
      t_string (1, "Error setting signal handler\n");
   }
   raise(1);

   abort();

   t_string (1, "\nTest failed if this appears\n");

   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;   
}
