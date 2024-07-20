/*
 * Modified for Catalina by Ross Higson, based on the free original by 
 * Fredrik Hederstierna. This program is public domain (see original 
 * license information below).
 *
 * Catalina-specific notes (including possible known variations from 
 * standard ymodem):
 *
 * 1.  Two consecutive EOTs (i.e. without at least a timeout in between)
 *     are ignored, because this usually indicates that payload has been
 *     terminated so that a ymodem send or receive command can be issued.
 *
 * 2.  While waiting to send a file, the sender transmits repeated 'C'
 *     characters - the original ymodem spec says only the receiver
 *     should do this.
 *
 * 3.  Only one file can currently be sent or received in each command.
 *     If a receive file name is specified, it is used in preference to
 *     the name specified in the initial filename/filesize packet.
 * 
 * 4.  You can use -d to print diagnostic progress messages, and -d -d 
 *     to also see bytes sent or received (this is fine when the ymodem
 *     program is executed on Windows or Linux, but when executed on the 
 *     Propeller it requires that you are using a non-serial HMI option) 
 *     Also note that it is possible printing too much will affect the 
 *     program timing, causing the file transfer to timeout and fail.
 *     You can use the -x option to stop the program exiting, which can
 *     allow you to read the output - but you will then have to reset the 
 *     Propeller to terminate the program.
 *
 * 5.  Define YMODEM_RECEIVE to build a receiver program, or YMODEM_SEND
 *     to build a sending program. For example, using gcc:
 *
 *       gcc fymodem.c rs232.c -D YMODEM_RECEIVE -o receive 
 *       gcc fymodem.c rs232.c -D YMODEM_SEND -o send
 *
 * 6.  Compile this program for the Propeller using a serial library, 
 *     such as -lserial2. For example:
 *
 *       catalina -p2 fymodem.c -D YMODEM_RECEIVE -lcx -lserial2 -o receive
 *       catalina -p2 fymodem.c -D YMODEM_SEND -lcx -lserial2 -o send
 *
 *     Also, note that you cannot use a serial HMI option with this program. 
 *     If there is no other HMI option available then you may need to add 
 *     -C NO_HMI. The Makefile provided does this by default.
 *
 * 7.  By default, ymodem is supposed to use only 128 byte blocks, but many
 *     implementations (including this one!) default to 1024 byte blocks. 
 *     This program can handle both, but the limited buffer sizes on the 
 *     Propeller 1 means that 1024 byte blocks can be sent ok, but only 
 *     128 byte blocks can be received correctly. To specify that the 
 *     sender only send 128 byte blocks, use the -s command line option 
 *     (which is also also used to specify the inter-character delay, 
 *     such as -s0 or -s5). If your ymodem program cannot be configured
 *     to send only 128 byte blocks, you will have to use this program
 *     instead. Fortunately, on Linux the minicom program uses 128
 *     byte blocks by default, so on Windows you can use this program, 
 *     to send and on Linux you can use minicom.
 *     
 * 8.  On Windows and Linux you can set the baud rate on the command line. 
 *     On the Propeller, you must modify the platform configuration files 
 *     to change the baud rate. 
 *
 *     On the Propeller 1, the various serial library baud rates are 
 *     specified in the file Extras.Spin (these can be different to the 
 *     serial HMI baud rate which is specified by SIO_BAUD in the file
 *     platform_DEF.inc - e.g. C3_DEF.inc). 
 *
 *     On the Propeller 2, all baud rates are specified in the platform.inc
 *     configuration file - e.g. P2_EDGE.inc.
 *
 *     The default baud rate used by this program is 230400 baud, which is 
 *     also the default baud rate for the Propeller 2. So for sending and 
 *     receiving files from a Propeller 2 you do not usually need to specify
 *     the baud rate, but for the Propeller 1 you will need to add the command
 *     line option -b115200 (as well as -s0). For example (where N is the
 *     port to which your Propeller is connected):
 *     
 *        send -s0 -b115200 -pN my_file 
 *        receive -b115200 -pN my_file        
 */

/*
 * Free YModem implementation.
 *
 * Fredrik Hederstierna 2014
 *
 * This file is in the public domain.
 * You can do whatever you want with it.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

#include "fymodem.h"
#ifndef __CATALINA__
#include "rs232.h"
#endif

/* filesize 999999999999999 should be enough... */
#define YM_FILE_SIZE_LENGTH        (16)

/* packet constants */
#define YM_PACKET_SEQNO_INDEX      (1)
#define YM_PACKET_SEQNO_COMP_INDEX (2)
#define YM_PACKET_HEADER           (3)      /* start, block, block-complement */
#define YM_PACKET_TRAILER          (2)      /* CRC bytes */
#define YM_PACKET_OVERHEAD         (YM_PACKET_HEADER + YM_PACKET_TRAILER)
#define YM_PACKET_SIZE             (128)
#define YM_PACKET_1K_SIZE          (1024)
#define YM_PACKET_RX_TIMEOUT_MS    (3000)
#define YM_PACKET_TX_TIMEOUT_MS    (3000)
#define YM_PACKET_SLEEP_TIMEOUT_MS (1000)   /* must be < rx and tx timeouts */
#define YM_PACKET_ERROR_MAX_NBR    (5)
#define YM_PACKET_RETRIES          (10)

