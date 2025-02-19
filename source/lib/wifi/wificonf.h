#ifndef _WIFICONF__H
#define _WIFICONF__H

#include <prop.h>
#include <prop2.h>
#include <stdint.h>
#include <string.h>
#include <serial.h>
#include <wifi.h>

// general configuration

#define CMD_TIMEOUT   1000     // msecs to wait for a normal command response
#define CONN_TIMEOUT  1000000  // msecs to wait for a CONNECT tesponse
#define CMD_MAXSIZE   256      // maxmium size of commands sent
#define WIFI_DEBUG    0        // 1 to enable debugging, 2 for more debugging

// WiFi Command characters:

#define CMD_BEGIN    0xFE
#define CMD_END      '\r'

// WiFi Response characters:

#define RSP_BEGIN    0xFE
#define RSP_END      '\r'

// This package is designed to work with either the 2, 4 port or 8 port 
// serial plugin and library - the user port (port 1) can be used for 
// user interaction and debug messages, and the other port (port 0) 
// is used as the WiFi serial port. The port configuration in the
// file 'Extras.spin' on the Propeller 1, or the platform configuration
// file on the Propeller 2 (e.g. P2CUSTOM.inc etc) must be set accordingly.

#define WIFI_PORT  0
#define USER_PORT  1

extern int wifi_init;

#endif
