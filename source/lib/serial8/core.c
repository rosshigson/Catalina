#include <serial8.h>
#include <plugin.h>
#include <cog.h>
#include <smartpin.h>

static char *s8base = 0;  // initialized on first use
static long lock    = -1; // initialized on first use

#define S8_BUFF_SIZE 32   // auto-initialized tx and rx size buffer in bytes 
                          // NOTE: must match S8_BUFF_SIZE in serial8.t

#define msleep(millisecs) _waitcnt((millisecs)*(_clockfreq()/1000) + _cnt())

//#define S8_NOECHO 0x8   // echo is TBD

/*
 * Macros to help access configuration data in SX control block (p = logical pin):
 */
#define long_pin(p)            (*(uint32_t *)(s8base+4+16+(16*(p))))
#define long_mode(p)           (*(uint32_t *)(s8base+4+20+(16*(p))))
#define long_baud(p)           (*(uint32_t *)(s8base+4+24+(16*(p))))

/*
 * Macros to help access initialized SX control block (p = logical pin):
 */
#define byte_p_ctl(p)          (s8base+4+(p))
#define long_p_head(p)         ((uint32_t *)(s8base+4+16+(16*(p))))
#define long_p_tail(p)         ((uint32_t *)(s8base+4+20+(16*(p))))
#define long_p_start(p)        ((uint32_t *)(s8base+4+24+(16*(p))))
#define long_p_end(p)          ((uint32_t *)(s8base+4+28+(16*(p))))

/*
 * Macros to help access tx and rx buffers (using port, not logical pin):
 */
#define long_rx_head(port)     ((int32_t *)(s8base+4+16+(32*(port))))
#define long_rx_tail(port)     ((int32_t *)(s8base+4+20+(32*(port))))
#define long_rx_start(port)    ((int32_t *)(s8base+4+24+(32*(port))))
#define long_rx_end(port)      ((int32_t *)(s8base+4+28+(32*(port))))
#define long_tx_head(port)     ((int32_t *)(s8base+4+32+(32*(port))))
#define long_tx_tail(port)     ((int32_t *)(s8base+4+36+(32*(port))))
#define long_tx_start(port)    ((int32_t *)(s8base+4+40+(32*(port))))
#define long_tx_end(port)      ((int32_t *)(s8base+4+44+(32*(port))))

/*
 * pinconfig - configure smartpin for rx (dirn = 0) or tx (dirn = 1)
 */
static void pinconfig(int pin, uint32_t baud, uint32_t mode, int dirn) {
   uint32_t spmode, baudcfg;
   //uint32_t txdelay;

   if (dirn == 0) {
      // rx pin
      spmode = P_ASYNC_RX;
      if ((mode & 1) != 0) {
        spmode |= P_INVERT_IN;
      }
   }
   else {
      // tx pin
      //txdelay = _clockfreq() / baud * 11; // tix to transmit one byte
      spmode = P_ASYNC_TX | P_OE;      
      switch ((mode >> 1) & 0x3) {
        case 0:
           break;
        case 1 :
           spmode |= P_INVERT_OUTPUT;
           break;
        case 2 : 
           spmode |= P_HIGH_FLOAT; // requires external pull-up ???
           break;
        case 3 :
           spmode |= P_INVERT_OUTPUT | P_LOW_FLOAT; // requires external pull-down ???
           break;
      }
   }
   baudcfg = _muldiv64(_clockfreq(), 0x10000, baud) & 0xFFFFFC00; // set bit timing
   baudcfg |= (8-1); // set bits (8)
   // start smartpin
   _pinstart(pin, spmode, baudcfg, 0); 

}

/*
 * p_config - configure buffer addresses and control byte for logical pin p in the SX control block
 */
static void p_config(int p, int ctrl, uint32_t head, uint32_t tail, uint32_t start, uint32_t end) {
   *byte_p_ctl(p)     = 0;
   *long_p_head(p)    = head;
   *long_p_tail(p)    = tail;
   *long_p_start(p)   = start;
   *long_p_end(p)     = end;
   *byte_p_ctl(p)     = ctrl;
}

