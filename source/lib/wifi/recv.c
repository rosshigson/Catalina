#include "wificonf.h"

/*
 * wifi_RECV - Retrieve incoming HTTP body or WebSocket/TCP data. The data
 *             buffer will be updated on success, and must be at least max
 *             bytes long.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_RECV(int handle, int max, char *data, int *size) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   debug_str("DEBUG: Sending RECV: ");
   debug_dec(handle);
   debug_char(' ');
   debug_dec(max);
   debug_char('\n');
#endif
   // assume we can receive everything in one RECV
   isprintf(buff,"RECV:%d,%d", handle, max);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Response_Data(&code, size, max, data);
   }
   return result;
}

