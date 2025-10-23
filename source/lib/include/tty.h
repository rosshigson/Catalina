#ifndef _TTY__H
#define _TTY__H

/*
 * These definitions are intended to replicate the definitions in the original
 * Spin implementaton "FullDuplexSerial4.spin", except for the functions
 * 's_newline()' and 's_strln()' - in C programs, New Line is usually used as 
 * the line terminator, not Carriage Return.
 *
 * If your program depends on the s_newline() and s_strln() generating a 
 * Carriage Return rather than a New Line, simply simply define the symbol 
 * TTY_NEWLINE_CR before including this file in your program. 
 *
 * NOTE: s_rxcoun()t and s_txcount() are not supported by libtty or libtty256
 *
 */

#if defined(__CATALINA_P2)
#error THE TTY AND TTY256 SERIAL FUNCTIONS REQUIRE A PROPELLER 1 
#endif

#define TTY_FF 12
#define TTY_CR 13
#define TTY_NL 10

extern int s_rxflush();

extern int s_rxcheck();

extern int s_rxtime(unsigned ms);

extern int s_rx();

extern int s_tx(char txbyte);

extern int s_txflush();

extern int s_txcheck();

extern void s_str(char *stringptr);

extern void s_strterm(char *stringptr, char term);

extern void s_decl(int value, int digits, int flag);

extern void s_hex(unsigned value, int digits);

extern void s_ihex(unsigned value, int digits);

extern void s_bin(unsigned value, int digits);

extern void s_ibin(unsigned value, int digits);

extern void s_padchar(unsigned count, char txbyte);

/*
 * The following are methods in the Spin version, but can be
 * implemented as '#defines' in C with the same result:
 */

#define s_dec(value) s_decl(value,10,0)

#define s_decf(value, width) s_decl(value,width,1)

#define s_decx(value, width) s_decl(value,width,2)

#define s_putc(txbyte) tx(txbyte)

#ifdef TTY_CR_NEWLINE
#define s_newline() s_tx(TTY_CR) // use CR in newling & strln
#define s_strln(stringptr) s_strterm(stringptr, TTY_CR)
#else
#define s_newline() s_tx(TTY_NL) // use NL in newline & strln
#define s_strln(stringptr) s_strterm(stringptr, TTY_NL)
#endif

#define s_cls() s_tx(TTY_FF)

#define s_getc() rxcheck()

// define the tty_ names of the functions (for backward compatibility):

#define tty_rxflush() s_rxflush()
#define tty_rxcheck() s_rxcheck()
#define tty_rxtime(ms) s_rxtime(ms)
#define tty_rx() s_rx()
#define tty_tx(txbyte) s_tx(txbyte)
#define tty_txflush() s_txflush()
#define tty_txcheck() s_txcheck()
#define tty_str(stringptr) s_str(stringptr)
#define tty_strln(stringptr) s_strln(stringptr)
#define tty_dec(value) s_dec(value)
#define tty_decl(value, digits, flag) s_decl(value, digits, flag)
#define tty_hex(value, digits) s_hex(value, digits)
#define tty_ihex(value, digits) s_ihex(value, digits)
#define tty_bin(value, digits) s_bin(value, digits)
#define tty_ibin(value, digits) s_ibin(value, digits)
#define tty_padchar(value, txbyte) s_padchar(value, txbyte)
#define tty_newline() s_newline();

#endif // _TTY__H
