#include "wificonf.h"

/*
 * wifi_ARG - Retrieve HTTP GET/POST’s name argument (in query or body) on 
 *            connection indicated by handle. The value buffer will be set 
 *            on success, and must be large enough to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_ARG(int handle, char *name, char *value) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (strlen(name) > CMD_MAXSIZE - 15) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_print("WiFi ARG ", name);
#endif
   isprintf(buff,"ARG:%u,%s", handle, name);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(value, wifi_DATA_SIZE);
   }
   return result;
}


