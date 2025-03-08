/*
 * This file contains configuration information common to all the WiFi demo 
 * programs. There may be additional configuration parameters in each program.
 */

#ifndef __CONFIG_H
#define __CONFIG_H 1

// network configuration

#define SSID          "Bhundoo"      // network name
#define PASSPHRASE    "ClydeRiverRetreat"  // network password

// general configuration

#define USER_PORT     1        // port to use for user interation
                               // (set to 1 if two ports are available)

#define DEBUG         0        // set to 1 to print debug messages to USER_PORT


#if DEBUG

// define real debug functions ...

#define debug_str(str) s_str(USER_PORT, str)
#define debug_dec(dec) s_dec(USER_PORT, dec) 
#define debug_hex(hex, digits) s_hex(USER_PORT, hex, digits) 
#define debug_char(ch) s_tx(USER_PORT, ch) 

static void debug_print(char *str1, char *str2) {
   debug_str("DEBUG: ");
   debug_str(str1);
   if (strlen(str2) > 0) {
      debug_str(" \"");
      debug_str(str2);
      debug_str("\"");
   }
   debug_char('\n');
}

#else

// define null debug functions ...

#define debug_str(str) 
#define debug_dec(dec)
#define debug_hex(hex, digits)
#define debug_char(ch)
#define debug_print(str1, str2)

#endif

#if USER_PORT == 0

// if we are sending WiFi comamnds and user messages to the same port
// then after each WiFi command (which is terminated by a CR only) we
// need to also send an LF to some terminal emulators to be able to see 
// the output. Also, if using payload's internal terminal emulator,
// add the -q1 option to ignore the CR ...

#define line_feed // s_tx(USER_PORT,'\n')

#else

// don't send line feeds ...

#define line_feed

#endif

#endif

