#include "wificonf.h"

/*
 * wifi_SET - Change the setting to value. But see also the convenience
 *            functions (defined in wifi.h) which can be used for many 
 *            common set requests.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SET(char *setting, char *value) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_print("WiFi SET", setting);
#endif
   isprintf(buff,"SET:%s,%s", setting, value);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}


