#include <serial4.h>
#include <plugin.h>
#include <cog.h>

static long *rxbase = 0;  // initialized on first use
static long lock    = -1; // initialized on first use

#define S4_NOECHO 0x8

/*
 * Macros to help make the conversion of Spin to C purely mechanical.
 * (The offsets have been manually pre-calculated):
 */
#define long_rx_head(port)         (rxbase+0+port)
#define long_rx_tail(port)         (rxbase+4+port)
#define long_tx_head(port)         (rxbase+8+port)
#define long_tx_tail(port)         (rxbase+12+port)
#define long_rxmask(port)          (rxbase+16+port)
#define long_txmask(port)          (rxbase+20+port)
#define long_ctsmask(port)         (rxbase+24+port)
#define long_rtsmask(port)         (rxbase+28+port)
#define long_rxtx_mode(port)       (rxbase+32+port)
#define long_bit4_ticks(port)      (rxbase+36+port)
#define long_bit_ticks(port)       (rxbase+40+port)
#define long_rtssize(port)         (rxbase+44+port)
#define byte_rxchar(port)          (((char *)(rxbase+48))+port)
#define long_rxbuff_ptr(port)      (rxbase+49+port)
#define long_txbuff_ptr(port)      (rxbase+53+port)
#define long_rxbuff_head_ptr(port) (rxbase+57+port)
#define long_txbuff_tail_ptr(port) (rxbase+61+port)
#define long_rx_head_ptr(port)     (rxbase+65+port)
#define long_rx_tail_ptr(port)     (rxbase+69+port)
#define long_tx_head_ptr(port)     (rxbase+73+port)
#define long_tx_tail_ptr(port)     (rxbase+77+port)
#define byte_rx_buffer(port,offs)  (((char *)(rxbase+81+port*16))+offs)
#define byte_tx_buffer(port,offs)  (((char *)(rxbase+145+port*4))+offs)

static void initialize() {
   int cog;
   unsigned int request;
  
   if (rxbase == 0) {
      // find S4 plugin (if loaded)
      cog = _locate_plugin(LMM_S4);
      if (cog >= 0) {
         // fetch our request block entry
         request = (*REQUEST_BLOCK(cog)).request;
         // lower 24 bits is our mailbox pointer
         rxbase = (long *)(request&0x00FFFFFF);
         // upper 8 bits is our lock (+1) if allocated
         lock = request>>24;
         if (lock == 0) {
            // no lock allocated yet - so allocate one (if possible)
            lock = _locknew();
            if (lock >= 0) {
               // store the allocated lock (+1) in our request block entry
               request = request | ((lock+1)<<24);
               (*REQUEST_BLOCK(cog)).request = request;
            }
         }
         else {
            // a lock has been allocated - so use it (-1)
            lock--;
         }
      }
   }
}

int s_rxflush(unsigned port) {
   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   // repeat while rxcheck(port) => 0 
   while (s_rxcheck(port) >= 0) {}
   return 0;    
}

int s_rxcheck(unsigned port) {
   int rxbyte;

   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   // rxbyte--
   // if long[@rx_tail][port] <> long[@rx_head][port]
   //   rxbyte := byte[@rxchar][port] ^ byte[@rx_buffer][(port<<6)+long[@rx_tail][port]]
   //   long[@rx_tail][port] := (long[@rx_tail][port] + 1) & $3F

   ACQUIRE (lock);
   if (*long_rx_tail(port) != *long_rx_head(port)) {
      rxbyte = *byte_rxchar(port) ^ *byte_rx_buffer(port,*long_rx_tail(port));
      *long_rx_tail(port) = (*long_rx_tail(port) + 1) & 0x3F;
   }
   else {
      rxbyte = -1;
   }
   RELEASE (lock);
   return rxbyte;
}

//
// s_rxcount :  returns number of bytes waiting in receive buffer
//
int s_rxcount(unsigned port) {
   int rxbytes;

   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   ACQUIRE (lock);
   rxbytes = (*long_rx_head(port) + 0x10 - *long_rx_tail(port)) & 0xF;
   RELEASE (lock);
   return rxbytes;
}

int s_rx(unsigned port) {
   int rxbyte;

   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   //  repeat while (rxbyte := rxcheck(port)) < 0

   while ((rxbyte = s_rxcheck(port)) < 0) { }
   return rxbyte;
}

int s_tx(unsigned port, char txbyte) {
   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   // repeat until (long[@tx_tail][port] <> (long[@tx_head][port] + 1) & $F)
   // byte[@tx_buffer][(port<<4)+long[@tx_head][port]] := txbyte
   // long[@tx_head][port] := (long[@tx_head][port] + 1) & $F

   // if long[@rxtx_mode][port] & NOECHO
   //   rx(port)
     
   ACQUIRE (lock);
   while (*long_tx_tail(port) == ((*long_tx_head(port) + 1) & 0xF)) { }
   
   *(byte_tx_buffer(port,*long_tx_head(port))) = txbyte;
   *long_tx_head(port) = (*long_tx_head(port) + 1) & 0xF;

   if (*long_rxtx_mode(port) & S4_NOECHO) {
      s_rx(port);
   }
   RELEASE (lock);

   return 0;  
}

int s_txflush(unsigned port) {
   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   //  repeat until (long[@tx_tail][port] == long[@tx_head][port])

   ACQUIRE (lock);
   while (*long_tx_tail(port) != *long_tx_head(port)) { }
   RELEASE (lock);
   return 0;
}

int s_txcheck(unsigned port) {
   int txbytes;

   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   ACQUIRE (lock);
   txbytes = (*long_tx_head(port) + 0x10 - *long_tx_tail(port)) & 0xF;
   RELEASE (lock);
   return 0xF - txbytes;
}

//
// s_txcount :  returns number of bytes waiting in send buffer
//
int s_txcount(unsigned port) {
   int txbytes, txsize;

   if (rxbase == 0) {
      initialize();
   }
   if (port > 3) {
      return -1;
   }

   ACQUIRE (lock);
   txbytes = (*long_tx_head(port) + 0x10 - *long_tx_tail(port)) & 0xF;
   RELEASE (lock);
   return txbytes;
}