/*
 * set up "autoinitialized" ports according to the initialization data in the
 * SX control block - set pins & default buffer addresses in SX control block 
 * in place of the initialization data. Note that only up to S8_MAX_PORTS 
 * ports can be used, and only ports with pins in the range 0 .. 63 will have
 * their pins configured by this autoinitialize function. Other ports will 
 * have to be manually opened using s_openport() function.
 */
static void autoinitialize() {
   int port;
   int p;
   int pin;
   uint32_t baud;
   uint32_t mode;
   uint32_t rxbuff;
   uint32_t txbuff;

   if (s8base != 0) {
      rxbuff = *((uint32_t *)s8base);
      txbuff = rxbuff + S8_BUFF_SIZE;
      for (port = 0; port < S8_MAX_PORTS; port++) {
         // configure 2 logical pins (rx & tx) for each port
         p = 2*port; // logical rx pin
         // get preconfigured values
         pin = long_pin(p);
         if ((pin >= 0) && (pin <= 63)) {
            mode = long_mode(p);
            baud = long_baud(p);
            // configure smart pin, and overwrite SX control block with buffer addresses
            pinconfig(pin, baud, mode, 0);
            // set up control byte for rx and enable 
            p_config(p, (1<<7) | (0<<6) | pin, rxbuff, rxbuff, rxbuff, rxbuff + S8_BUFF_SIZE);
         }
         p++; // logical tx pin
         pin = long_pin(p);
         if ((pin >= 0) && (pin <= 63)) {
            mode = long_mode(p);
            baud = long_baud(p);
            // configure smart pin, and overwrite SX control block with buffer addresses
            pinconfig(pin, baud, mode, 1);
            // set up control byte for tx and enable
            p_config(p, (1<<7) | (1<<6) | pin, txbuff, txbuff, txbuff, txbuff + S8_BUFF_SIZE);
         }
         // update buffer pointers for next logical pin
         rxbuff += 2 * S8_BUFF_SIZE;
         txbuff += 2 * S8_BUFF_SIZE;
      }
   }
}

static void initialize() {
   int cog;
   unsigned int request;
  
   if (s8base == 0) {
      // find S8 plugin (if loaded)
      cog = _locate_plugin(LMM_S8A);
      if (cog >= 0) {
         // fetch our request block entry
         request = (*REQUEST_BLOCK(cog)).request;
         // lower 24 bits is our data pointer
         s8base = (char *)(request&0x00FFFFFF);
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
         // autoinitialize ports and set up SX control block with
         // pins and default buffer addresses
         autoinitialize();
      }
   }
}

/*
 * s_closeport - disable a port (both rx and tx pins)
 */
void s_closeport(unsigned port) {
   int p, pin;

   if (s8base == 0) {
      initialize();
   }
   if (port < S8_MAX_PORTS) {
      // disable rx
      p = port*2; // rx logial pin
      pin = *byte_p_ctl(p);
      if ((pin & (1<<7)) != 0) {
         pin &= 0x3f;
         //s_rxflush(port);
         _pinclear(pin);
         *byte_p_ctl(p) = 0;
      }
      // disable tx 
      p++; // tx logical pin
      pin = *byte_p_ctl(p);
      if ((pin & (1<<7)) != 0) {
         pin &= 0x3f;
         //s_txflush(port);
         _pinclear(pin);
         *byte_p_ctl(p) = 0;
      }
   }
}

/*
 * s_openport - set up the smartpins and buffers and enable a port 
 * (configure both rx and tx pins). Note that the port number must
 * be less than S8_MAX_PORTS or it cannot be opened.
 */
