#include "wificonf.h"

/*
 * wifi_LISTEN - Activate a listener process to monitor HTTP or WebSocket 
 *               protocol activity on port 80 with a specified path. 
 *               Remote clients that connect to, request action of, and
 *               disconnect from path are noted by the listener and cause 
 *               it to alert the caller via the POLL command.
 *               For protocol, use TKN_HTTP or TOKEN_WS.
 *               On wifi_Success, the id will be updated with a handle that
 *               can be used in wifi_Path or wifi_Close commands.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_LISTEN(char protocol, char *path, int *id) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (protocol == TKN_HTTP) {
      isprintf(buff,"LISTEN:HTTP,%s", path);
   }
   else if (protocol == TKN_WS) {
      isprintf(buff,"LISTEN:WS,%s", path);
   }
   else if (protocol == TKN_TCP) {
      isprintf(buff,"LISTEN:TCP,%s", path);
   }
   else {
      // use the token
      isprintf(buff,"LISTEN:%c%s", protocol, path);
   }
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Id(id, CMD_TIMEOUT);
      return result;
   }
   return wifi_Err_Unknown;
}

