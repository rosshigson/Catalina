/*
 * Simple WebSocket Client program. 
 *
 * This program must run on a Propeller. Use it in conjunction with an
 * instance of ws_server.c running on a Propeller.
 *
 * IMPORTANT: At least the SSID and PASSPHRASE (see config.h) will need to be 
 * configured before this program can be run successfuly. Also, the DEBUG 
 * and USER_PORT settings can be set in that file. The platform configuration
 * file may also need to be configured. See README.TXT for details. Finally,
 * the SERVER_IP (see below) IP address will need to be set.
 *
 * This program is a TCP program - it uses SEND to send a GET request to the 
 * SERVER_IP address on port 80, and thereafter explicitly encodes and decodes
 * WebSocket frames (non-fragmented text frames only).
 *
 * Note that this program does not close its WebSockets gracefully, so the 
 * server may run out of connections.
 *
 * Note that the Websockets Key (WS_KEY) and Mask (WS_MASK) used in this 
 * program are for demo purpose only - in a real application they should be 
 * randomly generated according to the WebSockets specification.
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

#define POLL_INTERVAL     250         // msecs between polling for events

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

// ws_encode_str - encode a string into the buffer, adding the necessary 
//                 websocket frame. The string must be null terminated.
//                 This function only supports encoding up to 65535 bytes. 
//                 Returns the length of the result, which must fit into buff, 
//                 or -1 on any error.
//
// TBD - send multiple frames if data > SOME_MAX_DATA_CONSTANT
//
int ws_encode_str(uint8_t *buff, char *str, uint32_t mask) {
   int len;
   int i;
   uint8_t m[4];
   int c = 0;

   len = strlen(str);
   m[0] = mask>>24 & 0xFF;
   m[1] = mask>>16 & 0xFF;
   m[2] = mask>>8  & 0xFF;
   m[3] = mask     & 0xFF;

   if (len > 65535) {
      return -1; // we don't handle frames that large
   }
   else if (len > 126) {
     buff[0] = 0x81; // FIN + TXT
     buff[1] = 126;
     buff[2] = ((len>>8) & 0xFF) | 0x80; // MASK
     buff[3] = len & 0xFF;
     for (i = 0; i < 4; i++) {
        buff[i+4] = m[i];
     }
     for (i = 0; i < len; i++) {
        buff[i+8] = str[i] ^ m[c];
        c = (c+1) % 4;
     }
     return len+8;
   }
   else {
     buff[0] = 0x81; // FIN + TEXT
     buff[1] = len | 0x80; // MASK
     memcpy(&buff[2], str, len);
     for (i = 0; i < 4; i++) {
        buff[i+2] = m[i];
     }
     for (i = 0; i < len; i++) {
        buff[i+6] = str[i] ^ m[c];
        c = (c+1) % 4;
     }
     return len+6;
   }
}

// decode string data - if the data is masked, then the buffer is unmasked.
//                      Returns a pointer to the null terminated string, or
//                      NULL on any error.
//
char *ws_decode_str(uint8_t *buff) {
   uint8_t *data = NULL;
   int len = 0;
   int masked = 0;
   int c = 0;
   int i;
   uint8_t m[4] = {0, 0, 0, 0};

   if (buff[0] != 0x81) { // FIN + TXT
      return NULL; // not a WebSockets text frame?
   }
   if ((buff[1] & 0x7F) == 127) {
      return NULL; // we don't handle frames this large
   }
   else if ((buff[1] & 0x7F) == 126) {
      len = ((buff[2] << 8) & 0x7F) + buff[3];
      if (buff[1] & 0x80) {
         masked = 1;
         for (i = 0; i < 4; i++) {
            m[i] = buff[i+4];
         }
         data = &buff[8];
      }
      else {
         data = &buff[4];
      }
   }
   else {
      len = buff[1] & 0x7F;
      if (buff[1] & 0x80) {
         masked = 1;
         for (i = 0; i < 4; i++) {
            m[i] = buff[i+2];
         }
         data = &buff[6];
      }
      else {
         data = &buff[2];
      }
   }
   data[len] = 0;
   if (masked) {
     uint8_t *mdata = data;
     for (i = 0; i < len; i++) {
        mdata[i] = data[i] ^ m[c];
        c = (c+1) % 4;
     }
   }
   return (char *)data;
}

// print a string to USER_PORT
void print(char *str) {
  s_str(USER_PORT, str);
}

// print a char to USER_PORT
void printch(char ch) {
  s_tx(USER_PORT, ch);
}

// These are for demo purposes only ...
static uint32_t WS_MASK  = 0xDEADBEEF;
static char     WS_KEY[] = "6OmI3aQmM/GgQ6G+wM6n+A==";

void main() {
   char buff[wifi_DATA_SIZE + 1] = "";
   int msg_num = 1;
   int tcp_handle = 0;
   int listen = 0;
   int result = 0;
   int established = 0;

   _waitsec(1); // in case we are using the external VT100 terminal emulator

   print("\nWiFi WebSockets Client\n\n");

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
                  debug_str("Got IP address ");
                  debug_str(ip_addr);
                  debug_char('\n');
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

      // do a TCP connect to WS Server ...
      print("Connecting to WS Server " SERVER_IP " on port 80\n\n");

      // establish connection
      while (!established) {

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

         // set up a WebSocket GET, with the server IP address ...
         isprintf(buff,
                 "GET /ws/xxx HTTP/1.1\r\n"
                 "Host: %s \r\n"
                 "Connection: Upgrade\r\n"
                 "Upgrade: websocket\r\n"
                 "Sec-WebSocket-Key: %s\r\n"
                 "Sec-WebSocket-Version: 13\r\n"
                 "\r\n", 
                 WS_KEY,
                 SERVER_IP);

         // send the GET to establish the WebSocket connection ...
         result = wifi_SEND(tcp_handle, strlen(buff), buff);
         line_feed;
         if (result == wifi_Success) {
            // Receive back a response into the buffer
            // note - this is not a WebSocket frame,
            // it is the response to the GET request
            {
               int size;
               int value;
               char data[wifi_DATA_SIZE + 1];
      
               result = wifi_RECV(tcp_handle, wifi_DATA_SIZE, data, &size); 
               line_feed;
               if (result == wifi_Success) {
                  int i;
                  debug_str("Rcvd: ");
                  for (i = 0; i < size; i++) {
                     debug_char(data[i]);
                  }
                  debug_char('\n');
                  established = 1;
               }
               else {
                  debug_str("\nRECV failed, error = ");
                  debug_dec(result);
                  debug_char('\n');
                  while(1);
               }
            }
         }
         else {
            debug_str("SEND failed, error = ");
            debug_dec(result);
            debug_char('\n');
         }
         _waitsec(1);

      }
      
      debug_str("Polling for response ...\n");
      while (1) {

         // poll for response
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
                     int done = 0;
                     int len = 0;
                     char msg[wifi_DATA_SIZE + 1];
                     print("Rcvd: ");
                     while (!done && (data_left > 0)) {
                        int max = value;
                        if (max > wifi_DATA_SIZE) {
                           max = wifi_DATA_SIZE;
                        }
                        result = wifi_RECV(handle, max, data, &this_size); 
                        line_feed;
                        if (result == wifi_Success) {
                           int i;
                           char *str = ws_decode_str((uint8_t*)data);
                           for (i = 0; i < strlen(str); i++) {
                              printch(str[i]);
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
                     // send message ...
                     isprintf(msg, 
                              "Message %d from the WebSockets Client", 
                              msg_num++);
                     len = ws_encode_str((uint8_t *)buff, msg, WS_MASK);
                     result = wifi_SEND(handle, len, (char *)buff);
                     line_feed;
                     if (result != wifi_Success) {
                        debug_str("\nSEND failed, error = ");
                        debug_dec(result);
                        debug_char('\n');
                        while(1);
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
      }
      // close connection 
      result = wifi_CLOSE(tcp_handle); line_feed;
      if (result == wifi_Success) {
         debug_str("CLOSED\n");
         tcp_handle = 0;
      }
      else {
         debug_str("CLOSE failed\n");
      }
   }
   else {
      debug_str("Initialization failed\n");
   }

}
   
