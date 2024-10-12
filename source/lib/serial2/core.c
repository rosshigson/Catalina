#include <serial2.h>
#include <plugin.h>
#include <cog.h>

static long *mailbox = 0; // initialized on first use
static long lock    = -1; // initialized on first use

/*
 * Macros to calculate maibox pointers (note arithmetic is on long pointers):
 */
#define rxcmd(port)         (mailbox+4*port+0)
#define rxpar(port)         (mailbox+4*port+1)
#define txcmd(port)         (mailbox+4*port+2)
#define txpar(port)         (mailbox+4*port+3)

/*
 * command definitions
 */
#define CMD_SIZE   -4 // RX or TX - return size of buffer
#define CMD_CHARS  -3 // RX - return number of bytes waiting in buffer
                      // TX - retrns number of bytes free in buffer
#define CMD_CHECK  -2 // RX - returns byte, or -1 if no bytes in RX buffer
                      // TX - return number of bytes free (-1 if full)
#define CMD_READY  -1 // RX or TX - ready for command (previous command complete)
#define CMD_BLOCK   0 // RX or TX - cmd >= 0 means xfer block of specified size


/******************************* INTERNAL FUNCTIONS ****************************/

static void initialize() {
   int cog;
   unsigned int request;
  
   if (mailbox == 0) {
      // find S2 plugin (if loaded)
      cog = _locate_plugin(LMM_S2A);
      if (cog >= 0) {
         // fetch our request block entry
         request = (*REQUEST_BLOCK(cog)).request;
         // lower 24 bits is our mailbox pointer
         mailbox = (long *)(request&0x00FFFFFF);
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

//
// s2_wait_rxready :  wait until rxcmd = -1, signalling completion  
//                    of last command, or ready for next command
// 
// returns           -1 on ready, -2 on timeout
//
static int s2_wait_rxready(unsigned port, long timeout) {
    int result = -2;

   if (timeout > 0) {
      do {
         timeout--;
         if ((result = *rxcmd(port)) == -1) {
            result = *rxpar(port);
            timeout = -10;
         }
      } while (timeout > 0);
      if (timeout == -10) {
         *rxcmd(port) = -1;
         *rxpar(port) = -1; 
      }
   }
   else {
       do { } while (*rxcmd(port) != CMD_READY);
       result = *rxpar(port);
   }
   return result;
}

//
// s2_read_async :  read block of given size from port to hubaddr (doesn't wait)
//
static void s2_read_async(void *hubaddr, int size, int port) {
   s2_wait_rxready(port, -1);
   *rxpar(port) = (int)hubaddr;
   *rxcmd(port) = size; 
}

//
// s2_read : read block of given size to hubaddr (waits until done)
//
static int s2_read(void *hubaddr, int size, int port) {
  s2_read_async(hubaddr, size, port);
  return s2_wait_rxready(port, -1);
}

//
// s2_wait_txready :  waits until tx port cmd = -1, signaling completion of 
//                    last cmd or being ready for next cmd
//
static int s2_wait_txready(int port) {
    do { } while (*txcmd(port) != CMD_READY);
    return *txpar(port);
}

//
// s2_write_async : send block from hubaddr of given size (does not wait)
//
static void s2_write_async(void *hubaddr, int size, int port) {
   s2_wait_txready(port);
   *txpar(port) = (int)hubaddr;
   *txcmd(port) = size;
}

//
// s2_write :  send a block from hubaddr of given size (waits until done)
//
static int s2_write(void *hubaddr, int size, int port) {
   s2_write_async(hubaddr, size, port);
   return s2_wait_txready(port);
}

//
// s2_txsize :  returns size of send buffer in bytes
static int s2_txsize(port) { 
   return s2_write(0, CMD_SIZE, port);
}

//
// s2_txfree :  returns number of bytes free in send buffer
//
static int s2_txfree(port) {
   return s2_write(0, CMD_CHARS, port);
}

/******************************* EXTERNAL FUNCTIONS ****************************/

//
// s2_rxcheck :  check if byte received
// 
// returns       -1 if no byte or bad port, otherwise byte received
//
int s2_rxcheck(unsigned port) {
   int rxbyte = 0;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   rxbyte = s2_read(&rxbyte, CMD_CHECK, port);
   RELEASE(lock);
   
   return rxbyte;
}

//
// s2_rxflush - wait till buffer empty
//
int s2_rxflush(unsigned port) {
   int rxbyte = 0;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   while (s2_read(&rxbyte, CMD_CHECK, port) >= 0) { };
   RELEASE(lock);

   return 0;    
}

//
// s2_rxcount :  returns number of bytes waiting in receive buffer
//
int s2_rxcount(unsigned port) {
   int rxbyte = 0;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   rxbyte = s2_read(&rxbyte, CMD_CHARS, port);
   RELEASE(lock);
   
   return rxbyte;
}

//
// s2_rx :    receive a byte (waits until done)
//
// returns    recived byte
//
int s2_rx(unsigned port) {
   int rxbyte = 0;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock)
   s2_read(&rxbyte, 1, port);
   RELEASE(lock);

   return rxbyte;
}

//
// s2_tx :    send a byte (waits until done)
//
// returns    -1 if bad port
//
int s2_tx(unsigned port, char txbyte) {
   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   s2_write((void *)-1, txbyte, port);
   RELEASE(lock);

   return 0;  
}

//
// s2_txflush :  flush output buffer (waits until done)
//
// returns       -1 if bad port
//
int s2_txflush(unsigned port) {
   int bsize;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   bsize = s2_txsize(port);
   do { } while (s2_txfree(port) < bsize);
   RELEASE(lock);

   return 0;
}

//
// s2_txcheck : returns spaces available in tx buffer (-1 if full)
//
// returns      -1 if no spaces available or bad port
//
int s2_txcheck(unsigned port) {
   int txbytes;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   ACQUIRE(lock);
   txbytes = s2_write(0, CMD_CHECK, port);
   RELEASE(lock);

   return txbytes;
}

//
// s2_txcount :  returns number of bytes waiting in send buffer
//
int s2_txcount(unsigned port) {
   int txsize, txfree;

   if (mailbox == 0) {
      initialize();
   }
   if ((mailbox == 0) || (port > 1)) {
      return -1;
   }

   txsize = s2_txsize(port);
   txfree = s2_txfree(port);
   return txsize - txfree;
}

