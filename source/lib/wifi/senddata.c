#include "wificonf.h"

/*
 * wifi_SEND_DATA - Transmit HTTP data (e.g. in response to a GET request). 
 *                  REPLY can send up to wifi_DATA_SIZE bytes. The total 
 *                  indicates the total size of data to be send, which can be
 *                  more than wifi_DATA_SIZE. If so, the data is sent by using
 *                  one REPLY packet followed by one or more SEND packets.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SEND_DATA(int handle, int rcode, int total, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int sent, left, this;
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (total <= wifi_DATA_SIZE) {
      // can send everything in one REPLY
      result = wifi_REPLY(handle, rcode, total, total, data);
   }
   else {
      // send one REPLY indicating total data size
      if (total > wifi_DATA_SIZE) {
         this = wifi_DATA_SIZE;
         left = total;
      }
      else {
         this = total;
         left = 0;
      }
      result = wifi_REPLY(handle, rcode, total, this, data);
      sent = wifi_DATA_SIZE;
      left -= wifi_DATA_SIZE;
      while ((result == wifi_Success) && (left > 0)) {
         // now use SEND until all data sent
         if (left > wifi_DATA_SIZE) {
            left = left - wifi_DATA_SIZE;
            this = wifi_DATA_SIZE;
         }
         else {
            this = left;
            left = 0;
         }
         result = wifi_SEND(handle, this, &data[sent]);
         if (result == wifi_Success) {
            wifi_Read_Code(&code);
#if WIFI_DEBUG > 1
            if (code != 0) {
               // this should never happen ...
               debug_str("incorrect success code = ");
               debug_dec(code);
               debug_char('\n');
            }
#endif
         }
         sent += this;
      }
   }
   return result;
}

