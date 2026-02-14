#include "aloha.h"

#define CHAR_PAUSE 16 // delay CHAR_DELAY ms after sending this many characters
#define CHAR_DELAY  5 // ms to delay each CHAR_PAUSE characters 

#if DEBUG_ALOHA

// use serial functions that print their data ...
static int tx(int port, int byte) {
   t_printf("[%x]\n", byte);
   return s_tx(port, byte);
}

static int rx(int port) {
   int byte;
   byte = s_rx(port);
   if (byte >= 0) {
      t_printf("[%x]\n", byte);
   }
   else {
      t_printf("[-]\n", byte);
   }
   return byte;
}

static int rxtime(int port, int ms) {
   int byte;
   byte = s_rxtime(port, ms);
   if (byte >= 0) {
      t_printf("[%x]\n", byte);
   }
   else {
      t_printf("[-]\n", byte);
   }
   return byte;
}

#else

// use the actual serial functions ...
#define tx s_tx
#define rx s_rx
#define rxtime s_rxtime

#endif

/*
 * send byte, sending 0xFF 0x00 if asked to send 0xFF
 */
void tx_stuff(int port, int byte) {
   tx(port, byte);
   if (byte == 0xFF) {
      // stuff it
      tx(port, 0x00);
   }
}

void aloha_tx(int port, int id, int sq, int len, char *buf) {
   register int sum = 0;
   register int byte;
   register int i;
   tx(port, 0xFF);
   tx(port, 0x02);
   tx_stuff(port, id); sum = id;
   tx_stuff(port, sq); sum = (sum + sq) & 0xFF;
   byte = (len&0xFF); tx_stuff(port, byte); sum = (sum + byte) & 0xFF;
   byte = ((len>>8)&0xFF); tx_stuff(port, byte); sum = (sum + byte) & 0xFF;
   for (i = 0; i < len; i++) {
      byte = buf[i];
      tx_stuff(port, byte);
      sum = (sum + byte) & 0xFF;
      if (i % CHAR_PAUSE == 0) {
         // delay CHAR_DELAY ms every CHAR_PAUSE characters 
         // (in case the tx or rx buffers are small!)
         _waitms(CHAR_DELAY); 
      }
   }
   tx_stuff(port, (0x100-sum) & 0xFF);
}

/*
 * receive byte, returning 0xFF when 0xFF 0x00 received, or -1 on error
 */
int rx_unstuff(int port, int ms) {
   static int saved_byte = -1;
   register int byte1, byte2;
   if (saved_byte >= 0) {
     // return the byte we saved
#if DEBUG_ALOHA
     t_printf("returning saved byte %d\n", saved_byte);
#endif
     byte1 = saved_byte;
     saved_byte = -1;
     return byte1;
   }
   byte1 = rxtime(port, ms);
   if (byte1 >= 0) {
      if (byte1 == 0xFF) {
         byte2 = rxtime(port, ms);
         if (byte2 >= 0){
            if (byte2 == 0x00) {
              // ignore stuffing
#if DEBUG_ALOHA
              t_printf("got stuffing\n");
#endif              
              return byte1;
            }
            else {
              // not stuffing - return byte1 now
              // and return byte2 on next call!
              saved_byte = byte2;
#if DEBUG_ALOHA
              t_printf("saved byte %d\n", saved_byte);
#endif
              return byte1;
            }
         }
         else {
            return -1;
         }
      }
      else {
         return byte1;
      }
   }
   return -1;
}


int aloha_rx(int port, int *id, int *sq, int *len, char *buf, int max, int ms) {
   register int byte;
   register int sum;
   register int i;
   register int len1, len2;
   while (1) {
      byte = 0;
      byte = rxtime(port, ms);
      if (byte >= 0) {
         if (byte == 0xFF) {
            byte = rxtime(port, ms);
            if (byte == 0x02) {
               // packet header
               break; 
            }
            else {
               // timeout or error packet
               return byte;
            }
         }
      }
      else {
         // timeout
#if DEBUG_ALOHA
         t_printf("time!\n");
#endif
         return -1;
      }
   }
   // seen packet header
#if DEBUG_ALOHA
   t_printf("header!\n");
#endif
   *id = rx_unstuff(port, ms);
   if (*id >= 0) {
      *sq = rx_unstuff(port, ms);
      sum = (*id + *sq) & 0xFF;
      len1 = rx_unstuff(port, ms);
      if (len1 >= 0) {
         sum = (sum + len1) & 0xFF;
         len2 = rx_unstuff(port, ms);
         if (len2 >= 0) {
            sum = (sum + len2) & 0xFF;
            *len = (len2<<8) + len1;
            if (*len > max) {
               return -2;
            }
            for (i = 0; i < *len; i++) {
               byte = rx_unstuff(port, ms);
               if (byte < 0) {
                  break;
               }
               sum = (sum + byte) & 0xFF;
               buf[i] = byte;
            }
            if (i == *len) {
               byte = rx_unstuff(port, ms);
               if (byte < 0) {
                  return -1;
               }
               sum = (sum + byte) & 0xFF;
               if (sum == 0) {
                  return 0;
               }
               else {
#if DEBUG_ALOHA                 
                  t_printf("sum = %d\n", sum);
#endif
                  return -4;
               }
            }
         }
      }
   }
   else {
#if DEBUG_ALOHA                 
      t_printf("bad id=%d\n", *id);
#endif
   }
   return -1;
}

int aloha_rxcount(int port) {
   return s_rxcount(port);
}


