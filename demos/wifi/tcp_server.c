/*
 * Simple TCP server test program. 
 *
 * This program must run on a Propeller. Use it in conjunction with pc_client.c
 * running on a PC.  
 *
 * IMPORTANT: At least the SSID and PASSPHRASE (see config.h) will need to be 
 * configured before this program can be run successfuly. Also, the DEBUG 
 * and USER_PORT settings can be set in that file. The platform configuration
 * file may also need to be configured. See README.TXT for details.
 *
 * Since the Propeller WiFi module only listens on port 80 (for http requests)
 * this program listens for POST requests. When it gets one, it extracts the 
 * IP address and PORT from the message and does a CONNECT to the client, 
 * and also sends a message. Thereafter, it simply sends a message back
 * whenevr the client sends one.
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

#define IP_RETRIES    30            // retries to check we have IP addr

#define IP_RETRY_SECS 3             // seconds between checks we have IP addr

#define POLL_INTERVAL 200           // msecs between polling for events

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
   int msg_num = 1;
   int tcp_handle = 0;
   int http_handle = 0;
   int result = 0;

   _waitsec(1); // in case we are using the external VT100 terminal emulator

   print("WiFi TCP Server\n\n");

   // initialize the WiFi module
   result = wifi_AUTO(); line_feed;
   if (result == wifi_Success) {
      // put in AP mode (forces the WiFi module off any current network)
      result = wifi_SET("wifi-mode", "AP"); line_feed;
      if (result != wifi_Success) {
         debug_str("SET failed\n");
      }
      // now go back to STA+AP mode
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
                  print("IP Address = ");
                  print(ip_addr);
                  print("\n\n");
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

      // listen for HTTP requests ...
      debug_str("Listening for /prop\n");
      result = wifi_LISTEN(TKN_HTTP, "/prop", &http_handle); line_feed;
      if (result == wifi_Success) {
         print("Server listening on port 80\n");
         debug_str("LISTEN succeeded, handle = ");
         debug_dec(http_handle);
         debug_str("\n");
      }
      else {
         debug_str("LISTEN failed\n");
      }

      if (result == wifi_Success) {
         // poll for events
         debug_str("Polling for WiFi events ...\n");
         while (1) {
            char event;
            int handle;
            int value;
            char data[wifi_DATA_SIZE + 1];

            _waitms(POLL_INTERVAL);
            result = wifi_POLL(0, &event, &handle, &value); line_feed;
            if (result == wifi_Success) {
               // NOTE: we only really need to process 'P' & 'D' events - but
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
                     {
                        int data_rcvd = 0;
                        int data_left = value;
                        int this_size = 0;
                        while (data_left > 0) {
                           result = wifi_RECV(handle, wifi_DATA_SIZE, data, &this_size); 
                           line_feed;
                           if (result == wifi_Success) {
                              int i;
                              char client_IP[32];
                              int client_port;
                              i = isscanf(data, "%s %d", client_IP, &client_port);
                              if (i == 2) {
                                 debug_str("\nRequest to connect to ");
                                 debug_str("client IP = ");
                                 debug_str(client_IP);
                                 debug_str(", port = ");
                                 debug_dec(client_port);
                                 debug_str("\n\n");
                                 result = wifi_CONNECT(client_IP, client_port, &tcp_handle);
                                 if (result == wifi_Success) {
                                    debug_str("CONNECT ok, handle= ");
                                    debug_dec(tcp_handle);
                                    debug_str("\n");
                                    strcpy(data, "WELCOME\n");
                                    result = wifi_SEND(tcp_handle, strlen(data), data);
                                    if (result != wifi_Success) {
                                       debug_str("SEND failed, error = ");
                                       debug_dec(result);
                                       debug_char('\n');
                                    }
                                 }
                                 else {
                                    debug_str("CONNECT failed, error = ");
                                    debug_dec(result);
                                    debug_char('\n');
                                 }
                              }
                              else {
                                 debug_str("\nCannot decode request '");
                                 for (i = 0; i < this_size; i++) {
                                    debug_char(data[i]);
                                 }
                                 debug_str("'\n");
                              }
                           }
                           else {
                              debug_str("RECV failed, error = ");
                              debug_dec(result);
                              debug_char('\n');
                           }
                           data_left -= this_size;
                        }
                     }
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
                        char msg[wifi_DATA_SIZE + 1];
                        print("Rcvd: ");
                        while (data_left > 0) {
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
                           }
                           data_left -= this_size;
                        }
                        print("\n");

                        // send message back
                        isprintf(msg, 
                                 "Message %d from the TCP Server", 
                                 msg_num++);
                        result = wifi_SEND(tcp_handle, strlen(msg), msg);
                        if (result != wifi_Success) {
                           debug_str("\nSEND failed, error = ");
                           debug_dec(result);
                           debug_char('\n');
                        }
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
            else {
               debug_str("POLL failed\n");
            }
         }
      }
   }
   else {
      debug_str("Initialization failed\n");
   }
}

