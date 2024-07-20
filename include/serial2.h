#ifndef _SERIAL2__H
#define _SERIAL2__H

/*
 * The "s2_" prefix could be removed if required - it is added to reduce the
 * possibility of these names clashing with other C names.
 *
 */

#if !defined(__CATALINA_P2)
#error THE 2 PORT SERIAL FUNCTIONS REQUIRE A PROPELLER 2 
#endif

#define S2_FF 12

#define S2_CR 13

#define S2_NL 10

extern int s2_rxflush(unsigned port);

extern int s2_rxcheck(unsigned port);

extern int s2_rxtime(unsigned port, unsigned ms);

extern int s2_rxcount(unsigned port);

extern int s2_rx(unsigned port);

extern int s2_tx(unsigned port, char txbyte);

extern int s2_txflush(unsigned port);

extern int s2_txcheck(unsigned port);

extern int s2_txcount(unsigned port);

extern void s2_str(unsigned port, char *stringptr);

extern void s2_decl(unsigned port, int value, int digits, int flag);

extern void s2_hex(unsigned port, unsigned value, int digits);

extern void s2_ihex(unsigned port, unsigned value, int digits);

extern void s2_bin(unsigned port, unsigned value, int digits);

extern void s2_ibin(unsigned port, unsigned value, int digits);

extern void s2_padchar(unsigned port, unsigned count, char txbyte);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s2_dec(port, value) s2_decl(port,value,10,0)

#define s2_decf(port, value, width) s2_decl(port,value,width,1)

#define s2_decx(port, value, width) s2_decl(port,value,width,2)

#define s2_putc(port, txbyte) tx(port,txbyte)

#ifdef S2_CR_NEWLINE
#define s2_newline(port) s2_tx(port, S2_CR) // use CR in newling & strln
#define s2_strln(port, stringptr) s2_strterm(port, stringptr, S2_CR);
#else
#define s2_newline(port) s2_tx(port, S2_NL) // use NL in newline & strln
#define s2_strln(port, stringptr) s2_strterm(port, stringptr, S2_NL);
#endif

#define s2_cls(port) s2_char(port, S2_FF)

#define s2_getc(port) s2_rxcheck(port)

#endif // _SERIAL2__H
