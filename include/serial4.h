#ifndef _SERIAL4__H
#define _SERIAL4__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton "pcFullDuplexSerial4FC.spin", except for the functions
 * 'newline' and 'strln' - in C programs, NL is usually used as the line 
 * terminator, not CR.
 *
 * If your program depends on the original behaviour, simply simply define
 * the symbol S4_NEWLINE_CR before including this file in your program. 
 *
 * The "s4_" prefix could be removed if required - it is added to reduce the
 * possibility of these names clashing with other C names.
 *
 */

#if defined(__CATALINA_P2)
#error THE 4 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 1 
#endif

#define S4_FF 12

#define S4_CR 13

#define S4_NL 10

extern int s4_rxflush(unsigned port);

extern int s4_rxcheck(unsigned port);

extern int s4_rxtime(unsigned port, unsigned ms);

extern int s4_rxcount(unsigned port);

extern int s4_rx(unsigned port);

extern int s4_tx(unsigned port, char txbyte);

extern int s4_txflush(unsigned port);

extern int s4_txcheck(unsigned port);

extern int s4_txcount(unsigned port);

extern void s4_str(unsigned port, char *stringptr);

extern void s4_decl(unsigned port, int value, int digits, int flag);

extern void s4_hex(unsigned port, unsigned value, int digits);

extern void s4_ihex(unsigned port, unsigned value, int digits);

extern void s4_bin(unsigned port, unsigned value, int digits);

extern void s4_ibin(unsigned port, unsigned value, int digits);

extern void s4_padchar(unsigned port, unsigned count, char txbyte);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s4_dec(port, value) s4_decl(port,value,10,0)

#define s4_decf(port, value, width) s4_decl(port,value,width,1)

#define s4_decx(port, value, width) s4_decl(port,value,width,2)

#define s4_putc(port, txbyte) tx(port,txbyte)

#ifdef S4_CR_NEWLINE
#define s4_newline(port) s4_tx(port, S4_CR) // use CR in newling & strln
#define s4_strln(port, stringptr) s4_strterm(port, stringptr, S4_CR);
#else
#define s4_newline(port) s4_tx(port, S4_NL) // use NL in newline & strln
#define s4_strln(port, stringptr) s4_strterm(port, stringptr, S4_NL);
#endif

#define s4_cls(port) s4_char(port, S4_FF)

#define s4_getc(port) s4_rxcheck(port)

#endif // _SERIAL4__H
