#pragma catapult primary binary(aslave.bin) options(-p2 -C P2_SLAVE -C SIMPLE -C VT100 -C CR_ON_LF -lci -lserial2 aloha.c)

/*
 * Simple slave program to test the ALOHA client/server protocol. Run it
 * in conjunction with the master program running on another propeller.
 *
 * See the README.TXT for how to set up two propellers connected via a
 * serial port.
 *
 * You should be able to pause and restart the master or slave at will, 
 * or even shut down and restart either program. However, if the master
 * sends a packet when the slave is not processing and the slave is then
 * resumed or restarted, it is possible that both master and slave will  
 * end up waiting for a packet and sit there idle (in a real application 
 * the master would probably include code to time out and try again). 
 * In that case, pause and then resume the master (pausing and resuming 
 * the slave will not break the deadlock).
 *
 * Compile this program using Catapult - i.e:
 *
 *    catapult aslave.c
 *
 *  To use the 8 Port serial plugin, replace -lserial2 by -lserial8
 *  in the catapult primary pragma.
 *
 */

#include <stdio.h>
#include <ctype.h>

#include "aloha.h"

#ifndef PORT
#define PORT    0
#endif

#define MAX     100
#define RXTIME  1000

void send(int id, int sq, int len, char *data) {
   aloha_tx(PORT, id, sq, len, data);
}

int receive(int max, char *data, int *id, int *sq) {
   int len;
   int res;
   int i;

   res = aloha_rx(PORT, id, sq, &len, data, max, RXTIME);
   if (!k_ready() && (res == 0)) {
      for (i = 0; i < len; i++) { 
         //if (isprint(data[i])) {
         //   printf("%c", data[i]);
         //}
         //else {
            printf("[%02X]", data[i]);
         //}
      }
      printf(" ");
   }
   return res;
}

void main() {
   int id;
   int res;
   int sq;
   char data[MAX];
   char *str1 = "who are you?";
   char *str2 = "what do you want?";

   _waitsec(1);
   printf("Slave: Press any key to START\n");
   k_wait();
   rxflush(PORT);
   while (1) {
      printf("Press any key to PAUSE\n");
      while(!k_ready()) {
         res = receive(MAX, data, &id, &sq);
         if (res == 0) {
            if (id == 1) {
               send(1, sq, strlen(str1), str1);
            }
            else {
               send(2, sq, strlen(str2), str2);
            }
         }
      }
      k_clear();
      printf("\nPress any key To RESUME\n");
      k_wait();
   }
}
