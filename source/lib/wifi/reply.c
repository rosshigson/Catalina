#include "wificonf.h"

/*
 * wifi_REPLY - Transmit WebSocket/TCP data, or extended HTTP body
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_REPLY(int handle, int rcode, int total, int size, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_str("DEBUG: Sending REPLY: ");
   wifi_debug_dec(handle);
   wifi_debug_char(' ');
   wifi_debug_dec(rcode);
   wifi_debug_char(' ');
   wifi_debug_dec(total);
   wifi_debug_char(' ');
   wifi_debug_dec(size);
   wifi_debug_char('\n');
#endif
   // assume we can send everything in one REPLY
   isprintf(buff,"REPLY:%d,%d,%d,%d", handle, rcode, total, size);
   result = wifi_Send_Command_With_Data(buff, data, size);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