/* contants defined by YModem protocol */
#define YM_SOH                     (0x01)  /* start of 128-byte data packet */
#define YM_STX                     (0x02)  /* start of 1024-byte data packet */
#define YM_EOT                     (0x04)  /* End Of Transmission */
#define YM_ACK                     (0x06)  /* ACKnowledge, receive OK */
#define YM_NAK                     (0x15)  /* Negative ACKnowledge, receiver ERROR, retry */
#define YM_CAN                     (0x18)  /* two CAN in succession will abort transfer */
#define YM_CRC                     (0x43)  /* 'C' == 0x43, request 16-bit CRC, use in place of first NAK for CRC mode */
#define YM_ABT1                    (0x41)  /* 'A' == 0x41, assume try abort by user typing */
#define YM_ABT2                    (0x61)  /* 'a' == 0x61, assume try abort by user typing */

#define VERSION                    "5.5"
#define MAX_FILES                  1
#define MAX_TIMEOUT                10000 /* milliseconds */
#define MAX_PORTLEN                128
#define MIN_BAUDRATE               300
#define MAX_BAUDRATE               3000000
#define DEFAULT_BAUDRATE           230400

#if defined(__CATALINA_libserial8)
#define MAX_PORTS                  8
#elif defined(__CATALINA_libserial4)
#define MAX_PORTS                  4
#elif defined(__CATALINA_libserial2) 
#define MAX_PORTS                  2
#else
#define MAX_PORTS                  1
#endif

/* ------------------------------------------------ */

/* user callbacks, implement these for your target */
/* user function __ym_getchar() should return -1 in case of timeout */
void __ym_ungetchar(int32_t ch);
int32_t __ym_getchar(uint32_t timeout);
void __ym_putchar(int32_t c);
void __ym_sleep_ms(uint32_t delay);
void __ym_flush();
void __ym_purge();

/* ------------------------------------------------ */

static int    port       = 0;
static int    baudrate   = DEFAULT_BAUDRATE;
static int    timeout    = 0;
static int    verbose    = 0;
static int    small_mode = 0; /* send only 128 byte packets */
static int    small_time = 0; /* milliseconds between chars */
static int    no_exit    = 0;
static int    diagnose   = 0;
static int    file_count = 0;                  
static char   file_name[MAX_FILES][FYMODEM_FILE_NAME_MAX_LENGTH]; 
static int    last_status = 0;
static int    last_expected = 0;
static int    last_actual = 0;

/* ------------------------------------------------ */

void __ym_sleep_ms(uint32_t delay) {
#if defined(__CATALINA__)
    _waitms(delay);
#elif defined(WIN32)
    Sleep(delay);
#else
    //struct timespec rqtp = {delay/1000, (delay % 1000)*1000000};
    //nanosleep(&rqtp, NULL);
    uint32_t s = delay/1000;
    uint32_t u = (delay%1000)*1000;
    while ((s = sleep(s) != 0)) { };
    while (usleep(u) != 0) { };
#endif
}

void __ym_flush() {
#if !defined(__CATALINA__)
   fflush(stdin);
#endif
}

void __ym_purge() {
  uint32_t ch;
  do {
     ch = __ym_getchar(1000);
  } while (ch != -1);
}

/* simple one character unget */
static int32_t __ym_ungotchar = -1;

void __ym_ungetchar(int32_t ch) {
  __ym_ungotchar = ch;
}

#if defined(__CATALINA__)

int32_t __ym_getchar(uint32_t timeout) {
  int32_t ch;
  if ((ch = __ym_ungotchar) >= 0) {
     __ym_ungotchar = -1;
     return ch;
  }
  else {
#if defined(__CATALINA_libserial8)
     ch = s8_rxtime(port, timeout);
#elif defined(__CATALINA_libserial4)
     ch = s4_rxtime(port, timeout);
#elif defined(__CATALINA_libserial2) 
     ch = s2_rxtime(port, timeout);
#elif (defined(__CATALINA_libtty) || defined(__CATALINA_libtty256))
     ch = tty_rxtime(timeout);
#else
     uint32_t count;
     count = timeout/10; /* check every 10 ms */
     while (count > 0) {
       if (k_ready()) break;
       _waitms(10);
       count--;
     }
     if (k_ready()) {
        ch = k_get();
     }
     else {
        ch = -1;
     }
#endif
     if (diagnose > 1) {
        fprintf(stderr, "%02X ", ch);
     }
     return ch;
  }
}

void __ym_putchar(int32_t c) {
#if defined(__CATALINA_libserial8)
   s8_tx(port, c);
#elif defined(__CATALINA_libserial4)
   s4_tx(port, c);
#elif defined(__CATALINA_libserial2) 
   s2_tx(port, c);
#elif (defined(__CATALINA_libtty) || defined(__CATALINA_libtty256))
   tty_tx(c);
#else
   t_char(0, c);
#endif
   if (diagnose > 1) {
      fprintf(stderr, "<%02X ", c);
   }
}

#else

int32_t __ym_getchar(uint32_t timeout) {
   int32_t ch;
   if ((ch = __ym_ungotchar) >= 0) {
      __ym_ungotchar = -1;
      return ch;
   }
   else {
      /* msec timeout */
      uint32_t count;
      uint8_t byte;
      count = timeout/100; /* check every 10 ms */
      while (count > 0) {
         if (ByteReady(port-1)) break;
         __ym_sleep_ms(100);
         count--;
      }
      if (ByteReady(port-1)) {
         byte = ReceiveByte(port-1);
         if (diagnose > 1) {
            fprintf(stderr, "%02X ", byte);
         }
         return byte;
      }
      else {
         return -1;
      }
   }
}

