#include "wificonf.h"

/*
 * wifi_CHECK - Retrieve the current value of a setting. See also the 
 *              Convenience functions (defined in wifi.h) for many common 
 *              check requests. The value field is set on success, 
 *              and must be of a suitable size to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CHECK(char *setting, char *value) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (strlen(setting) > CMD_MAXSIZE - 6) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   wifi_debug_print("WiFi CHECK", setting);
#endif
   isprintf(buff,"CHECK:%s", setting);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(value, wifi_DATA_SIZE);
   }
   return result;
}


