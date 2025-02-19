#ifndef _SERIAL8__H
#define _SERIAL8__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton of 2 and 4 port serial drivers, except for the functions
 * 'newline' and 'strln' - in C programs, NL is usually used as the line 
 * terminator, not CR.
 *
 * If your program depends on the original behaviour, simply simply define
 * the symbol S8_NEWLINE_CR before including this file in your program. 
 *
 * Notes specific to this Multi Port implementation:
 *
 * If you do not need 8 serial ports, reducing S8_MAX_PORTS can reduce the 
 * Hub RAM requirments of this module. 
 *
 * There are two ways to use this driver - either by "autoinitializing" the
 * serial ports (which is the way the current 2 port and 4 port drivers work)
 * or by manually opening and closing the individual ports from C. For a port
 * to be autoinitialized it must have a port number less than S8_MAX_PORTS 
 * and also have pin numbers in the range 0 .. 63.
 *
 * The s_openport() and s_closeport() functions have been added so that
 * ports that are not "autoinitialized" (via the Catalina_platforms.inc and
 * Serial8.spin2 in the target/p2 directory) can be manually configured
 * instead (note that these functions deal with ports, not pins as the spin 
 * versions do), and the port number must still be less than S8_MAX_PORTS.
 *
 * The following is a comment from the original Spin driver:
 *
 * The smart pin uarts use a 16-bit value for baud timing which can limit low 
 * baud rates for some system frequencies -- beware of these limits when 
 * connecting to older devices.
 *
 *  Baud     20MHz    40MHz    80MHz    100MHz    200MHz    300MHz
 * ------    -----    -----    -----    ------    ------    ------
 *    300       No       No       No        No        No        No
 *    600      Yes       No       No        No        No        No
 *   1200      Yes      Yes       No        No        No        No
 *   2400      Yes      Yes      Yes       Yes        No        No
 *   4800      Yes      Yes      Yes       Yes       Yes       Yes
 *
 * If your program depends on the s_newline() and s_strln() generating a 
 * Carriage Return rather than a New Line, simply simply define the symbol 
 * S8_NEWLINE_CR before including this file in your program. 
 *
 */

#if !defined(__CATALINA_P2)
#error THE 8 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 2 
#endif

#define S8_MAX_PORTS 8 // may be up to 8 ports (i.e. 16 pins)

#define S8_FF SERIAL_FF

#define S8_CR SERIAL_CR

#define S8_NL SERIAL_NL

extern int s_rxflush(unsigned port);

extern int s_rxcheck(unsigned port);

extern int s_rxtime(unsigned port, unsigned ms);

extern int s_rxcount(unsigned port);

extern int s_rx(unsigned port);

extern int s_tx(unsigned port, char txbyte);

extern int s_txflush(unsigned port);

extern int s_txcheck(unsigned port);

extern int s_txcount(unsigned port);

extern void s_str(unsigned port, char *stringptr);

extern void s_decl(unsigned port, int value, int digits, int flag);

extern void s_hex(unsigned port, unsigned value, int digits);

extern void s_ihex(unsigned port, unsigned value, int digits);

extern void s_bin(unsigned port, unsigned value, int digits);

extern void s_ibin(unsigned port, unsigned value, int digits);

extern void s_padchar(unsigned port, unsigned count, char txbyte);

/*
 * There are two methods of initializing ports - they can be configured
 * in Catalina_platform.inc, which is the way the 2 Port and 4 Port serial
 * drivers work. If that case the ports will be configured and opened
 * automatically on startup, using a predefined tx and rx buffer of 64 
 * characters each for each port. Alternatively, the ports can be manually 
 * initialized from C by using the following function:
 */
extern void s_openport(unsigned port, unsigned baud, unsigned mode, 
                        unsigned rx_pin, char *rx_start, char *rx_end,
                        unsigned tx_pin, char *tx_start, char *tx_end);
/*
 * Ports can be closed using the following function. This can be used
 * on either auto initialized ports or manually initialized ports. 
 * However, if an auto initialized port is closed, the tx and rx buffers
 * it was using will be lost, and new buffers will have to be supplied
 * when it is re-opened.
 */
extern void s_closeport(unsigned port);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s_dec(port, value) s_decl(port,value,10,0)

#define s_decf(port, value, width) s_decl(port,value,width,1)

#define s_decx(port, value, width) s_decl(port,value,width,2)

#define s_putc(port, txbyte) tx(port,txbyte)

#ifdef S8_CR_NEWLINE
#define s_newline(port) s_tx(port, S8_CR) // use CR in newling & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S8_CR)
#else
#define s_newline(port) s_tx(port, S8_NL) // use NL in newline & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S8_NL)
#endif

#define s_cls(port) s_tx(port, S8_FF)

#define s_getc(port) s_rxcheck(port)

// define the s8_ names of the functions (for backward compatibility):

#define s8_rxflush(port) s_rxflush(port)
#define s8_rxcheck(port) s_rxcheck(port)
#define s8_rxtime(port, ms) s_rxtime(port, ms)
#define s8_rxcount(port) s_rxcount(port)
#define s8_rx(port) s_rx(port)
#define s8_tx(port, txbyte) s_tx(port, txbyte)
#define s8_txflush(port) s_txflush(port)
#define s8_txcheck(port) s_txcheck(port)
#define s8_txcount(port) s_txcount(port)
#define s8_str(port, stringptr) s_str(port, stringptr)
#define s8_decl(port, value, digits, flag) s_decl(port, value, digits, flag)
#define s8_hex(port, value, digits) s_hex(port, value, digits)
#define s8_ihex(port, value, digits) s_ihex(port, value, digits)
#define s8_bin(port, value, digits) s_bin(port, value, digits)
#define s8_ibin(port, value, digits) s_ibin(port, value, digits)
#define s8_padchar(port, value, txbyte) s_padchar(port, count, txbyte)

#endif // _SERIAL8__H
