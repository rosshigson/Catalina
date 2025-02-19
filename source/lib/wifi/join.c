#include "wificonf.h"

/*
 * wifi_JOIN - Join a network via the ssid access point using passphrase.
 *
 * NOTE: JOIN may return success even on failure to join the network. 
 * Check station-ipaddr to ensure the adaptor has an IP address (other
 * than 0.0.0.0)
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_JOIN(char *ssid, char *passphrase) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   isprintf(buff,"JOIN:%s,%s", ssid, passphrase);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