void __ym_putchar(int32_t c) {
   SendByte(port-1, c);
   if (diagnose > 1) {
      fprintf(stderr, "<%02X ", c);
   }
   if (small_mode) {
      __ym_sleep_ms(small_time);
   }
}

#endif

/* ------------------------------------------------ */
/* calculate crc16-ccitt very fast
   Idea from: http://www.ccsinfo.com/forum/viewtopic.php?t=24977
*/
static uint16_t ym_crc16(const uint8_t *buf, uint16_t len) 
{
   uint16_t x;
   uint16_t crc = 0;
   while (len--) {
      x = (crc >> 8) ^ *buf++;
      x ^= x >> 4;
      crc = (crc << 8) ^ (x << 12) ^ (x << 5) ^ x;
   }
   return crc;
}

/* ------------------------------------------------- */
/* write 32bit value as asc to buffer, return chars written. */
static uint32_t ym_writeU32(uint32_t val, uint8_t *buf)
{
   uint32_t ci = 0;
   if (val == 0) {
      /* If already zero then just return zero */
      buf[ci++] = '0';
   }
   else {
      /* Maximum number of decimal digits in uint32_t is 10, add 1 for z-term */
      uint8_t *sp;
      uint8_t s[11];
      int32_t i = sizeof(s) - 1;
      /* z-terminate string */
      s[i] = 0;
      while ((val > 0) && (i > 0)) {
         /* write decimal char */
         s[--i] = (val % 10) + '0';
         val /= 10;
      }
      sp = &s[i];
      /* copy results to out buffer */
      while (*sp) {
         buf[ci++] = *sp++;
      }
   }
   /* z-term */
   buf[ci] = 0;
   /* return chars written */
   return ci;
}

/* ------------------------------------------------- */
/* read 32bit asc value from buffer */
static void ym_readU32(const uint8_t* buf, uint32_t *val)
{
   const uint8_t *s = buf;
   uint32_t res = 0;
   uint8_t c;  
   /* trim and strip leading spaces if any */
   do {
      c = *s++;
   } while (c == ' ');
   while ((c >= '0') && (c <= '9')) {
      c -= '0';
      res *= 10;
      res += c;
      /* next char */
      c = *s++;
   }
   *val = res;
}

/* -------------------------------------------------- */
/**
  * Receive a packet from sender
  * @param packets_rxed is the number of packets already received
  * @param timeout is the character timeout to use
  * @param rxlen
  *    >0: packet length
  *     0: EOT
  *    -1: abort (CAN CAN)
  *    -2: abort ('A' or 'a')
  *    -3: unexpected data
  * @return 0: normal return - good packet / EOT / abort
  *        -1: timeout or start condition ('C')
  *         1: other - CRC error / invalid seq num / unexpected data
  */
static int32_t ym_rx_packet(uint8_t *rxdata,
                            int32_t *rxlen,
                            uint32_t packets_rxed,
                            uint32_t timeout)
{
   int32_t c;
   uint32_t i;
   uint32_t rx_packet_size;
   uint16_t crc16_val;
   uint8_t seq_nbr;
   uint8_t seq_cmp;

   *rxlen = 0;

   c = __ym_getchar(timeout);

   if (c == YM_EOT) {
      /* two EOTs in quick succession may be payload exiting */
      c = __ym_getchar(timeout);
      if (c == YM_EOT) {
         /* ignore two EOTs not separated by at least a timeout */
         c = __ym_getchar(timeout);
      }
      else {
         /* genuine EOT */
         if (c >= 0) {
            __ym_ungetchar(c);
         }
         c = YM_EOT;
      }
   }

   if (c < 0) {
      /* timeout or end of stream */
      if (diagnose) {
         fprintf(stderr, "Char Timeout\n");
      }
      return -1;
   }

   switch (c) {
   case YM_SOH:
      if (diagnose) {
         fprintf(stderr, "SOH\n");
      }
      rx_packet_size = YM_PACKET_SIZE;
      break;
   case YM_STX:
      if (diagnose) {
         fprintf(stderr, "STX\n");
      }
      rx_packet_size = YM_PACKET_1K_SIZE;
      break;
   case YM_EOT:
      if (diagnose) {
         fprintf(stderr, "EOT\n");
      }
      /* ok */
      return 0;
   case YM_CAN:
      if (diagnose) {
         fprintf(stderr, "CAN\n");
      }
      c = __ym_getchar(timeout);
      if (c == YM_CAN) {
         *rxlen = -1;
         /* ok */
         return 0;
      }
      /* fall-through */
   case YM_CRC:
      if (diagnose) {
         fprintf(stderr, "CRC\n");
      }
      if (packets_rxed == 0) {
        /* could be start condition, first byte */
        return -1;
      }
      /* fall-through */
   case YM_ABT1:
   case YM_ABT2:
      if (diagnose) {
         fprintf(stderr, "ABT\n");
      }
      /* User abort, 'A' or 'a' received */
      *rxlen = -2;
      return 0;
   default:
      if (diagnose) {
         fprintf(stderr, "?%02X?\n", c);
      }
      /* This case could be the result of corruption on the first octet
         of the packet, but it's also possible that it's the result of
         some characters being lost in transmission, or the sender sending
         other stuff (such as a prompt) because the sending program has 
         been terminated */
      *rxlen = -3;
      return 1;
   }

   /* store data RXed */
   *rxdata = (uint8_t)c;

   for (i = 1; i <= (rx_packet_size + YM_PACKET_OVERHEAD-1); i++) {
      c = __ym_getchar(timeout);
      if (c < 0) {
         /* end of stream */
         if (diagnose) {
            fprintf(stderr, "incomplete packet, expected %d, got %d\n", rx_packet_size, i);
         }
         return -1;
      }
      /* store data RXed */
      rxdata[i] = (uint8_t)c;
   }
   if (diagnose) {
      fprintf(stderr, "packet finished, last char = %02X\n", c);
   }

   /* just a sanity check on the sequence number/complement value.
      caller should check for in-order arrival. */
   seq_nbr = (rxdata[YM_PACKET_SEQNO_INDEX] & 0xff);
   seq_cmp = ((rxdata[YM_PACKET_SEQNO_COMP_INDEX] ^ 0xff) & 0xff);
   if (diagnose) {
      fprintf(stderr, "seq num = %d\n", seq_nbr);
   }
   if (seq_nbr != seq_cmp) {
      /* seq nbr error */
      if (diagnose) {
         fprintf(stderr, "seq num error\n");
      }
      return 1;
   }

   /* check CRC16 match */
   crc16_val = ym_crc16((const unsigned char *)(rxdata + YM_PACKET_HEADER),
                                rx_packet_size + YM_PACKET_TRAILER);
   if (crc16_val) {
      /* CRC error, non zero */
      if (diagnose) {
         fprintf(stderr, "CRC error\n");
      }
      return 1;
   }
   *rxlen = rx_packet_size;
   /* success */
   if (diagnose) {
      fprintf(stderr, "packet ok\n");
   }
   return 0;
}

