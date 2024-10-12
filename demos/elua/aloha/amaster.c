#pragma catapult primary binary(amaster.bin) options(-p2 -C P2_MASTER -C SIMPLE -C VT100 -C CR_ON_LF -lci -lserial2 aloha.c)

/*
 * Simple master program to test the ALOHA client/server protocol. Run it
 * in conjunction with the slave program running on another propeller.
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
 *    catapult amaster.c
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
         if (isprint(data[i])) {
            printf("%c", data[i]);
         }
         else {
            printf("[%02X]", data[i]);
         }
      }
      printf(" ");
   }
   return res;
}

void main() {
   int id;
   int res;
   int sq = 1;
   int rsq = 0;
   char data[MAX];
   int flipflop = 0;
   char *str = "aloha!";
   char bin[] = {0xFF,0x02,0xFF,0xFE,0x00,0x01,0x02,0x03};


   _waitsec(1);
   printf("Master: Press any key to START\n");
   k_wait();
   while (1) {
      printf("Press any key to PAUSE\n");
      while(!k_ready()) {
         // use flipflop to alternate between requests
         if (flipflop == 0) {
            send(1, sq, strlen(str), str);
            flipflop = 1;
         }
         else {
            send(2, sq, sizeof(bin), bin);
            flipflop = 0;
         }
         res = receive(MAX, data, &id, &rsq);
         while (!k_ready() && (res == 0) && (rsq != sq)) {
            // if we got a response but the sequence number is
            // wrong - we have probably received an old buffered 
            // response, so keep receiving until we get a real
            // error
            res = receive(MAX, data, &id, &rsq);
         }
         if ((res != 0) || (sq != rsq)) {
            // this is either a real error, or a user interrupt
            k_clear();
            printf("\nERROR: Press any key to RETRY\n");
            k_wait();
         }
         _waitsec(1);
         sq = (sq + 1) & 0xFF;
      }
      k_clear();
      printf("\nPress any key To RESUME\n");
      k_wait();
   }
}
