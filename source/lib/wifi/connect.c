#include "wificonf.h"

/*
 * wifi_CONNECT - Attempt a TCP connection to address on port.
 *                On wifi_Success, handle will be updated with the
                  handle of the TCP connection.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CONNECT(char *address, int port, int *handle) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   isprintf(buff,"CONNECT:%s,%u", address, port);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Id(handle, CONN_TIMEOUT);
      return result;
   }
   return wifi_Err_Unknown;
}

