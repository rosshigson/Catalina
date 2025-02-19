#include "wificonf.h"

/*
 * wifi_SEND - Transmit WebSocket/TCP data, or extended HTTP body (after 
 *             REPLY command).
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SEND(int handle, int size, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_str("DEBUG: Sending SEND: ");
   wifi_debug_dec(handle);
   wifi_debug_char(' ');
   wifi_debug_dec(size);
   wifi_debug_char('\n');
#endif
   // assume we can send everything in one SEND
   isprintf(buff,"SEND:%d,%d", handle, size);
   result = wifi_Send_Command_With_Data(buff, data, size);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

