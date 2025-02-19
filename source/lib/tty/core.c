#include <tty.h>
#include <plugin.h>
#include <cog.h>

static long *rxbase = 0;  // initialized on first use
static long lock    = -1; // initialized on first use

#define TTY_NOECHO 0x8

/*
 * Macros to help make the conversion of Spin to C purely mechanical.
 * (The offsets have been manually pre-calculated):
 */
#define long_rx_head          (rxbase+0)
#define long_rx_tail          (rxbase+1)
#define long_tx_head          (rxbase+2)
#define long_tx_tail          (rxbase+3)
#define long_rx_pin           (rxbase+4)
#define long_tx_pin           (rxbase+5)
#define long_rxtx_mode        (rxbase+6)
#define long_bit_ticks        (rxbase+7)
#define long_buffer_ptr       (rxbase+8)
#define byte_rx_buffer(offs)  (((char *)(rxbase+9))+offs)
#define byte_tx_buffer(offs)  (((char *)(rxbase+9))+16+offs)

/*
 *  Macros to acquire and release locks:
 */ 
#ifndef ACQUIRE
#define ACQUIRE(lock) if (lock >= 0) { while (!_lockset(lock)) {} }
#endif
#ifndef RELEASE
#define RELEASE(lock) if (lock >= 0) { _lockclr(lock); }
#endif

static void initialize() {
   int cog;
   unsigned int request;
  
   if (rxbase == 0) {
      // find TTY plugin (if loaded)
      cog = _locate_plugin(LMM_TTY);
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

int s_rxflush() {
   if (rxbase == 0) {
      initialize();
   }

   // repeat while rxcheck => 0 
   while (s_rxcheck() >= 0) {}
   return 0;    
}

int s_rxcheck() {
   int rxbyte;

   if (rxbase == 0) {
      initialize();
   }
   // rxbyte--
   // if rx_tail <> rx_head
   //   rxbyte := rx_buffer[rx_tail]
   //   rx_tail := (rx_tail + 1) & $F

   ACQUIRE (lock);
   if (*long_rx_tail != *long_rx_head) {
      rxbyte = *byte_rx_buffer(*long_rx_tail);
      *long_rx_tail = (*long_rx_tail + 1) & 0xF;
   }
   else {
      rxbyte = -1;
   }
   RELEASE (lock);
   return rxbyte;
}

int s_rx() {
   int rxbyte;

   if (rxbase == 0) {
      initialize();
   }
   //  repeat while (rxbyte := rxcheck) < 0

   while ((rxbyte = s_rxcheck()) < 0) { }
   return rxbyte;
}

int s_tx(char txbyte) {
   if (rxbase == 0) {
      initialize();
   }
   // repeat until (tx_tail <> (tx_head + 1) & $F)
   // tx_buffer[tx_head]] := txbyte
   // tx_head := (tx_head + 1) & $F

   // if long[@rxtx_mode] & NOECHO
   //   rx()
     
   ACQUIRE (lock);
   while (*long_tx_tail == ((*long_tx_head + 1) & 0xF)) { }
   
   *(byte_tx_buffer(*long_tx_head)) = txbyte;
   *long_tx_head = (*long_tx_head + 1) & 0xF;

   if (*long_rxtx_mode & TTY_NOECHO) {
      s_rx();
   }
   RELEASE (lock);

   return 0;  
}

int s_txflush() {
   if (rxbase == 0) {
      initialize();
   }
   //  repeat until (tx_tail == tx_head)

   ACQUIRE (lock);
   while (*long_tx_tail != *long_tx_head) { }
   RELEASE (lock);
   return 0;
}

int s_txcheck() {
   int txbytes;

   if (rxbase == 0) {
      initialize();
   }

   ACQUIRE (lock);
   txbytes = (*long_tx_head + 0x10 - *long_tx_tail) & 0xF;
   RELEASE (lock);
   return 0xF - txbytes;
}


