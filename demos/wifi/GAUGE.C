#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <prop.h>
#include <wifi.h>

// set these to suit the local WiFi network ...
#define SSID       "MyNetwork"
#define PASSPHRASE "TellMeASecret"

#define POLL_INTERVAL 250   // milliseconds between polls

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

int SEND_FILE(int handle, int rcode, char *name) {
   FILE *f;
   size_t length;
   char *data;
   int result;

   f = fopen(name, "r");
   if (f != NULL) {
      fseek(f, 0, SEEK_END);
      length = ftell(f);
      fseek(f, 0, SEEK_SET);
      data = malloc(length + 1);
      if (data != NULL) {
         if (fread(data, 1, length, f) == length) {
            data[length] = '\0';
            result = wifi_SEND_DATA(handle, rcode, length, data);
         }
         else {
            result = 2; // invalid argument (cannot read file?)
         }
         fclose(f);
         free(data);
      }
   }
   else {
      result = 2; // invalid argument
   }
   return result;
}

double random() {
   return ((rand()*1.0)/(RAND_MAX*1.0));
}

void main() {
   char data[256];
   int  result = 0;
   char event = '\0';
   int  handle = 0;
   char path[256] = "";
   int  value = 0;
   int  size = 0;
   char ip_addr[32] = "0.0.0.0";
   int  ip_retries = 0;
   int  gauge_timer = 0;
   int  gauge_handle = 0;

   int  gauge_val = 500; // value to send in response to "GET /gauge/val"
   char get_gauge_val[32] = "";
   
   // initialize WiFi module
   result = wifi_AUTO();
   if (result != 0) {
      printf("Initialization failed, result = %d\n", result);
   }

   // set mode to AP to force module off any current network
   if (wifi_SET("wifi-mode", "AP") != wifi_Success) {
      printf("SET failed\n");
   }

   // set mode to STA+AP mode
   if (wifi_SET("wifi-mode", "STA+AP") != wifi_Success) {
      printf("SET failed\n");
   }

   // connect to WiFi network ...
   printf("\nJoining network %s\n", SSID);
   result = wifi_JOIN(SSID, PASSPHRASE);

   while ((strcmp(ip_addr, "0.0.0.0") == 0) && (ip_retries < 10)) {
      _waitsec(3);
      result = wifi_CHECK("station-ipaddr", ip_addr);
      ip_retries = ip_retries + 1;
   }

   // listen for HTTP requests on /gauge ...
   result = wifi_LISTEN(TKN_HTTP, "/gauge*", &gauge_handle);
   if (result != wifi_Success) {
     printf("LISTEN failed\n");
     exit(2);
   }
   else {
     // printf("listen '/gauge', handle = %d\n", gauge_handle);
   }

   printf("\nCatalina/jQuery Integration Demo\n");

   result = wifi_CHECK("station-ipaddr", ip_addr);
   if ((result != wifi_Success) || (strcmp(ip_addr, "0.0.0.0") == 0)) {
     printf("\nFailed to get IP address\n");
     exit(-1);
   }

   printf("\nOpen a browser to http://%s/gauge\n\n", ip_addr);

   // poll for WiFi events ...
   while (1) {
     _waitms(POLL_INTERVAL);
     result = wifi_POLL(0, &event, &handle, &value);
     if ((event == 'N') || (event == 'S') || (event == 'X')) {
        // nothing (this is normal)
     }
     else if (event == 'G') {
       result = wifi_PATH(handle, path);
       if (result != wifi_Success) {
          path[0] = '\0';
       }
       if (strcmp(path, "/gauge") == 0) {
          result = SEND_FILE(handle, 200, "GAUGE.HTM");
       }
       else if (strcmp(path, "/gauge/val") == 0) {
          // generate random data to move the gauge nicely ...
          if (gauge_timer > 0) {
             gauge_val = gauge_val - floor(random() * 25);
             gauge_timer = gauge_timer - 1;
          }
          else if (gauge_timer < 0) {
             gauge_val = gauge_val + floor(random() * 25);
             gauge_timer = gauge_timer + 1;
          }
          else {
             gauge_timer = floor((random() - 0.5) * 20.0);
          }
          // don't go off scale
          if (gauge_val < 0) {
             gauge_val = 0;
             gauge_timer = 0;
          }
          else if (gauge_val > 1000) {
             gauge_val = 1000;
             gauge_timer = 0;
          }
          sprintf(get_gauge_val, "%d\n\n", gauge_val);
          printf("Sending %d\n", gauge_val);
          result = wifi_SEND_DATA(handle, 200, strlen(get_gauge_val), get_gauge_val);
       }
       else {
         printf("Unknown GET path = '%s'\n", path);
       }
     }
     else if (event == 'P') {
       result = wifi_PATH(handle, path);
       if (result != wifi_Success) {
          path[0] = '\0';
       }
       if (strcmp(path, "/gauge/radio") == 0) {
         result = wifi_RECV(handle, 100, data, &size);
         printf("Received %s\n", data);
         result = wifi_REPLY(handle, 200, 2, 2, "OK");
       }
       else {
         printf("Unknown POST path = '%s'\n", path);
       }
     }
     else {
       printf("Unexpected event = '%c'\n", event);
      }
   }
}

