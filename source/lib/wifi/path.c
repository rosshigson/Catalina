#include "wificonf.h"

/*
 * wifi_PATH - Retrieve the path associated with a connection handle or 
 *             listener id. The path buffer will be set on success, and
 *             must be large enough to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_PATH(int handle_id, char *path) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_str("WiFi PATH ");
   wifi_debug_dec(handle_id);
   wifi_debug_char('\n');
#endif
   isprintf(buff,"PATH:%u", handle_id);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(path, wifi_DATA_SIZE);
   }
   return result;
}

