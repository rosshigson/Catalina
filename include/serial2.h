#ifndef _SERIAL2__H
#define _SERIAL2__H

/*
 * If your program depends on the s_newline() and s_strln() generating a 
 * Carriage Return rather than a New Line, simply simply define the symbol 
 * S2_NEWLINE_CR before including this file in your program. 
 *
 */

#if !defined(__CATALINA_P2)
#error THE 2 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 2 
#endif

#define S2_FF 12

#define S2_CR 13

#define S2_NL 10

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

#ifdef S2_CR_NEWLINE
#define s_newline(port) s_tx(port, S2_CR) // use CR in newling & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S2_CR)
#else
#define s_newline(port) s_tx(port, S2_NL) // use NL in newline & strln
#define s_strln(port, stringptr) s_strterm(port, stringptr, S2_NL)
#endif

#define s_cls(port) s_tx(port, S2_FF)

#define s_getc(port) s_rxcheck(port)

// define the s2_ names of the functions (for backward compatibility):

#define s2_rxflush(port) s_rxflush(port)
#define s2_rxcheck(port) s_rxcheck(port)
#define s2_rxtime(port, ms) s_rxtime(port, ms)
#define s2_rxcount(port) s_rxcount(port)
#define s2_rx(port) s_rx(port)
#define s2_tx(port, txbyte) s_tx(port, txbyte)
#define s2_txflush(port) s_txflush(port)
#define s2_txcheck(port) s_txcheck(port)
#define s2_txcount(port) s_txcount(port)
#define s2_str(port, stringptr) s_str(port, stringptr)
#define s2_strln(port, stringptr) s_strln(port, stringptr)
#define s2_decl(port, value, digits, flag) s_decl(port, value, digits, flag)
#define s2_hex(port, value, digits) s_hex(port, value, digits)
#define s2_ihex(port, value, digits) s_ihex(port, value, digits)
#define s2_bin(port, value, digits) s_bin(port, value, digits)
#define s2_ibin(port, value, digits) s_ibin(port, value, digits)
#define s2_padchar(port, value, txbyte) s_padchar(port, value, txbyte)
#define s2_dec(port, value) s_dec(port,value)
#define s2_decf(port, value, width) s_decl(port,value,width,1)
#define s2_decx(port, value, width) s_decl(port,value,width,2)
#define s2_putc(port, txbyte) s_putc(port,txbyte)
#define s2_newline(port) s_newline(port)

#endif // _SERIAL2__H
