/*
 * Simple HTTP Server program.
 *
 * This program must run on a Propeller. Use it in conjunction with 
 * http_client.c running on another Propeller. That propeller must
 * join the SSID of the propeller running THIS program.
 *
 * IMPORTANT: This program does not use the SSID and PASSPHRASE in config.h,
 * just the DEBUG and USER_PORT settings from that file. This is because it 
 * does not JOIN a WiFi network - it sets itself up as an AP and expects
 * other Propellers to JOIN it.
 *
 * The platform configuration file may need to be configured. See the
 * README.TXT for details. 
 *
 */

#include <prop.h>
#include <stdint.h>
#include <string.h>
#include <serial.h>
#include <wifi.h>

// network and general configuration:

#include "config.h"

// other configuration

#define IP_RETRIES    30       // times to retry to get a valid IP addr
                               //
#define IP_RETRY_SECS 3        // seconds between retries

#define POLL_INTERVAL 250      // msecs between polls

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

// html we will send in response to "GET /prop" ...
static char get_prop[] =
   "<!DOCTYPE html>"
   "<html>"
     "<body>"
       "<H2>Get a Value from the Propeller</H2> "
       "<p>Click Update to get a value from the Propeller. "
       " Click again to get a new value each time:</p> "
       "<button onclick=\"getFromProp()\">Update</button>"
       "<p id=\"value\">Waiting...</p>"
       "<script>"
         "function usePropReply(response) {"
           "var val = document.getElementById(\"value\");"
           "val.innerHTML = \"Value: \" + response;"
         "}"

         "function getFromProp() {"
           "httpGet(\"/prop/val\", usePropReply);"
         "}"

         "function httpGet(path, callback) {"
           "var req = new XMLHttpRequest();"
           "req.open(\"GET\", path, true); "
           "req.onreadystatechange = function() { "
             "if (req.readyState == 4) "
               "if (req.status == 200) "
                 "callback(req.responseText);"
               "else "
                 "callback(\"Waiting...\");"
           "};"
           "req.send();"
         "}"
       "</script>"
     "</body>"
   "</html>";

// value we will send in response to "GET /prop/val" ...
static int prop_val = 99;

// print a string to USER_PORT
void print(char *str) {
  s_str(USER_PORT, str);
}

void main() {
   int result;
   char name[33] = "";
   char data[wifi_DATA_SIZE + 1];
   int prop_handle, val_handle;
   int retries;

   _waitsec(1); // in case we are using the external VT100 terminal emulator

   print("\nWiFi HTTP Server\n\n");

   result = wifi_AUTO(); line_feed;

   if (result == wifi_Success) {

      // put in AP mode (forces the WiFi module off any current network)
      result = wifi_SET("wifi-mode", "AP"); line_feed;
      if (result != wifi_Success) {
         debug_str("SET failed\n");
      }
      // now go back to STA+AP mode (not required, but convenient)
      result = wifi_SET("wifi-mode", "STA+AP"); line_feed;
      if (result != wifi_Success) {
         debug_str("SET failed\n");
      }
      // display our module name (this is the SSID clients must JOIN)
      result = wifi_CHECK("module-name", name); line_feed;
      if (result == wifi_Success) {
        print("Module name is ");
        print(name);
        print("\n\n");
      }
      else {
         print("failed to get module name\n");
      }
   }
   else {
      print("Initialization failed\n");
   }

   // listen for HTTP requests on /prop ...
   debug_str("Listening for /prop\n");
   result = wifi_LISTEN(TKN_HTTP, "/prop", &prop_handle); line_feed;
   if (result != wifi_Success) {
      debug_str("LISTEN failed\n");
   }

   // listen for HTTP requests on /prop/val ...
   debug_str("Listening for /prop/val\n");
   result = wifi_LISTEN(TKN_HTTP, "/prop/val", &val_handle); line_feed;
   if (result != wifi_Success) {
      debug_str("LISTEN failed\n");
   }

   // poll for events
   debug_str("Polling for WiFi events ...\n");
   while (1) {
      char event;
      int handle;
      int value;
      _waitms(POLL_INTERVAL);
      result = wifi_POLL(0, &event, &handle, &value); line_feed;
      if (result == wifi_Success) {
         if (event == 'G' ) {
            char path[wifi_DATA_SIZE];
            debug_str("GET: ");
            debug_dec(handle);
            debug_char(' ');
            debug_dec(value);
            debug_char('\n');
            if (wifi_PATH(value, path) == wifi_Success) {
               debug_str("path = ");
               debug_str(path);
               debug_char('\n');
               if (strcmp(path,"/prop") == 0) {
                  // send the web page
                  wifi_SEND_DATA(handle, 200, strlen(get_prop), get_prop);
               }
               else if (strcmp(path,"/prop/val") == 0) {
                  // send a value
                  char get_prop_val[10];
                  isprintf(get_prop_val, "%d", prop_val++);
                  wifi_SEND_DATA(handle, 200, strlen(get_prop_val), get_prop_val);
               }
               else {
                  debug_str("Unknown GET path\n");
               }
            }
         }
      }
   }
}