/* ------------------------------------------------- */
/**
 * Receive a file using the ymodem protocol
 * @param file is the file to use (already opened if we got given a file name)
 * @param filename is the filename (if we got given a file name)
 * @param timeout is the character timeout to use
 * @param max_restarts is the maximum times to retry start (0 means forever)
 * @return The length of the file received, or 0 on error
 */
int32_t fymodem_receive(FILE **file,
                        char filename[FYMODEM_FILE_NAME_MAX_LENGTH],
                        uint32_t timeout,
                        uint32_t max_restarts)
{
   char rx_filename[FYMODEM_FILE_NAME_MAX_LENGTH];
   /* alloc 1k on stack, ok? */
   uint8_t rx_packet_data[YM_PACKET_1K_SIZE + YM_PACKET_OVERHEAD];
   int32_t rx_packet_len = 0;
   int32_t rx_done = 0;
   int32_t rx_left = 0;
   uint32_t rx_size = 0;

   uint8_t filesize_asc[YM_FILE_SIZE_LENGTH];
   uint32_t filesize = 0;

   bool first_try = true;
   bool session_done = false;

   uint32_t nbr_errors = 0;
   uint32_t nbr_restarts = 0;

   /* z-term received filename string */
   rx_filename[0] = 0;

   /* receive files */
   do { /* ! session done */
      bool crc_nak = true;
      bool file_done = false;
      uint32_t packets_rxed = 0;

      if (first_try) {
        /* initiate transfer */
        __ym_purge();
        __ym_putchar(YM_CRC);
      }
      first_try = false;

      do { /* ! file_done */
         /* receive packets */
         int32_t res = ym_rx_packet(rx_packet_data,
                                    &rx_packet_len,
                                    packets_rxed,
                                    timeout);
         if (diagnose) {
            fprintf(stderr, "ym_rx_packet returned %d, len = %d\n", 
                    res, rx_packet_len);
         }
         switch (res) {
         case -1: {
            /* timeout or 'C' - this is probably not an error - if we 
             * have not recieved any packets, try to intiate transfer 
             * again */
            if (packets_rxed == 0) {
               nbr_restarts++;
               if ((max_restarts > 0) && (nbr_restarts >= max_restarts)) {
                  /* very likely sender has not been started! */
                  if (diagnose) {
                     fprintf(stderr, "Too many errors (%d) - abort\n", nbr_restarts);
                  }
                  goto rx_err_handler;
               }
               __ym_putchar(YM_CRC);
            }
            break;
         }
         case 0: {
            /* packet received, clear packet error counter */
            nbr_errors = 0;
            switch (rx_packet_len) {
            case -1: {
               if (diagnose) {
                  fprintf(stderr, "Aborted by sender\n");
               }
               /* aborted by sender */
               __ym_putchar(YM_ACK);

               /* this is not necessarily an error - it may mean the 
                * sender has terminated the session. We assume the result 
                * is ok if all the expected data has been received */
               if (rx_left == 0) {
                  return rx_done;
               }
               else {
                  return 0;
               }
               break;
            }
            case 0: {
               /* EOT - End Of Transmission */
               __ym_putchar(YM_ACK);
               /* TODO: Add some sort of sanity check on the number of
                  packets received and the advertised file length. */
               file_done = true;
               /* resend CRC to re-initiate transfer */
               __ym_putchar(YM_CRC);
               break;
            }
            default: {
               /* good packet, check seq nbr */
               uint8_t seq_nbr = rx_packet_data[YM_PACKET_SEQNO_INDEX];
               if (seq_nbr != (packets_rxed & 0xff)) {
                  /* wrong seq number */
                  if (diagnose) {
                     fprintf(stderr, "out of sequence, expected %d, got %d\n",
                             packets_rxed, seq_nbr);
                  }
               }
               else {
                  if (packets_rxed == 0) {
                     /* The spec suggests that the whole data section should
                        be zeroed, but some senders might not do this.
                        If we have a NULL filename and the first few digits of
                        the file length are zero, then call it empty. */
                     int32_t i;
                     for (i = YM_PACKET_HEADER; i < YM_PACKET_HEADER + 4; i++) {
                        if (rx_packet_data[i] != 0) {
                           break;
                        }
                     }
                     /* non-zero bytes in header, filename packet has data */
                     if (i < YM_PACKET_HEADER + 4) {
                        /* read file name */
                        uint8_t *file_ptr = (uint8_t*)(rx_packet_data + YM_PACKET_HEADER);
                        i = 0;
                        while ((*file_ptr != '\0') &&
                               (i < FYMODEM_FILE_NAME_MAX_LENGTH-1)) {
                           rx_filename[i++] = *file_ptr++;
                        }
                        rx_filename[i++] = '\0';
                        /* skip null term char */
                        file_ptr++;
                        /* read file size */
                        i = 0;
                        while ((*file_ptr != '\0') &&
                               (*file_ptr != ' ')  &&
                               (i < YM_FILE_SIZE_LENGTH)) {
                           filesize_asc[i++] = *file_ptr++;
                        }
                        filesize_asc[i++] = '\0';
                        /* convert file size */
                        ym_readU32 (filesize_asc, &filesize);
                        last_expected = filesize;
                        /* use this file name if we were not given one */
                        if (strlen(filename) == 0) {
                           if (strlen(rx_filename) > 0) {
                              if ((*file = fopen(rx_filename, "wb")) == NULL) {
                                 fprintf(stderr, "\nCannot open file '%s' for write\n",
                                        rx_filename);
                                 exit(0);
                              }
                              else {
                                 strncpy(filename, rx_filename, FYMODEM_FILE_NAME_MAX_LENGTH);
                              }
                           }
                           else {
                              fprintf(stderr, "No filename specified or received\n");
                              exit(0);
                           }    
                        }

                        /* keep track of bytes received, and bytes left */
                        rx_done = 0;
                        rx_left = filesize;
                        __ym_putchar(YM_ACK);
                        __ym_putchar(crc_nak ? YM_CRC : YM_NAK);
                        crc_nak = false;
                     }
                     else {
                       if (diagnose) {
                          fprintf(stderr, "Empty filename packet\n");
                       }
                       /* filename packet is empty, end session */
                       __ym_putchar(YM_ACK);
                       file_done = true;
                       session_done = true;
                       break;
                     }
                  }
                  else {
                     if (rx_left > rx_packet_len) {
                        rx_size = rx_packet_len;
                     }
                     else {
                        rx_size = rx_left;
                     }
                     if (rx_size != fwrite(&rx_packet_data[YM_PACKET_HEADER], 
                                           1, rx_size, *file)) {
                        fprintf(stderr, "Failed to write\n");
                     }
                     rx_done += rx_size;
                     rx_left -= rx_size;
                     __ym_putchar(YM_ACK);
                  }
                  packets_rxed++;
                  break;
               }  /* sequence number check ok */
            } /* default */
            } /* inner switch */
            break;
         } /* case 0 */
         default: {
            /* ym_rx_packet() returned error */
            nbr_errors++;
            if (nbr_errors >= YM_PACKET_ERROR_MAX_NBR) {
               if (diagnose) {
                  fprintf(stderr, "Too many errors (%d) - abort\n", nbr_errors);
               }
               goto rx_err_handler;
            }
            __ym_purge();
            __ym_putchar(YM_NAK);
            break;
         } /* default */
         } /* switch */

         /* check end of receive packets */
      } while (! file_done);

      /* check end of receive files */
   } while (! session_done);

   /* return bytes received */
   return rx_done;

rx_err_handler:
   __ym_putchar(YM_CAN);
   __ym_putchar(YM_CAN);
   __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
   return 0;
}