void s_openport(unsigned port, unsigned baud, unsigned mode, 
                 unsigned rx_pin, char *rx_start, char *rx_end,
                 unsigned tx_pin, char *tx_start, char *tx_end) {
   int p;

   if (s8base == 0) {
      initialize();
   }
   if (port < S8_MAX_PORTS) {
      // ensure port is closed
      s_closeport(port);

      // configure rx
      p = port*2; // rx logical pin
      if (rx_pin <= 63) {
         pinconfig(rx_pin, (uint32_t)baud, (uint32_t)mode, 0);
         // set up control byte for rx and enable
         p_config(p, (1<<7) | (0<<6) | rx_pin,
                  (uint32_t)rx_start, (uint32_t)rx_start, (uint32_t)rx_start, (uint32_t)rx_end);
      }

      // configure tx
      p++; // tx logical pin
      if (tx_pin <= 63) {
         pinconfig(tx_pin, (uint32_t)baud, (uint32_t)mode, 1); 
         // set up control byte for tx and enable
         p_config(p, (1<<7) | (1<<6) | tx_pin,
                  (uint32_t)tx_start, (uint32_t)tx_start, (uint32_t)tx_start, (uint32_t)tx_end);
      }
   }
}

int s_rxflush(unsigned port) {
   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   while (s_rxcheck(port) >= 0) { }
   return 0;    
}

int s_rxcheck(unsigned port) {
   int rxbyte, rxtail;
   char * new;

   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   ACQUIRE (lock);
   if (*long_rx_tail(port) != *long_rx_head(port)) {
      rxtail = *long_rx_tail(port);
      rxbyte = *(char *)(rxtail);
      rxtail = rxtail + 1;
      if (rxtail == *long_rx_end(port)) {
         rxtail = *long_rx_start(port);
      }
      *long_rx_tail(port) = rxtail;
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
   int rxbytes, rxsize;

   ACQUIRE (lock);
   rxsize = *long_rx_end(port) - *long_rx_start(port);
   rxbytes = *long_rx_head(port) - *long_rx_tail(port);
   if (rxbytes < 0) {
      rxbytes += rxsize;
   }
   RELEASE (lock);
   return rxbytes;
}

int s_rx(unsigned port) {
   int rxbyte;

   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   while ((rxbyte = s_rxcheck(port)) < 0) { }
   return rxbyte;
}

int s_tx(unsigned port, char txbyte) {
   int txsize, txbytes, txhead;

   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   txsize = *long_tx_end(port) - *long_tx_start(port);
   ACQUIRE (lock);
   do {
      txbytes = *long_tx_head(port) - *long_tx_tail(port);
      if (txbytes < 0) {
         txbytes += txsize;
      }
   }
   while (txbytes == txsize - 1);
   
   txhead = (*long_tx_head(port));
   *((char *)(*long_tx_head(port))) = txbyte;
   txhead++;
   if (txhead == *long_tx_end(port)) {
      txhead = *long_tx_start(port);
   }
   *long_tx_head(port) = txhead;

   //if (*long_rxtx_mode(port) & S8_NOECHO) {
   //   s_rx(port);
   //}
   RELEASE (lock);

   return 0;  
}

int s_txflush(unsigned port) {
   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   ACQUIRE (lock);
   while (*long_tx_tail(port) != *long_tx_head(port)) { }
   RELEASE (lock);
   msleep(100); // we don't know the baud rate, so how long to sleep to ensure last char is sent?
   return 0;
}

int s_txcheck(unsigned port) {
   int txbytes, txsize;

   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   ACQUIRE (lock);
   txsize = *long_tx_end(port) - *long_tx_start(port);
   txbytes = *long_tx_head(port) - *long_tx_tail(port);
   if (txbytes < 0) {
      txbytes += txsize;
   }
   RELEASE (lock);
   return txsize - txbytes;
}

//
// s_txcount :  returns number of bytes waiting in send buffer
//
int s_txcount(unsigned port) {
   int txbytes, txsize;

   if (s8base == 0) {
      initialize();
   }
   if (port >= S8_MAX_PORTS) {
      return -1;
   }

   ACQUIRE (lock);
   txsize = *long_tx_end(port) - *long_tx_start(port);
   txbytes = *long_tx_head(port) - *long_tx_tail(port);
   if (txbytes < 0) {
      txbytes += txsize;
   }
   RELEASE (lock);
   return txbytes;
}

