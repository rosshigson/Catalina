#include "wificonf.h"

/*
 * wifi_CLOSE - Terminate an established connection or listener via its 
 *              handle or id (respectively), freeing it to rejoin the 
 *              available connection or listener pools.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CLOSE(int handle_id) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   isprintf(buff,"CLOSE:%u", handle_id);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

