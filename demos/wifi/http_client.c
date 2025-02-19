/*
 * Simple HTTP Client program. 
 *
 * This program must run on a Propeller. Use it in conjunction with an instance
 * of http_server.c running on another Propeller.
 *
 * IMPORTANT: At least the SSID and PASSPHRASE (see config.h) will need to
 * be configured before this program can be run successfuly. Also, the DEBUG 
 * and USER_PORT settings can be set in that file. The platform configuration
 * file may also need to be configured. See README.TXT for details. Finally,
 * the SERVER_IP (see below) IP address needt to be set.
 *
 * This program uses SEND to send a HTTP GET to the SERVER_IP address 
 * at port 80 and then uses RECV to read data sent in response. Note that
 * it does not attempt to decode the response (which will be a html web 
 * page) - it simply displays the raw data it receives.
 *
 */

#ifndef __CATALINA__
#error This program must be compiled with Catalina
#endif

#include <prop.h>
#include <stdint.h>
#include <string.h>
#include <serial.h>

#ifdef __CATALINA_libwifi
#include <wifi.h>                   // use global header
#else
#include "wifi.h"                   // use local header
#endif

// network and general configuration:

#include "config.h"

#define SERVER_IP         "xxx.xxx.xxx.xxx" // IP address of Server

#define IP_RETRIES        30          // retries to check we have IP addr

#define IP_RETRY_SECS     3           // seconds between checks we have IP addr

#define POLL_INTERVAL     200         // msecs between polling for events

// Propeller 1 specific configuration

#ifndef __CATALINA_P2

// pin functions - these are required on the Propeller 1 only, because
// on the Propeller 2 we have direct access to the PASM in the platform
// configuration files, where the pins are defined. but we do not have 
// that on the Propeller 1. If the pin is not connected, these functions 
// should return -1:

int wifi_DO_PIN() {
   return 31;
}

int wifi_DI_PIN() {
   return 30;
}

int wifi_PGM_PIN() {
   return -1; // if not used, return -1
}

int wifi_RES_PIN() {
   return -1; // if not used, return -1
}

int wifi_BRK_PIN() {
   return -1; // if not used, return -1
}

#endif

// print a string to USER_PORT
void print(char *str) {
  s_str(USER_PORT, str);
}

// print a char to USER_PORT
void printch(char ch) {
  s_tx(USER_PORT, ch);
}

void main() {
   char buff[wifi_DATA_SIZE + 1] = "";
   int tcp_handle = 0;
   int listen = 0;
   int result = 0;

   _waitsec(1); // in case we are using the external VT100 terminal emulator

   print("\nWiFi HTTP Client\n\n");

   // initialize the WiFi module
   result = wifi_AUTO(); line_feed;
   if (result == wifi_Success) {
      // put in AP mode (forces the WiFi module off any current network)
      result = wifi_SET("wifi-mode", "AP"); line_feed;
      if (result != wifi_Success) {
         debug_str("SET failed\n");
      }
      // now go back to STA+AP mode (can use STA, but STA+AP is convenient)
      result = wifi_SET("wifi-mode", "STA+AP"); line_feed;
      if (result != wifi_Success) {
         debug_str("SET failed\n");
      }

      // join the WiFi network
      print("Joining ");
      print(SSID);
      print(" ... ");
      result = wifi_JOIN(SSID, PASSPHRASE); line_feed;
      if (result == wifi_Success) {
         int retries = 0;
         char ip_addr[32];
         while (retries < IP_RETRIES) {
            result = wifi_CHECK("station-ipaddr", ip_addr); line_feed;
            if (result == wifi_Success) {
               if (strcmp(ip_addr, "0.0.0.0") != 0) {
                  print("done.\n");
                  debug_str("Got an IP address\n");
                  print("\n");
                  break;
               }
            }
            else {
               debug_str("CHECK failed\n");
            }
            _waitsec(IP_RETRY_SECS);
         }
         if (retries == IP_RETRIES) {
             debug_str("Failed to get a valid IP address\n");
         }
      }
      else {
         debug_str("JOIN failed\n");
      }

      // connect to HTTP Server      
      print("Connecting to HTTP Server " SERVER_IP " on port 80\n\n");
      while (tcp_handle < 5) {

         // TCP connect - must use port 80 ...
         result = wifi_CONNECT(SERVER_IP, 80, &tcp_handle);
         line_feed;
         if (result == wifi_Success) {
            debug_str("CONNECT succeeded, handle = ");
            debug_dec(tcp_handle);
            debug_char('\n');
         }
         else {
            tcp_handle = 0;
            debug_str("CONNECT failed, error = ");
            debug_dec(result);
            debug_char('\n');
         }
      }

      while (1) {

         // send GET ...
         isprintf(buff,
                 "GET /prop HTTP/1.1\r\n"
                 "Host: %s \r\n"
                 "\r\n", 
                 SERVER_IP);

         result = wifi_SEND(tcp_handle, strlen(buff), buff);
         line_feed;

         if (result == wifi_Success) {
            // poll for response
            int done = 0;
            while (!done) {
               char event;
               int handle;
               int value;
               char data[wifi_DATA_SIZE + 1];
   
               _waitms(POLL_INTERVAL);
               result = wifi_POLL(0, &event, &handle, &value); line_feed;
               if (result == wifi_Success) {
                  // NOTE: we only really need to process 'D' events - but
                  // we print the others for debugging purposes
                  switch (event) {
                     case 'G':
                        debug_str("GET: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        break;
                     case 'P':
                        debug_str("POST: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        break;
                     case 'W':
                        debug_str("WS: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        break;
                     case 'D':
                        debug_str("DATA: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        {
                           int data_rcvd = 0;
                           int data_left = value;
                           int this_size = 0;
                           print("Rcvd: ");
                           while (!done && (data_left > 0)) {
                              int max = value;
                              if (max > wifi_DATA_SIZE) {
                                 max = wifi_DATA_SIZE;
                              }
                              result = wifi_RECV(tcp_handle, max, data, &this_size); 
                              line_feed;
                              if (result == wifi_Success) {
                                 int i;
                                 for (i = 0; i < this_size; i++) {
                                    printch(data[i]);
                                 }
                              }
                              else {
                                 debug_str("\nRECV failed, error = ");
                                 debug_dec(result);
                                 debug_char('\n');
                                 done = 1;
                              }
                              data_left -= this_size;
                           }
                           print("\n");
                           done = 1;
                        }
                        break;
                     case 'S':
                        debug_str("REPLY/SEND COMPLETE: ");
                        debug_dec(handle);
                        debug_char('\n');
                        break;
                     case 'X':
                        debug_str("DISCONNECT: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        break;
                     case 'E':
                        debug_str("ERROR: ");
                        debug_dec(handle);
                        debug_char(' ');
                        debug_dec(value);
                        debug_char('\n');
                        break;
                     case 'N':
                        break;
                     default:
                        debug_str("Unknown event '");
                        debug_char(event);
                        debug_str("'\n");
                        break;
                  }
               }
            }
         }
         else {
            debug_str("SEND failed\n");
         }
      }
   }
   else {
      debug_str("Initialization failed\n");
   }

}
   
