#include "wificonf.h"

// poll for a response
static int wifi_Poll_Response(char *event, int *handle, int *value) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   unsigned int code = 0;

#if WIFI_DEBUG > 1
   wifi_debug_print("reading ", "");
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
         buff[count] = 0; // terminate the response
         if (isscanf(buff, "=%c,%u", event, value) == 2) {
            if (*event == 'E') {
               // valid error response
               return *value;
            }
            if (isscanf(buff, "=%c,%u,%u", event, handle, value) == 3) {
               // all other events return success
               return wifi_Success;
            }
         }
#if WIFI_DEBUG
         wifi_debug_print("response parse error", buff);
#endif
         return wifi_Err_Unknown;
      }
   }
#if WIFI_DEBUG
   wifi_debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

/*
 * wifi_POLL - Check for activity like incoming HTTP GET/POST requests, 
 *             HTTP/WebSocket/TCP connections/disconnections, and incoming 
 *             WebSocket/TCP data. Optionally, the event activity can be 
 *             filtered with mask, a 32-bit binary value where each bit 
 *             corresponds to a connection handle and limits event responses
 *             to just those connections. Example: a mask of 1<<5 will cause
 *             the module to respond with an event only if one has occurred 
 *             on connection handle 5. If the mask is zero then no mask is
 *             used.
 *
 *             Returns an event, an optional handle and an optional value:
 *
 *             Event  handle   value   meaning
 *             =====  ======   =====   =======
 *              'G'   handle   id      Received HTTP GET
 *              'P'   handle   id      Received HTTP POST
 *              'W'   handle   id      Received WebSocket request
 *              'D'   handle   size    Receoved WebSocket or TCP Data
 *              'S'   handle   0       REPLY/SEND completed successfuly
 *              'X'   handle   code    Connection disconnected, code is reason
 *              'N'   0        0       No connection activity has occurred
 *              'E'   handle   code    Communication error code occured
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_POLL(int mask, char *event, int *handle , int *value) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   char ch;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (mask == 0) {
      strcpy(buff, "POLL");
   }
   else {
      isprintf(buff, "POLL:%d", mask);
   }
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Poll_Response(event, handle, value);
      if (result == wifi_Success) {
         switch (*event) {
            case 'G':
            case 'P':
            case 'W':
            case 'D':
            case 'S':
            case 'X':
            case 'N':
               // these are all successful responses
               return wifi_Success;
               break;
            default:
#if WIFI_DEBUG
               wifi_debug_str("unknown poll response ");
               wifi_debug_char(*event);
               wifi_debug_char('\n');
#endif
               return wifi_Err_Unknown;
         }
      }
      else {
         // an error response is considered a successful poll
         *event = 'E';
         *value = result;
         return wifi_Success;
      }
   }
   else {
#if WIFI_DEBUG
      wifi_debug_str("poll send failed, error = ");
      wifi_debug_dec(result);
      wifi_debug_char('\n');
#endif
   }
   return wifi_Err_Unknown;
}

