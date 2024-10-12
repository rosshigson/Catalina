#ifndef _ALOHA_H
#define _ALOHA_H 1

/*
 * ALOHA - A protocol for Catalina client/server support
 * 
 * The server never initiates a transaction. The client initiates every
 * transaction by sending a packet:
 *
 *   FF 02 id sq lo hi b1 .. bn ck
 *
 * Where:
 *
 *   id        is a service id
 *   sq        is a sequence number (to detect repeats)
 *   lo and hi are the length of data - i.e. (hi<<8)+lo
 *   b1 .. bn  are the bytes of data (may contain zeroes)
 *   ck        is the checksum of packet (excluding initial FF 02)
 * 
 * The server should respond with a success packet:
 *
 *    FF 02 id sq lo hi b1 .. bn ck
 *
 * Or a failure packet. Suggested failure packets are:
 *
 *    FF 01    <- timeout on tx
 *    FF 03    <- checksum error on tx
 *    FF 04    <- no such id
 *    FF 05    <- other error
 *
 * Notes:
 *
 * 1.  Any occurrence of FF other than the initial FF is "byte stuffed" 
 *     to FF 00. This means that FF 02 can never occur in the message, 
 *     and so always signals the start of a packet.
 *
 * 2.  The ck is set so that the sum of all the bytes after the FF 02 
 *     equals zero (modulo 0x100).
 *
 * 3.  The sq is not checked by the server - it is just returned in the 
 *     response. It is up to the client to verify the response packet has 
 *     the correct sq, increment it, and identify duplicate packets.
 *
 */

#define DEBUG_ALOHA 0          // 1 to enable debugging
 
#if defined(__CATALINA_libserial8)

#include <serial8.h>
#define serial_tx s8_tx
#define serial_rx s8_rx
#define serial_rxtime s8_rxtime

#elif defined(__CATALINA_libserial2)

#include <serial2.h>
#define serial_tx s2_tx
#define serial_rx s2_rx
#define serial_rxtime s2_rxtime

#else

#error aloha requires a serial plugin (-lserial2 or -lserial8)

#endif

/*
 * aloha_tx : Transmit an ALOHA packet. 
 *            No return value
 */
void aloha_tx(int port, int id, int sq, int len, char *buf);

/*
 * aloha_rx : Receive an ALOHA packet. 
 *            Returns:
 *              0 : success (success packet received)
 *             -1 : timeout on rx
 *             -2 : packet larger than max
 *             -3 : checksum error on rx
 *              n : failure packet n received (n != 2)
 */
int aloha_rx(int port, int *id, int *sq, int *len, char *buf, int max, int ms);

#endif // _ALOHA_H
