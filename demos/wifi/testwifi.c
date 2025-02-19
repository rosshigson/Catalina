/*
 * Simple WiFi Test Program.
 *
 * This program tests basic Propeller Wifi support. It uses the wifi library,
 * and a serial plugin/library. It can use 1 or 2 serial ports - one is
 * required to communicate with the WiFi module (port 0), and another one 
 * can be used to communicate with the user (port 1 if available).
 *
 * See the file demos/wifi/README.TXT for details on compiling this program.
 * and configuring the serial ports for use with the WiFi module.
 *
 * IMPORTANT: At least the SSID and PASSPHRASE (see config.h) will need to be 
 * configured before this program can be run successfuly. Also, the DEBUG 
 * and USER_PORT settings can be set in that file. The platform configuration
 * file may also need to be configured. See README.TXT for details.
 *
 * This program tests:
 *
 *   - initializing the WiFi module
 *   - checking and setting values
 *   - joining a network
 *   - listening for HTTP & WebSocket connections
 *   - Polling the WiFi module
 *   - Handling Disconnect requests
 *   - Processing and GET, POST requests
 *   - Sending RECV and REPLY responses
 *   - Receiving and sending Websocket and TCP data
 *   - Handling Error responses
 *
 * HTTP GET can be tested by opening a browser to http://xxx.xxx.xxx.xxx/prop
 * The program will tell you the IP address to use when it starts.
 *
 * HTTP GET and POST can be tested using HTTPie (see https://httpie.io/). 
 * Note that you need the Desktop version to use it on your local WiFi network.
 *
 * WebSockets can be tested using FireFox's Weasel extension. Open a websocket
 * to ws://xxx.xxx.xxx.xxx/ws/anything. The program will display any data it 
 * receives as text. To have the program send back some data, send "send", 
 * and to have the program close the websocket on this end, send "close".
 *
 */

#include <prop.h>
#include <stdint.h>
#include <string.h>
#include <serial.h>
#include <wifi.h>

// network and general configuration

#include "config.h"

// other configuration

#define IP_RETRIES    30       // times to retry to get a valid IP addr

#define IP_RETRY_SECS 3        // seconds between retries

#define POLL_INTERVAL 200      // msecs between polls

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

void main() {
   int result;
   char data[wifi_DATA_SIZE + 1];
   int http_handle, ws_handle;
   int retries;

   _waitsec(1); // in case we are using the external VT100 terminal emulator

   print("\nWiFi Test Program\n\n");

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
      result = wifi_CHECK("wifi-mode", data); line_feed;
      if ((result != wifi_Success) || (strcmp(data, "STA+AP") != 0)) {
         debug_str("CHECK failed\n");
      }
      
      print("Joining ");
      print(SSID);
      print(" ... ");
      result = wifi_JOIN(SSID, PASSPHRASE); line_feed;
      if (result == wifi_Success) {
         retries = 0;
         while (retries < IP_RETRIES) {
            result = wifi_CHECK("station-ipaddr", data); line_feed;
            if (result == wifi_Success) {
               if (strcmp(data, "0.0.0.0") != 0) {
                  print("done.\n\n");
                  print("IP Address = ");
                  print(data);
                  print("\n\n");
                  print("Open a browser to http://");
                  print(data);
                  print("/prop\n\n");
                  print("Open a WebSocket to ws://");
                  print(data);
                  print("/ws/anything\n\n");
                  break;
               }
            }
            else {
               debug_str("CHECK failed\n");
            }
            _waitsec(IP_RETRY_SECS);
         }
         if (retries == IP_RETRIES) {
             print("failed.\n\n");
             debug_str("Failed to get a valid IP address\n");
         }
      }
      else {
         print("failed.\n\n");
         debug_str("JOIN failed\n");
      }
   }
   else {
      print("Initialization failed\n");
   }

   // listen for HTTP requests ...
   debug_str("Listening for HTTP\n");
   result = wifi_LISTEN(TKN_HTTP, "/prop", &http_handle); line_feed;
   if (result != wifi_Success) {
      debug_str("LISTEN failed\n");
   }

   // listen for websocket connections ...
   debug_str("Listening for WebSockets\n");
   result = wifi_LISTEN(TKN_WS, "/ws/*", &ws_handle); line_feed;
   if (result != wifi_Success) {
      debug_str("LISTEN failed\n");
   }

   // poll for events
   debug_str("Polling for WiFi events ...\n");
   while (1) {
      char event;
      int handle;
      int value;
      char data_reply[] = "Hello, World!\n";
      char post_reply[] = "Got it - thanks.";
      char get_reply[] =
         // this reply can be any valid HTML, but should be longer 
         // than wifi_DATA_SIZE bytes, to test that the REPLY/SEND 
         // processing works correctly.
         "<html>\n"
         "Hello - this is a long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "long, long, long, long, long, long, long, long, long, "
         "web page."
         "  <p>Click button to see alert popup message.</p>"
         "  <button onclick = \"showAlert()\">Alert Popup</button>"
         ""  
         "  <script>"
              "function showAlert()"
         "    {"
         "      alert('This is an alert!');"
         "    }"
         "  </script>"
         "</html>";

      _waitms(POLL_INTERVAL);
      result = wifi_POLL(0, &event, &handle, &value); line_feed;
      if (result == wifi_Success) {
         int size = 0;
         switch (event) {
            case 'G':
               debug_str("GET: ");
               debug_dec(handle);
               debug_char(' ');
               debug_dec(value);
               debug_char('\n');
               print("Get\n");
               wifi_SEND_DATA(handle, 200, strlen(get_reply), get_reply);
               break;
            case 'P':
               debug_str("POST: ");
               debug_dec(handle);
               debug_char(' ');
               debug_dec(value);
               debug_char('\n');
               print("Post\n");
               result = wifi_RECV(handle, wifi_DATA_SIZE, data, &size); 
               line_feed;
               if (result == wifi_Success) {
                  print(data);
                  print("\n");
                  result = wifi_SEND_DATA(handle, 200, strlen(post_reply), post_reply);
               }
               else {
                  debug_str("RECV failed\n");
               }
               break;
            case 'W':
               debug_str("WS: ");
               debug_dec(handle);
               debug_char(' ');
               debug_dec(value);
               debug_char('\n');
               print("WebSocket\n");
               break;
            case 'D':
               debug_str("DATA: ");
               debug_dec(handle);
               debug_char(' ');
               debug_dec(value);
               debug_char('\n');
               print("Data\n");
               result = wifi_RECV(handle, wifi_DATA_SIZE, data, &size); 
               line_feed;
               if (result == wifi_Success) {
                  print(data);
                  print("\n");
                  if (strcmp(data, "close") == 0) {
                     result = wifi_CLOSE(handle); line_feed;
                  }
                  else if (strcmp(data, "send") == 0) {
                     result = wifi_SEND(handle, strlen(data_reply), data_reply);
                     line_feed;
                  }
               }
               else {
                  debug_str("RECV failed\n");
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
         debug_str("\nWiFi POLL failed\n");
         debug_str("result = ");
         debug_dec(result);
         debug_char('\n');
      }
   }
}
