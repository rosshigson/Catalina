#include "wificonf.h"

// read a response that is either a success 'S' with a size followed by data
// or an 'E' with an error code. The data need not be null terminated.
int wifi_Read_Response_Data(int *code, int *size, int max, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   int values = 0;
   int start = 0;
   char result;
   
#if WIFI_DEBUG
   wifi_debug_print("reading response", "");
#endif
   while (ch != RSP_BEGIN) {
      ch = wifi_timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         wifi_debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < CMD_MAXSIZE) {
      ch = wifi_timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         wifi_debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
      if (ch != RSP_END) {
         buff[count++] = ch;
      }
      else {
         // decode response enough so we can get the size of the data
         // on success, or the error code
         if (count >= 3) {
            buff[count] = '\0';
            values = isscanf(buff, "=%c,%u", &result, size);
            if ((result == 'S') && (values == 2)) {
#if WIFI_DEBUG
               wifi_debug_str("size = ");
               wifi_debug_dec(*size);
               wifi_debug_char('\n');
#endif
               // valid success response with size
               if (*size <= max) {
                  int i;
                  for (i = 0; i < *size; i++) {
                     ch = wifi_timed_rx(CMD_TIMEOUT);
                     if (ch < 0) {
                        return wifi_Err_Timeout;
                     }
                     else {
                        data[i] = ch;
                     }
                  }
                  data[i] = 0; // terminate the data
                  return wifi_Success;
               }
               else {
                   // response too long
                   return wifi_Err_Unknown;
               }
            }
            else if ((result == 'E') && (values == 2)) {
               *code = *size; // size is error code
               if ((*code > wifi_Success) && (*code <= wifi_Err_Internal)) {
                  // valid error response
                  return *code;
               }
               else {
                  // invalid response
                  return wifi_Err_Unknown;
               }
            }
         }
         // invalid response
         return wifi_Err_Unknown;
      }
   }
   // response is too long!
#if WIFI_DEBUG
   wifi_debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