/* ------------------------------------ */
static void ym_send_packet(uint8_t *txdata,
                           int32_t block_nbr)
{
   int32_t tx_packet_size;
   uint16_t crc16_val;
   int32_t i;

   /* We use a short packet for block 0, all others are 1K unless we are 
    * using small packet mode, when only 128 byte packets will be sent */
   if ((block_nbr == 0) || (small_mode)) {
      tx_packet_size = YM_PACKET_SIZE;
   }
   else {
      tx_packet_size = YM_PACKET_1K_SIZE;
   }

   crc16_val = ym_crc16(txdata, tx_packet_size);

   /* For 128 byte packets use SOH, for 1K use STX */
   __ym_putchar( ((block_nbr == 0) || small_mode) ? YM_SOH : YM_STX );
   /* write seq numbers */
   __ym_putchar(block_nbr & 0xFF);
   __ym_putchar(~block_nbr & 0xFF);

   /* write txdata */
   for (i = 0; i < tx_packet_size; i++) {
      __ym_putchar(txdata[i]);
   }

   /* write crc16 */
   __ym_putchar((crc16_val >> 8) & 0xFF);
   __ym_putchar(crc16_val & 0xFF);
}

/* ----------------------------------------------- */
/* Send block 0 (the filename block), filename might be truncated to fit. */
static void ym_send_packet0(const char* filename,
                            int32_t filesize)
{
   int32_t pos = 0;
   /* put 256byte on stack, ok? reuse other stack mem? */
   uint8_t block[YM_PACKET_SIZE];

   if (filename) {
      /* write filename */
      while (*filename && (pos < YM_PACKET_SIZE - YM_FILE_SIZE_LENGTH - 2)) {
         block[pos++] = *filename++;
      }
      /* z-term filename */
      block[pos++] = 0;

      /* write size, TODO: check if buffer can overwritten here. */
      pos += ym_writeU32(filesize, &block[pos]);
   }

   /* z-terminate string, pad with zeros */
   while (pos < YM_PACKET_SIZE) {
      block[pos++] = 0;
   }

   /* send header block */
   ym_send_packet(block, 0);
}

