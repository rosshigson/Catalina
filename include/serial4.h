#ifndef _SERIAL4__H
#define _SERIAL4__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton "pcFullDuplexSerial4FC.spin", except for the functions
 * 'newline' and 'strln' - in C programs, NL is usually used as the line 
 * terminator, not CR.
 *
 * If your program depends on the s_newline() and s_strln() generating a 
 * Carriage Return rather than a New Line, simply simply define the symbol 
 * S4_NEWLINE_CR before including this file in your program. 
 *
 */

#if defined(__CATALINA_P2)
#error THE 4 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 1 
#endif

#define S4_FF 12

#define S4_CR 13

#define S4_NL 10

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

extern void s_strterm(unsigned port, char *stringptr, char term);

extern void s_decl(unsigned port, int value, int digits, int flag);

extern void s_hex(unsigned port, unsigned value, int digits);

extern void s_ihex(unsigned port, unsigned value, int digits);

extern void s_bin(unsigned port, unsigned value, int digits);

extern void s_ibin(unsigned port, unsigned value, int digits);

extern void s_padchar(unsigned port, unsigned count, char txbyte);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s_dec(port, value) s_decl(port,value,10,0)

#define s_decf(port, value, width) s_decl(port,value,width,1)

#define s_decx(port, value, width) s_decl(port,value,width,2)

#define s_putc(port, txbyte) s_tx(port,txbyte)

#ifdef S4_CR_NEWLINE
#define s_newline(port) s_tx(port, S4_CR) // use CR in newling & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S4_CR)
#else
#define s_newline(port) s_tx(port, S4_NL) // use NL in newline & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S4_NL)
#endif

#define s_cls(port) s_tx(port, S4_FF)

#define s_getc(port) s_rxcheck(port)

// define the s4_ names of the functions (for backward compatibility):

#define s4_rxflush(port) s_rxflush(port)
#define s4_rxcheck(port) s_rxcheck(port)
#define s4_rxtime(port, ms) s_rxtime(port, ms)
#define s4_rxcount(port) s_rxcount(port)
#define s4_rx(port) s_rx(port)
#define s4_tx(port, txbyte) s_tx(port, txbyte)
#define s4_txflush(port) s_txflush(port)
#define s4_txcheck(port) s_txcheck(port)
#define s4_txcount(port) s_txcount(port)
#define s4_str(port, stringptr) s_str(port, stringptr)
#define s4_strln(port, stringptr) s_strln(port, stringptr)
#define s4_decl(port, value, digits, flag) s_decl(port, value, digits, flag)
#define s4_hex(port, value, digits) s_hex(port, value, digits)
#define s4_ihex(port, value, digits) s_ihex(port, value, digits)
#define s4_bin(port, value, digits) s_bin(port, value, digits)
#define s4_ibin(port, value, digits) s_ibin(port, value, digits)
#define s4_padchar(port, value, txbyte) s_padchar(port, value, txbyte)
#define s4_dec(port, value) s_dec(port,value)
#define s4_decf(port, value, width) s_decl(port,value,width,1)
#define s4_decx(port, value, width) s_decl(port,value,width,2)
#define s4_putc(port, txbyte) s_putc(port,txbyte)
#define s4_newline(port) s_newline(port)

#endif // _SERIAL4__H
