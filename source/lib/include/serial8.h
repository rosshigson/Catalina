#ifndef _SERIALX__H
#define _SERIALX__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton of 2 and 4 port serial drivers, except for the functions
 * 'newline' and 'strln' - in C programs, NL is usually used as the line 
 * terminator, not CR.
 *
 * If your program depends on the original behaviour, simply simply define
 * the symbol S8_NEWLINE_CR before including this file in your program. 
 *
 * The "s8_" prefix could be removed if required - it is added to reduce the
 * possibility of these names clashing with other C names.
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
 * The s8_openport() and s8_closeport() functions have been added so that
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
 */

#if !defined(__CATALINA_P2)
#error THE 8 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 2 
#endif

#define S8_MAX_PORTS 8 // may be up to 8 ports (i.e. 16 pins)

#define S8_FF 12

#define S8_CR 13

#define S8_NL 10

extern int s8_rxflush(unsigned port);

extern int s8_rxcheck(unsigned port);

extern int s8_rxtime(unsigned port, unsigned ms);

extern int s8_rxcount(unsigned port);

extern int s8_rx(unsigned port);

extern int s8_tx(unsigned port, char txbyte);

extern int s8_txflush(unsigned port);

extern int s8_txcheck(unsigned port);

extern int s8_txcount(unsigned port);

extern void s8_str(unsigned port, char *stringptr);

extern void s8_decl(unsigned port, int value, int digits, int flag);

extern void s8_hex(unsigned port, unsigned value, int digits);

extern void s8_ihex(unsigned port, unsigned value, int digits);

extern void s8_bin(unsigned port, unsigned value, int digits);

extern void s8_ibin(unsigned port, unsigned value, int digits);

extern void s8_padchar(unsigned port, unsigned count, char txbyte);

/*
 * There are two methods of initializing ports - they can be configured
 * in Catalina_platform.inc, which is the way the 2 Port and 4 Port serial
 * drivers work. If that case the ports will be configured and opened
 * automatically on startup, using a predefined tx and rx buffer of 64 
 * characters each for each port. Alternatively, the ports can be manually 
 * initialized from C by using the following function:
 */
extern void s8_openport(unsigned port, unsigned baud, unsigned mode, 
                        unsigned rx_pin, char *rx_start, char *rx_end,
                        unsigned tx_pin, char *tx_start, char *tx_end);
/*
 * Ports can be closed using the following function. This can be used
 * on either auto initialized ports or manually initialized ports. 
 * However, if an auto initialized port is closed, the tx and rx buffers
 * it was using will be lost, and new buffers will have to be supplied
 * when it is re-opened.
 */
extern void s8_closeport(unsigned port);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s8_dec(port, value) s8_decl(port,value,10,0)

#define s8_decf(port, value, width) s8_decl(port,value,width,1)

#define s8_decx(port, value, width) s8_decl(port,value,width,2)

#define s8_putc(port, txbyte) tx(port,txbyte)

#ifdef S8_CR_NEWLINE
#define s8_newline(port) s8_tx(port, S8_CR) // use CR in newling & strln
#define s8_strln(port, stringptr) s8_strterm(port, stringptr, S8_CR);
#else
#define s8_newline(port) s8_tx(port, S8_NL) // use NL in newline & strln
#define s8_strln(port, stringptr) s8_strterm(port, stringptr, S8_NL);
#endif

#define s8_cls(port) s8_char(port, S8_FF)

#define s8_getc(port) s8_rxcheck(port)

#endif // _SERIALX__H
