#ifndef _SERIAL__H
#define _SERIAL__H

/*
 * This file is untended to make it possible to write programs that use
 * a serial I/O library without having to know which one is in use. 
 * It will determine that based on which of the following Catalina 
 * libraries have been linked with, and define the appropriate serial 
 * functions:
 *
 *   Option      Library       Notes
 *   =========   ===========   ================
 *   -ltty       libtty        Propeller 1 only
 *   -ltty256    libtty256     Propeller 1 only
 *   -lserial4   libserial4    Propeller 1 only
 *   -lserial2   libserial2    Propeller 2 only
 *   -lserial8   libserial8    Propeller 2 only
 *
 * If your program depends on the s_newline() and s_strln() generating a 
 * Carriage Return rather than a New Line, simply simply define the symbol 
 * SERIAL_NEWLINE_CR before including this file in your program. 
 */

#define SERIAL_FF 12
#define SERIAL_CR 13
#define SERIAL_NL 10

#if defined(__CATALINA_libtty) || defined(__CATALINA_libtty256)

// NOTE: s_rxcount and s_txcount are not supported by libtty or libtty256

#ifdef SERIAL_CR_NEWLINE
#ifndef TTY_NEWLINE_CR
#define TTY_NEWLINE_CR
#endif
#endif

#include <tty.h>

#elif defined (__CATALINA_libserial2)

#ifdef SERIAL_CR_NEWLINE
#ifndef S2_NEWLINE_CR
#define S2_NEWLINE_CR
#endif
#endif

#include <serial2.h>

#elif defined (__CATALINA_libserial4) || defined (__CATALINA_libserial4x)

#ifdef SERIAL_CR_NEWLINE
#ifndef S4_NEWLINE_CR
#define S4_NEWLINE_CR
#endif
#endif

#include <serial4.h>

#elif defined (__CATALINA_libserial8)

#ifdef SERIAL_CR_NEWLINE
#ifndef S8_NEWLINE_CR
#define S8_NEWLINE_CR
#endif
#endif

#include <serial8.h>

#else

// Cake needs the serial comms functions defined to compile Lua, 
// so we just do this (temporarily) ...
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

#endif

#endif // _SERIAL__H
