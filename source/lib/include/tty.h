#ifndef _TTY__H
#define _TTY__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton "FullDuplexSerial4.spin", except for the functions
 * 'newline' and 'strln' - in C programs, NL is usually used as the line 
 * terminator, not CR.
 *
 * If your program depends on the original behaviour, simply simply define
 * the symbol TTY_NEWLINE_CR before including this file in your program. 
 *
 * The "TTY_" prefix could be removed if required - it is added to reduce the
 * possibility of these names clashing with other C names.
 *
 */

#if defined(__CATALINA_P2)
#error THE TTY AND TTY256 SERIAL FUNCTIONS REQUIRE A PROPELLER 1 
#endif

#define TTY_FF 12

#define TTY_CR 13

#define TTY_NL 10

extern int tty_rxflush();

extern int tty_rxcheck();

extern int tty_rxtime(unsigned ms);

extern int tty_rx();

extern int tty_tx(char txbyte);

extern int tty_txflush();

extern int tty_txcheck();

extern void tty_str(char *stringptr);

extern void tty_decl(int value, int digits, int flag);

extern void tty_hex(unsigned value, int digits);

extern void tty_ihex(unsigned value, int digits);

extern void tty_bin(unsigned value, int digits);

extern void tty_ibin(unsigned value, int digits);

extern void tty_padchar(unsigned count, char txbyte);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define tty_dec(value) tty_decl(value,10,0)

#define tty_decf(value, width) tty_decl(value,width,1)

#define tty_decx(value, width) tty_decl(value,width,2)

#define tty_putc(txbyte) tx(txbyte)

#ifdef TTY_CR_NEWLINE
#define tty_newline() tty_tx(TTY_CR) // use CR in newling & strln
#define tty_strln(stringptr) tty_strterm(stringptr, TTY_CR);
#else
#define tty_newline() tty_tx(TTY_NL) // use NL in newline & strln
#define tty_strln(stringptr) tty_strterm(stringptr, TTY_NL);
#endif

#define tty_cls() tty_char(TTY_FF)

#define tty_getc() rxcheck()

#endif // _TTY__H
