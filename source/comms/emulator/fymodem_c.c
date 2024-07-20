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

#include "fymodem_c.h"
#include <stdint.h>
#include <stdio.h>
#include <synchapi.h>
#include <windows.h>

/* filesize 999999999999999 should be enough... */
#define YM_FILE_SIZE_LENGTH (16)

/* packet constants */
#define YM_PACKET_SEQNO_INDEX (1)
#define YM_PACKET_SEQNO_COMP_INDEX (2)
#define YM_PACKET_HEADER (3)  /* start, block, block-complement */
#define YM_PACKET_TRAILER (2) /* CRC bytes */
#define YM_PACKET_OVERHEAD (YM_PACKET_HEADER + YM_PACKET_TRAILER)
#define YM_PACKET_SIZE (128)
#define YM_PACKET_1K_SIZE (1024)
#define YM_PACKET_RX_TIMEOUT_MS (3000)
#define YM_PACKET_TX_TIMEOUT_MS (3000)
#define YM_PACKET_SLEEP_TIMEOUT_MS (1000) /* must be < rx and tx timeouts */
#define YM_PACKET_ERROR_MAX_NBR (5)
#define YM_PACKET_RESTART_MAX_NBR (20)
#define YM_PACKET_RETRIES (10)

/* contants defined by YModem protocol */
#define YM_SOH (0x01) /* start of 128-byte data packet */
#define YM_STX (0x02) /* start of 1024-byte data packet */
#define YM_EOT (0x04) /* End Of Transmission */
#define YM_ACK (0x06) /* ACKnowledge, receive OK */
#define YM_NAK (0x15) /* Negative ACKnowledge, receiver ERROR, retry */
#define YM_CAN (0x18) /* two CAN in succession will abort transfer */
#define YM_CRC                                                                 \
  (0x43) /* 'C' == 0x43, request 16-bit CRC, use in place of first NAK for CRC \
            mode */
#define YM_ABT1 (0x41) /* 'A' == 0x41, assume try abort by user typing */
#define YM_ABT2 (0x61) /* 'a' == 0x61, assume try abort by user typing */

/* ------------------------------------------------ */

/* user callbacks, implement these for your target */
/* user function __ym_getchar() should return -1 in case of timeout */
void __ym_ungetchar (int32_t ch);
int32_t __ym_getchar (uint32_t timeout);
void __ym_putchar (int32_t c);
void __ym_sleep_ms (uint32_t delay);
void __ym_flush ();
void __ym_purge ();

/* ------------------------------------------------ */

static HANDLE hComms = NULL;
static int diagnose = 0;
static int timeout = 0;
static int small_mode = 0; /* send only 128 byte packets */
static int small_time = 0; /* milliseconds between chars */
static char file_name[FYMODEM_FILE_NAME_MAX_LENGTH];
static int last_status = 0;
static int last_expected = 0;
static int last_actual = 0;
static int cancel = 0;

/* ------------------------------------------------ */

#define bool int
#define false 0
#define true 1

void
__ym_sleep_ms (uint32_t delay)
{
  Sleep (delay);
}

void
__ym_flush ()
{
}

void
__ym_purge ()
{
  uint32_t ch;
  do
    {
      ch = __ym_getchar (1000);
    }
  while (ch != -1);
}

/* simple one character unget */
static int32_t __ym_ungotchar = -1;

void
__ym_ungetchar (int32_t ch)
{
  __ym_ungotchar = ch;
}

int
SendByte (HANDLE hComms, unsigned char byte)
{
  int n = 0;

  return (WriteFile (hComms, &byte, 1, (LPDWORD) ((void *)&n), NULL) && n > 0);
}

int
ReceiveByte (HANDLE hComms)
{
  unsigned char x;
  int n = 0;
  /*
     do {
        ReadFile(Cport[comport_number], &x, 1, (LPDWORD)((void *)&n), NULL);
     } while (n == 0);
     return x;
  */

  if (ReadFile (hComms, &x, 1, (LPDWORD) ((void *)&n), NULL) && (n > 0))
    {
#if DIAGNOSTICS
      printf ("read FD %d : %02x\n", Cport[comport_number], x);
#endif
      return x;
    }
  else
    {
      return -1;
    }
}

int
ByteReady (HANDLE hComms)
{
  int status;
  COMSTAT comstat;

  return ClearCommError (hComms, (LPDWORD) ((void *)&status),
                         (LPCOMSTAT) ((void *)&comstat))
         && (comstat.cbInQue != 0);
}

int32_t
__ym_getchar (uint32_t timeout)
{
  int32_t ch;
  if ((ch = __ym_ungotchar) >= 0)
    {
      __ym_ungotchar = -1;
      return ch;
    }
  else
    {
      /* msec timeout */
      uint32_t count;
      uint8_t byte;
      count = timeout / 100; /* check every 10 ms */
      while (count > 0)
        {
          if (ByteReady (hComms))
            break;
          __ym_sleep_ms (100);
          count--;
        }
      if (ByteReady (hComms))
        {
          byte = ReceiveByte (hComms);
          if (diagnose > 1)
            {
              fprintf (stderr, "%02X ", byte);
            }
          return byte;
        }
      else
        {
          return -1;
        }
    }
}