/* ------------------------------------------------- */

static uint32_t ym_send_data_packets(FILE *file,
                                     uint32_t txlen,
                                     uint32_t timeout)
{
   int32_t block_nbr = 1;
   int32_t block_ack = 0;
   int32_t block_retries = 0;
   int32_t ch;
   uint8_t txdata[YM_PACKET_1K_SIZE];
   uint32_t tx_left = 0;
   uint32_t tx_sent = 0;

   tx_left = txlen;
   while (tx_left > 0) {
      /* check if send full 1k packet */
      uint32_t send_size;
      uint32_t read_size;
      int32_t c;
      if (small_mode) {
         if (tx_left > YM_PACKET_SIZE) {
            send_size = YM_PACKET_SIZE;
         } else {
            send_size = tx_left;
         }
      }
      else {
         if (tx_left > YM_PACKET_1K_SIZE) {
            send_size = YM_PACKET_1K_SIZE;
         } else {
            send_size = tx_left;
         }
      }
      /* read data if first block or block has been acked */
      if ((block_nbr == 1) || block_ack) {
         memset(txdata, 0, YM_PACKET_1K_SIZE);
         if (diagnose) {
            fprintf(stderr, "reading %d\n", send_size);
            fprintf(stderr, "tx_left %d\n", tx_left);
         }
         read_size = fread(txdata, 1, send_size, file);
         if (read_size != send_size) {
             fprintf(stderr, "Failed to read, size = %d\n", read_size);
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "retransmitting existing block %d\n", block_nbr);
         }
         __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
      }
      /* send packet */
      ym_send_packet(txdata, block_nbr);
      c = __ym_getchar(timeout);
      block_ack = (c == YM_ACK);
      switch (c) {
      case YM_CRC:
         if (diagnose) {
            fprintf(stderr, "CRC\n");
         }
         break;
      case YM_NAK:
         if (diagnose) {
            fprintf(stderr, "NAK\n");
         }
         break;
      case YM_ACK: {
         if (diagnose) {
            fprintf(stderr, "ACK\n");
         }
         tx_left  -= send_size;
         tx_sent  += send_size;
         block_ack = 1;
         block_nbr++;
         break;
      }
      case -1:
         if (diagnose) {
            fprintf(stderr, "Char Timeout\n");
         }
         return tx_sent;
      case YM_CAN: {
         if (diagnose) {
            fprintf(stderr, "CAN\n");
         }
         return tx_sent;
      }
      default:
         if (diagnose) {
            fprintf(stderr, "[%02X] ", c);
            if (diagnose > 1) {
               /* print what we actually received */
               do {
                  fprintf(stderr, "%02X ", c);
                  c = __ym_getchar(timeout);
               } while (c > 0);
            }
         }
         if (block_retries++ > YM_PACKET_RETRIES) {
            return tx_sent;
         }
         break;
      }
   }

   do {
      __ym_putchar(YM_EOT);
      ch = __ym_getchar(timeout);
   } while ((ch != YM_ACK) && (ch != -1));

   return tx_sent;
}

/* ------------------------------------------------------- */

void fymodem_port(uint32_t use_port) {
   port = use_port;
}

void fymodem_small(uint32_t mode, uint32_t time) {
   small_mode = mode;
   small_time = time;
   last_status = 0;
}

void fymodem_abort() {
   __ym_putchar(YM_CAN);
   __ym_putchar(YM_CAN);
   __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
   last_status = 0;
}

/* ------------------------------------------------------- */

int32_t fymodem_send(FILE *file, 
                     size_t txsize, 
                     const char* filename, 
                     uint32_t timeout)
{
   bool crc_nak = true;
   bool file_done = false;
   uint32_t tx_done = 0;
   int32_t ch;
   /* flush the RX FIFO, after a cool off delay */
   __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
   __ym_purge();
   //__ym_flush();
   //(void)__ym_getchar(timeout);

   do {
      /* not in the specs, send CRC here just for balance */
      __ym_putchar(YM_CRC);
      ch = __ym_getchar(timeout);
      if (ch == YM_EOT) {
         /* two EOTs in succession may be payload exiting */
         ch = __ym_getchar(timeout);
         if (ch == YM_EOT) {
            /* ignore two EOTs not separated by at least a timeout */
            ch = __ym_getchar(timeout);
         }
         else {
           /* genuine EOT */
           if (ch >= 0) {
              __ym_ungetchar(ch);
           }
           ch = YM_EOT;
         }
      }
   } while (ch < 0);

   /* we do require transfer with CRC */
   if (ch != YM_CRC) {
      if (diagnose) {
         fprintf(stderr, "Expected CRC\n");
         if (diagnose > 1) {
            /* print what we actually received */
            do {
               fprintf(stderr, "%02X ", ch);
               ch = __ym_getchar(timeout);
            } while (ch > 0);
         }
      }
      goto tx_err_handler;
   }

   do {
      ym_send_packet0(filename, txsize);
      /* When the receiving program receives this block and successfully
         opened the output file, it shall acknowledge this block with an ACK
         character and then proceed with a normal XMODEM file transfer
         beginning with a "C" or NAK tranmsitted by the receiver. */
      ch = __ym_getchar(timeout);
      if (diagnose) {
         if (ch == YM_NAK) {
            fprintf(stderr, "NAK\n");
         }
      }
      if (ch == YM_ACK) {
         if (diagnose) {
            fprintf(stderr, "ACK\n");
         }
         ch = __ym_getchar(timeout);
         if (ch == YM_CRC) {
            if (diagnose) {
               fprintf(stderr, "CRC\n");
            }
            tx_done += ym_send_data_packets(file, txsize, timeout);
            /* success */
            file_done = true;
         }
      }
      else if ((ch == YM_CRC) && (crc_nak)) {
         crc_nak = false;
         continue;
      }
      else if ((ch != YM_NAK) || (crc_nak)) {
         goto tx_err_handler;
      }
   } while (! file_done);

   /* temporary - terminate session */
   if (diagnose) {
      fprintf(stderr, "Terminating session\n");
   }
   do {
      // send empty filename packet to terminate session */
      ym_send_packet0(0, 0);
      ch = __ym_getchar(timeout);
   } while ((ch != YM_ACK) && (ch != -1));

   return tx_done;

tx_err_handler:
   __ym_putchar(YM_CAN);
   __ym_putchar(YM_CAN);
   __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
   return 0;
}

/* ------------------------------------------------------- */

#if defined(YMODEM_SEND) || defined(YMODEM_RECEIVE)

void help(char *my_name) {
   int i;

   fprintf(stderr, "Catalina Ymodem %s\n", VERSION); 
   fprintf(stderr, "\nusage: %s [options] file \n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message and exit (-v for more help)\n");
   fprintf(stderr, "          -b baud   use specified baudrate\n");
   fprintf(stderr, "          -B baud   same as -b\n");
   fprintf(stderr, "          -d        diagnostic mode (-d again for more diagnostics)\n");
   fprintf(stderr, "          -p port   use port\n");
#ifdef YMODEM_SEND
   fprintf(stderr, "          -s msec   small/slow mode - use 128 byte packets, msec char time\n");
#endif
   fprintf(stderr, "          -t msec   set general timeout in milliseconds\n");
   fprintf(stderr, "          -v        verbose mode (and include port numbers in help)\n");
   fprintf(stderr, "          -x        no exit mode (e.g. to read output)\n");
#if defined(__CATALINA__)
   if (verbose) {
      fprintf(stderr, "\nport can be 0 .. %d\n", MAX_PORTS);
   }
#else
   if (verbose) {
      fprintf(stderr, "\nport can be:\n");
      for (i = 0; i < ComportCount(); i++) {
         fprintf(stderr, "          %s%d = %s\n", 
                 (i < 9 ? " " : ""), i + 1, ShortportName(i));
      }
   }
#endif
}

int alldigits(char *str) {
   int len = strlen(str);
   int i;

   for (i = 0; i < len; i++) {
      if (!isdigit(str[i])) {
         return 0;
      }
   }
   return 1;
}

/*
 * decode arguments, building file list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int  i = 0;
   int  code = 0;
   char portname[MAX_PORTLEN + 3 + 1];

   while ((code >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            /* it's a command line switch */
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     /* in case my name was not passed in ... */
                     help("ymodem");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'b':
               case 'B':
#ifdef __CATALINA__
                  fprintf(stderr, "baudrate must be set in configuration files\n");
#else
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &baudrate);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -b requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     sscanf(&argv[i][2], "%d", &baudrate);
                  }
                  if ((baudrate < MIN_BAUDRATE) || (baudrate > MAX_BAUDRATE)) {
                     fprintf(stderr, "Error: baudrate must be in the range %d to %d\n", MIN_BAUDRATE, MAX_BAUDRATE);
                     baudrate = DEFAULT_BAUDRATE;
                  }
                  if (verbose) {
                     fprintf(stderr, "using baudrate %d\n", baudrate);
                  }
#endif
                  break;
               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  verbose = 1;   /* diagnose implies verbose */
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;
               case 'p':
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        if (alldigits(argv[++i])) {
                           sscanf(argv[i], "%d", &port);
                        }
                        else {
#ifdef __CATALINA__
                           fprintf(stderr, "Option -p requires a numeric parameter\n");
#else
                           sscanf(argv[i],"%s", portname);
                           if (verbose) {
                              fprintf(stderr, "setting port name %s\n", portname);
                           }
                           port = SetComportName(portname, 0);
#endif
                        }
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -p requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     if (alldigits(&argv[i][2])) {
                        sscanf(&argv[i][2], "%d", &port);
                     }
                     else {
#ifdef __CATALINA__
                        fprintf(stderr, "Option -p requires a numeric parameter\n");
#else
                        sscanf(&argv[i][2],"%s", portname);
                        if (verbose) {
                           fprintf(stderr, "setting port name %s\n", portname);
                        }
                        port = SetComportName(portname, 0);
#endif
                     }
                  }