void
__ym_putchar (int32_t c) {
  SendByte (hComms, c);
  if (diagnose > 1) {
      fprintf (stderr, "<%02X ", c);
   }
  if (small_mode) {
      __ym_sleep_ms (small_time);
  }
}

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
 * @return The length of the file received, or 0 on error
 */
int32_t _fymodem_receive(FILE **file,
                        char *filename,
                        uint32_t timeout)
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
               if (nbr_restarts >= YM_PACKET_RESTART_MAX_NBR) {
                 /* very likely sender has not been started! */
                  fprintf(stderr, "Too many errors (%d) - abort\n", nbr_restarts);
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
               fprintf(stderr, "Too many errors (%d) - abort\n", nbr_errors);
               goto rx_err_handler;
            }
            __ym_purge();
            __ym_putchar(YM_NAK);
            break;
         } /* default */
         } /* switch */

         /* check end of receive packets */
      } while (!file_done && !cancel);

      /* check end of receive files */
   } while (!session_done && !cancel);

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
   while ((tx_left > 0) && !cancel) {
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
               } while ((c > 0) && !cancel);
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
   } while ((ch != YM_ACK) && (ch != -1) && !cancel);

   return tx_sent;
}

/* ------------------------------------------------------- */

int fymodem_small(uint32_t mode, uint32_t time) {
   small_mode = mode;
   small_time = time;
   last_status = 0;
   return 0;
}

int fymodem_abort() {
   cancel = 1;
   __ym_sleep_ms (YM_PACKET_RX_TIMEOUT_MS);
   __ym_putchar(YM_CAN);
   __ym_putchar(YM_CAN);
   __ym_putchar('\n');
   last_status = -2;
   return 0;
}

/* ------------------------------------------------------- */

int32_t _fymodem_send(FILE *file,
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
   } while ((ch < 0) && !cancel);

   /* we do require transfer with CRC */
   if (ch != YM_CRC) {
      if (diagnose) {
         fprintf(stderr, "Expected CRC\n");
         if (diagnose > 1) {
            /* print what we actually received */
            do {
               fprintf(stderr, "%02X ", ch);
               ch = __ym_getchar(timeout);
            } while ((ch > 0) && !cancel);
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
   } while (!file_done && !cancel);

   /* temporary - terminate session */
   if (diagnose) {
      fprintf(stderr, "Terminating session\n");
   }
   do {
      // send empty filename packet to terminate session */
      ym_send_packet0(0, 0);
      ch = __ym_getchar(timeout);
   } while ((ch != YM_ACK) && (ch != -1) && !cancel);

   return tx_done;

tx_err_handler:
   __ym_putchar(YM_CAN);
   __ym_putchar(YM_CAN);
   __ym_sleep_ms(YM_PACKET_SLEEP_TIMEOUT_MS);
   return 0;
}

/* setup comms port, mode (128 or 1024 byte blocks) and character delay time */
int fymodem_comms(HANDLE comms_handle, int mode, int time) {
   hComms = comms_handle;
   small_mode = mode;
   small_time = time;
   last_status = 0;
   return 0;
}

/* setup file name and timeout */
int fymodem_file(const char *file, int time) {
   strncpy(file_name, file, FYMODEM_FILE_NAME_MAX_LENGTH);
   timeout = time;
   last_status = 0;
   return 0;
}

/* receive file over ymodem */
int
fymodem_receive() {
   FILE *file = NULL;
   int32_t st = 0;

   cancel = 0;
   if (strlen(file_name) != 0) {
      if ((file = fopen (file_name, "wb")) == NULL) {
         if (diagnose) {
            fprintf (stderr, "\nCannot open file '%s' for write\n", file_name);
         }
         last_status = -1;
         return -1;
      }
   }
   if ((strlen(file_name) == 0) || (file != 0)) {
      st = _fymodem_receive (&file, file_name, timeout);
      last_actual = st;
   }
   if (diagnose && (st == 0)) {
      fprintf (stderr, "error: receive incomplete");
   }
   if (file != NULL) {
      fclose (file);
   }
   last_status = st;
   return st;
};

/* send file over ymodem */
int
fymodem_send() {
   FILE *file = NULL;
   int32_t st;
   long size;

   cancel = 0;
   if ((file = fopen(file_name, "rb")) != NULL) {
      fseek(file, 0L, SEEK_END);
      size = ftell (file);
      last_expected = size;
      if (diagnose) {
         fprintf(stderr, "\nFile '%s' size = %ld\n", file_name, size);
      }
      fseek(file, 0L, SEEK_SET);
   }
   else {
      if (diagnose) {
         fprintf (stderr, "\nCannot open file for read\n");
      }
      last_status = -1;
      return -1;
   }
   st = _fymodem_send (file, size, file_name, timeout);
   last_actual = st;
   if (diagnose) {
      fprintf (stderr, "transmit result: %d\n", st);
   }
   if (diagnose && (st != size)) {
      fprintf (stderr, "error: transmit incomplete, expected %ld\n", size);
   }
   fclose (file);
   return st;
};

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
   return file_name;
}