#ifdef __CATALINA__
                  if (port > MAX_PORTS) {
                     fprintf(stderr, "Error: port must be in the range 0 to %d\n", MAX_PORTS);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using port %d\n", port);
                     }
                  }
#else
                  if ((port < 1) || (port > ComportCount())) {
                     fprintf(stderr, "Error: port must be in the range 1 to %d\n", ComportCount());
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using port %s\n", ShortportName(port-1));
                     }
                  }
#endif
                  break;
               case 's':
                  small_mode = 1;
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &small_time);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -s requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     sscanf(&argv[i][2], "%d", &small_time);
                  }
                  if ((timeout < 1) || (timeout > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: delay must be in the range 1 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "small mode, using delay %d\n", small_time);
                     }
                  }
                  break;
               case 't':
                  if (strlen(argv[i]) == 2) {
                     /* use next arg */
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &timeout);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -t requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     /* use remainder of this arg */
                     sscanf(&argv[i][2], "%d", &timeout);
                  }
                  if ((timeout < 1) || (timeout > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: timeout must be in the range 1 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using timeout %d\n", timeout);
                     }
                  }
                  break;
               case 'v':
                  verbose = 1;
                  fprintf(stderr, "verbose mode\n");
                  break;
               case 'x':
                  no_exit = 1;
                  fprintf(stderr, "no exit mode\n");
                  break;
               default:
                  fprintf(stderr, "\nError: unrecognized switch: %s\n", argv[i]);
                  code = -1; /* force exit without further processing */
                  break;
            }
         }
         else {
            /* assume its a filename */
            if (file_count < MAX_FILES) {
               memset(file_name[file_count], 0, FYMODEM_FILE_NAME_MAX_LENGTH);
               strncpy(file_name[file_count], argv[i], FYMODEM_FILE_NAME_MAX_LENGTH);
               file_count++;
               code = 1; /* work to do */
            }
            else {
               fprintf(stderr, "\ntoo many files specified - file %s will be ignored\n", argv[i]);
            }
         }
      }
      i++; /* next argument */
   }
   if (code == -1) {
      return code;
   }

   return code;
}

#endif

/* ------------------------------------------------------- */

#ifdef YMODEM_RECEIVE
int main(int argc, char *argv[]) {
   int st;
   FILE *file;

   /* set default timeout */
   timeout = YM_PACKET_RX_TIMEOUT_MS;

   if (decode_arguments(argc, argv) < 0) {
      exit(0);
   }

   /* if we received a file name we open the file first ... */
   if (file_count > 0) {
      if ((file = fopen(file_name[0], "wb")) == NULL) {
        fprintf(stderr, "\nCannot open file '%s' for write\n", file_name[0]);
         exit(0);
      }
   }

#ifndef __CATALINA__
   st = OpenComport(port-1, baudrate, timeout, verbose);
   if (st == 0) {
      if (verbose) {
         fprintf(stderr, "opened port %d\n", port);
      }
   }
   else {
      fprintf(stderr, "error %d opening port %d\n", st, port);
   }
#endif

   if (verbose) {
      printf ("Start sender to send data now...\n");
   }
   st = fymodem_receive(&file, file_name[0], timeout, 0);
   last_actual = st;
   if (verbose) {
      printf ("receive result: %d\n", st);
   }
   if (st == 0) {
      fprintf (stderr, "error: receive incomplete");
   }
   fclose(file);

#ifndef __CATALINA__
   CloseComport(port-1);
#endif

   if (no_exit) {
      while(1);
   }
   return 0;
}
#endif

/* ------------------------------------------------------- */

#ifdef YMODEM_SEND
int main(int argc, char *argv[]) {
   int st;
   FILE *file;
   unsigned long size;

   /* set default timeout */
   timeout = YM_PACKET_TX_TIMEOUT_MS;

   if (decode_arguments(argc, argv) <= 0) {
      exit(0);
   }

#ifndef __CATALINA__
   st = OpenComport(port-1, baudrate, timeout, verbose);
   if (st == 0) {
      if (verbose) {
         fprintf(stderr, "opened port %d\n", port);
      }
   }
   else {
     fprintf(stderr, "error %d opening port %d\n", st, port);
   }
#endif
   if ((file = fopen(file_name[0], "rb")) != NULL) {
      fseek(file, 0L, SEEK_END);
      size = ftell(file);
      last_expected = size;
      if (verbose) {
         printf("\nFile '%s' size = %ld\n", file_name[0], size);
      }
      fseek(file, 0L, SEEK_SET);
   }
   else {
      fprintf(stderr, "\nCannot open file for read\n");
      exit(0);
   }

   if (verbose) {
      printf ("Start receiver to receive data now...\n");
   }
   st = fymodem_send(file, size, file_name[0], timeout);
   last_actual = st;
   if (verbose) {
      printf ("transmit result: %d\n", st);
   }
   if (st != size) {
      fprintf (stderr, "error: transmit incomplete, expected %ld\n", size);
   }
   fclose(file);

#ifndef __CATALINA__
   CloseComport(port-1);
#endif

   if (no_exit) {
      while(1);
   }
   return 0;
}
#endif

/* retreive status of last operation */
int
fymodem_status () {
   return last_status;
}

/* retreive expected count of last operation */
int
fymodem_expected () {
   return last_expected;
}

/* retreive actual count of last operation */
int
fymodem_actual () {
   return last_actual;
}

/* retreive file name of last operation */
char *
fymodem_file_name () {
   return (char *)file_name;
}


