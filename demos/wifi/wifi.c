/*
 * This file is the same as the wifi libary files, but all in a single file
 * for easier debugging/modification. You can compile programs with this
 * file instead of using -lwifi. For example:
 *
 *    catalina -p2 testwifi.c wifi.c -lserial2 -lci -C NO_HMI
 *
 * instead of
 *
 *    catalina -p2 testwifi.-lc wifi -lserial2 -lci -C NO_HMI
 */

#include <prop.h>
#include <stdint.h>
#include <string.h>
#include <serial.h>

#include "wifi.h"              // use local header file instead of <wifi.h>

// general configuration

#define CMD_TIMEOUT   1000     // msecs to wait for a normal command response
#define CONN_TIMEOUT  1000000  // msecs to wait for a CONNECT tesponse
#define CMD_MAXSIZE   256      // maxmium size of commands sent
#define WIFI_DEBUG    1        // 1 to enable debugging, 2 for more debugging

// WiFi Command characters:

#define CMD_BEGIN    0xFE
#define CMD_END      '\r'

// WiFi Response characters:

#define RSP_BEGIN    0xFE
#define RSP_END      '\r'

// This package is designed to work with either the 2, 4 port or 8 port 
// serial plugin and library - the user port (port 1) can be used for 
// user interaction and debug messages, and the other port (port 0) 
// is used as the WiFi serial port. The port configuration in the
// file 'Extras.spin' on the Propeller 1, or the platform configuration
// file on the Propeller 2 (e.g. P2CUSTOM.inc etc) must be set accordingly.

#define WIFI_PORT  0
#define USER_PORT  1

/*----------------------------------------------------------------------------*/

/*
 * Forward references for the tiny I/O library
 */
int isscanf(const char *str, const char *fmt, ...);
int isprintf(char* buf, const char* fmt, ...);

/*----------------------------------------------------------------------------*/

/******************** INTERNAL STATE VARIABLES FUNCTIONS *********************/

int wifi_init     = 0;  // set to 1 when WiFi module initialized.
int wifi_pin_di   = -1; // set to -1 if not initialized/used
int wifi_pin_do   = -1; // set to -1 if not initialized/used
int wifi_pin_res  = -1; // set to -1 if not initialized/used
int wifi_pin_pgm  = -1; // set to -1 if not initialized/used
int wifi_pin_brk  = -1; // set to -1 if not initialized/used

/*************************** INTERNAL FUNCTIONS ******************************/

#if WIFI_DEBUG

#define debug_str(str) s_str(USER_PORT, str)
#define debug_dec(dec) s_dec(USER_PORT, dec) 
#define debug_hex(hex, digits) s_hex(USER_PORT, hex, digits) 
#define debug_char(ch) s_tx(USER_PORT, ch) 

static void debug_print(char *str1, char *str2) {
   debug_str("DEBUG: ");
   debug_str(str1);
   if (strlen(str2) > 0) {
      debug_str(" \"");
      debug_str(str2);
      debug_str("\"");
   }
   debug_str("\n");
}

#else

#define debug_str(str) 
#define debug_dec(dec)
#define debug_hex(hex, digits)
#define debug_char(ch)
#define debug_print(str1, str2)

#endif

// send command string preceded by CMD_BEGIN and terminated by CMD_END
static int wifi_Send_Command(char *cmd) {
   char buff[CMD_MAXSIZE + 1];

   if (strlen(cmd) > CMD_MAXSIZE) {
#if WIFI_DEBUG
      debug_print("command too long", cmd);
#endif
      return wifi_Err_Unknown;
   }
   isprintf(buff,"%c%s%c", CMD_BEGIN, cmd, CMD_END); 
#if WIFI_DEBUG > 1
   debug_print("sending", cmd);
#endif
   s_str(WIFI_PORT, buff);
   s_txflush(WIFI_PORT);
   return wifi_Success;
}

// send Command With up to size bytes of data (note data need not be 
// null terminated)
static int wifi_Send_Command_With_Data(char *cmd, char *data, int size) {
   char buff[CMD_MAXSIZE + 1];
   int i;

   if (strlen(cmd) > CMD_MAXSIZE) {
#if WIFI_DEBUG
      debug_print("command too long", cmd);
#endif
      return wifi_Err_Unknown;
   }
   isprintf(buff,"%c%s%c", CMD_BEGIN, cmd, CMD_END); 
#if WIFI_DEBUG > 1
   debug_print("sending", cmd);
#endif
   s_str(WIFI_PORT, buff);
   for (i = 0; i < size; i++) {
      s_tx(WIFI_PORT, data[i]);
      if ((i % 30) == 0) {
         // serial8 only has 32 byte tx and rx buffers, 
         // so flush output every 30 characters
         s_txflush(WIFI_PORT);
      }
#if WIFI_DEBUG > 1
      debug_hex(data[i], 2);
      debug_char(' ');
#endif
   }
   s_txflush(WIFI_PORT);
   return wifi_Success;
}

// wait for a wifi character for a specified time (millisecnds)
static int timed_rx(int timeout) {
   int time = 0;
   int ch;

   while (s_rxcount(WIFI_PORT) == 0) {
      if (time++ > timeout) {
         return -1;
      }
      _waitms(1);
   }
   ch = s_rx(WIFI_PORT);
#if WIFI_DEBUG > 1
   debug_hex(ch, 2);
   debug_char(' ');
#endif
   return ch;
}

// read a response that is either a success 'S' with a value
// or an 'E' with an error code
static int wifi_Read_Value(char *value, int max) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   unsigned int code = 0;

#if WIFI_DEBUG > 1
   debug_print("reading ", "");
#endif
   while (ch != RSP_BEGIN) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("timeout waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < max) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("timeout waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
      if (ch != RSP_END) {
         buff[count++] = ch;
      }
      else {
         // decode response enough so we can return a success or error
         // indication (further decoding of the result must be done by 
         // the caller)
         buff[count] = 0; // terminate the response
         if (count >= 3) {
            isscanf(buff, "=%c,%s", &result, value);
            if (result == 'S') {
               // valid success response
               return wifi_Success;
            }
            else if ((result == 'E') ) {
               if ((isscanf(&buff[3],"%u", &code) == 1) 
               &&  (code <= wifi_Err_Internal)) {
                  // valid error response
                  return (int)code;
               }
               else {
                  // invalid error response
                  return wifi_Err_Unknown;
               }
            }
            else {
               // unexpected response
               return wifi_Err_Unknown;
            }
         }
      }
   }
   // response is too long!
#if WIFI_DEBUG
   debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// read a response that is either a success 'S' with a success code 
// (which should always be 0) or an 'E' with an error code.
static int wifi_Read_Code(int *code) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   
#if WIFI_DEBUG > 1
   debug_print("reading ", "");
#endif
   while (ch != RSP_BEGIN) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < CMD_MAXSIZE) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
      if (ch != RSP_END) {
         buff[count++] = ch;
      }
      else {
         // decode response enough so we can return a success or error
         // indication (further decoding of the result must be done by 
         // the caller)
         buff[count] = 0; // terminate the response
         if (count >= 3) {
            count = isscanf(buff, "=%c,%u", &result, code);
            if ((result == 'S') && (count == 2)) {
#if WIFI_DEBUG > 1         
               // this should never happen ... but it does!!!
               if (*code != 0) {
                  debug_print("unexpected success code ", buff);
               }
#endif
               // valid success response
               return wifi_Success;
            }
            else if ((result == 'E') && (count == 2)) {
               if (*code <= wifi_Err_Internal) {
                  // valid error response
                  return *code;
               }
            }
         }
         // unexpected response
         return wifi_Err_Unknown;
      }
   }
   // response is too long!
#if WIFI_DEBUG
   debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// read a response that is either a success 'S' with a size followed by data
// or an 'E' with an error code. The data need not be null terminated.
static int wifi_Read_Response_Data(int *code, int *size, int max, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   int start = 0;
   char result;
   
#if WIFI_DEBUG
   debug_print("reading response", "");
#endif
   while (ch != RSP_BEGIN) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < CMD_MAXSIZE) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
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
            count = isscanf(buff, "=%c,%u", &result, size);
#if WIFI_DEBUG
            debug_str("got response ");
            debug_char(result);
            debug_char(' ');
            debug_dec(*size);
            debug_char('\n');
#endif
            if ((result == 'S') && (count == 2)) {
#if WIFI_DEBUG
               debug_str("size = ");
               debug_dec(*size);
               debug_char('\n');
#endif
               // valid success response with size
               if (*size <= wifi_DATA_SIZE) {
                  int i;
                  for (i = 0; i < *size; i++) {
                     ch = timed_rx(CMD_TIMEOUT);
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
            else if ((result == 'E') && (count == 2)) {
               *code = *size; // size is error code
               if (*code <= wifi_Err_Internal) {
                  // valid error response
                  return *code;
               }
            }
         }
         // invalid response
         return wifi_Err_Unknown;
      }
   }
   // response is too long!
#if WIFI_DEBUG
   debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// wait for a response for a specified time (milliseconds) that is 
// either a success 'S' with a handle or an 'E' with an error code
static int wifi_Read_Id(int *id, int timeout) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   unsigned int code = 0;

#if WIFI_DEBUG > 1
   debug_print("reading ", "");
#endif
   while (ch != RSP_BEGIN) {
      // use the specified timeout for first character of response
      // ( thereafter, use the normal CMD_TIMEOUT)
      ch = timed_rx(timeout);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < CMD_MAXSIZE) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
      if (ch != RSP_END) {
         buff[count++] = ch;
      }
      else {
         // decode response so we can return a success
         // and the id or an error indication
         buff[count] = 0; // terminate the response
#if WIFI_DEBUG > 1
         debug_print("response", buff);
#endif
         if (count >= 3) {
            count = isscanf(buff, "=%c,%u", &result, &code);
            if ((result == 'S') && (count == 2)) {
               // valid success response
               *id = code;
               return wifi_Success;
            }
            else if ((result == 'E') && (count == 2)) {
               if (code <= wifi_Err_Internal) {
                  // valid error response
                  *id = code;
                  return (int)code;
               }
            }
         }
         // invalid response
         return wifi_Err_Unknown;
      }
   }
   // response is too long!
#if WIFI_DEBUG
   debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// poll for a response
static int wifi_Poll_Response(char *event, int *handle, int *value) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   unsigned int code = 0;

#if WIFI_DEBUG > 1
   debug_print("reading ", "");
#endif
   while (ch != RSP_BEGIN) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < CMD_MAXSIZE) {
      ch = timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         debug_print("time out waiting for response", "");
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
         debug_print("response parse error", buff);
#endif
         return wifi_Err_Unknown;
      }
   }
#if WIFI_DEBUG
   debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

/*************************** EXTERNAL FUNCTIONS ******************************/

/*
 * The following functions return the pins on the Propeller 2 only. 
 * On the Propeller 1 the following pin functions have to be
 * defined in the application to use wifi_AUTO(). If the pin is not 
 * connected, or should not be used these functions will return 511
 * (i.e. -1 & $1FF):
 */
#ifdef __CATALINA_P2

int wifi_DO_PIN() {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl\n");
#endif
   return PASM(" mov r0, #(_WIFI_DO & $1FF)\n");
}

int wifi_DI_PIN() {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl\n");
#endif
   return PASM(" mov r0, #(_WIFI_DI & $1FF)\n");
}

int wifi_PGM_PIN() {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl\n");
#endif
   return PASM(" mov r0, #(_WIFI_PGM & $1FF)\n");
}

int wifi_RES_PIN() {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl\n");
#endif
   return PASM(" mov r0, #(_WIFI_RES & $1FF)\n");
}

int wifi_BRK_PIN() {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl\n");
#endif
   return PASM(" mov r0, #(_WIFI_BRK & $1FF)\n");
}

#endif

// drvlow - drive a pin low - works in all modes on P1 or P2
void drvlow(int pin) {
#ifdef __CATALINA_P2
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
   #endif
   PASM(" drvl r2\n");
#else
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_EXEC\n alignl");
   #endif
   PASM(" mov  r0,#1\n");
   PASM(" sub  r2,#1\n");
   PASM(" shl  r0,r2\n");
   PASM(" andn OUTA,r0\n");
   PASM(" or   DIRA,r0\n");
   #ifdef __CATALINA_COMPACT
   PASM(" jmp #EXEC_STOP");
   #endif
#endif
}

// drvhigh - drive a pin high - works in all modes on P1 or P2
void drvhigh(int pin) {
#ifdef __CATALINA_P2
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
   #endif
   PASM(" drvh r2\n");
#else
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_EXEC\n alignl");
   #endif
   PASM(" mov  r0,#1\n");
   PASM(" sub  r2,#1\n");
   PASM(" shl  r0,r2\n");
   PASM(" or   OUTA,r0\n");
   PASM(" or   DIRA,r0\n");
   #ifdef __CATALINA_COMPACT
   PASM(" jmp #EXEC_STOP");
   #endif
#endif
}

// input - set dir of pin low - works in all modes on P1 or P2
void input(int pin) {
#ifdef __CATALINA_P2
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
   #endif
   PASM(" dirl r2\n");
#else
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_EXEC\n alignl");
   #endif
   PASM(" mov  r0,#1\n");
   PASM(" sub  r2,#1\n");
   PASM(" shl  r0,r2\n");
   PASM(" andn DIRA,r0\n");
   #ifdef __CATALINA_COMPACT
   PASM(" jmp #EXEC_STOP");
   #endif
#endif
}

// output - set dir of pin high - works in all modes on P1 or P2
void output(int pin) {
#ifdef __CATALINA_P2
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
   #endif
   PASM(" dirh r2\n");
#else
   #ifdef __CATALINA_COMPACT
   PASM(" word I16B_EXEC\n alignl");
   #endif
   PASM(" mov  r0,#1\n");
   PASM(" sub  r2,#1\n");
   PASM(" shl  r0,r2\n");
   PASM(" or   DIRA,r0\n");
   #ifdef __CATALINA_COMPACT
   PASM(" jmp #EXEC_STOP");
   #endif
#endif
}

/*
 * wifi_BREAK - Send a BREAK (can be used to exit transparent mode).
 */
void wifi_BREAK() {
   if ((wifi_pin_brk >= 0) && (wifi_pin_brk <= 63)) {
      _waitms(100); // ok for baud rates down to 300 baud!
      drvlow(wifi_pin_brk);
      _waitms(200); // ok for baud rates down to 300 baud!
      input(wifi_pin_brk);
      _waitms(100); // ok for baud rates down to 300 baud!
   }
}

/*
 * wifi_RESET - Pull RES low to reset the WiFi module.
 */
void wifi_RESET() {
   if ((wifi_pin_res >= 0) && (wifi_pin_res <= 63)) {
      drvlow(wifi_pin_res);
      _waitms(200);
      drvhigh(wifi_pin_res);
      _waitms(100);
   }
}

/*
 * wifi_PGM - Pull PGM down 4 times rapidly to force AP+STA mode.
 */
void wifi_PGM() {
   int i;
   if ((wifi_pin_pgm >= 0) && (wifi_pin_pgm <= 63)) {
      for (i = 0; i < 4; i++) {
         drvlow(wifi_pin_pgm);
         _waitms(100);
         drvhigh(wifi_pin_pgm);
         _waitms(100);
      }
   }
}

/*
 * wifi_OK - Check the WiFi adaptor is working and in command mode 
 *           by sending an empty request. 
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_OK() {
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   result = wifi_Send_Command(""); // empty command
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }

   return result;
}

/*
 * wifi_INIT - Initialize and enter command mode (must be called 
 *             before any other WiFi function. Specify the com
 *             port to which the WiFi adaptor is connected (the
 *             Serial Comms parameters must be set in the WIFI 
 *             section of the platform support file).
 *
 * NOTE: Set BRK to -1 to disable the use of BREAK, otherwise it 
 *       should be to the same pin as DI. Set RES and PGM to -1 
 *       to disable their use.
 *
 * Returns a WiFi Request Status Code.
 */

int wifi_INIT(int DI, int DO, int BRK, int RES, int PGM) {
   if (!wifi_init) {
      wifi_pin_di = DI;
      wifi_pin_do = DO;
      wifi_pin_brk = BRK;
      wifi_pin_res = RES;
      wifi_pin_pgm = PGM;
      wifi_RESET(wifi_pin_res);
      wifi_PGM(wifi_pin_pgm);
      s_rxflush(WIFI_PORT);
      wifi_init = 1;
      if (wifi_OK() == wifi_Success) {
         return wifi_Success;
      }
   }
   // something went wrong
   wifi_init = 0;
   return wifi_Err_Unknown;
}

/*
 * wifi_AUTO - same as wifi_INIT() but using the pin functions.
 * On the Propeller 2, we can get the pin configurations from the 
 * platform configuration file automatically. On the Propeller 1,
 * we have to manually specify them by providing the pin functions
 * and/or use wifi_INIT() instead.
 */
int wifi_AUTO() {
   return wifi_INIT(
       wifi_DI_PIN(), 
       wifi_DO_PIN(), 
       wifi_BRK_PIN(), 
       wifi_RES_PIN(),
       wifi_PGM_PIN()
   );
}

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

/*
 * wifi_CLOSE - Terminate an established connection or listener via its 
 *              handle or id (respectively), freeing it to rejoin the 
 *              available connection or listener pools.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CLOSE(int handle_id) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   isprintf(buff,"CLOSE:%u", handle_id);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
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
      isprintf(buff, "POLL:0x%8x", mask);
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
               debug_str("unknown poll response ");
               debug_char(*event);
               debug_char('\n');
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
      debug_str("poll send failed, error = ");
      debug_dec(result);
      debug_char('\n');
#endif
   }
   return wifi_Err_Unknown;
}

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

/*
 * wifi_SEND - Transmit WebSocket/TCP data, or extended HTTP body (after 
 *             REPLY command).
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SEND(int handle, int size, char *data) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   debug_str("DEBUG: Sending SEND: ");
   debug_dec(handle);
   debug_char(' ');
   debug_dec(size);
   debug_char('\n');
#endif
   // assume we can send everything in one SEND
   isprintf(buff,"SEND:%d,%d", handle, size);
   result = wifi_Send_Command_With_Data(buff, data, size);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

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
   debug_str("DEBUG: Sending REPLY: ");
   debug_dec(handle);
   debug_char(' ');
   debug_dec(rcode);
   debug_char(' ');
   debug_dec(total);
   debug_char(' ');
   debug_dec(size);
   debug_char('\n');
#endif
   // assume we can send everything in one REPLY
   isprintf(buff,"REPLY:%d,%d,%d,%d", handle, rcode, total, size);
   result = wifi_Send_Command_With_Data(buff, data, size);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

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
   debug_str("WiFi PATH ");
   debug_dec(handle_id);
   debug_char('\n');
#endif
   isprintf(buff,"PATH:%u", handle_id);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(path, wifi_DATA_SIZE);
   }
   return result;
}

/*
 * wifi_ARG - Retrieve HTTP GET/POST’s name argument (in query or body) on 
 *            connection indicated by handle. The value buffer will be set 
 *            on success, and must be large enough to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_ARG(int handle, char *name, char *value) {
   char buff[CMD_MAXSIZE + 1];
   int result;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   if (strlen(name) > CMD_MAXSIZE - 15) {
      return wifi_Err_Unknown;
   }
#if WIFI_DEBUG
   debug_print("WiFi ARG ", name);
#endif
   isprintf(buff,"ARG:%u,%s", handle, name);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(value, wifi_DATA_SIZE);
   }
   return result;
}

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
#if WIFI_DEBUG > 1         
         // this should never happen ... 
         if ((result == wifi_Success) && (code != 0)) {
            debug_str("incorrect success code = ");
            debug_dec(code);
            debug_char('\n');
         }
#endif
         sent += this;
      }
   }
   return result;
}

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
   debug_print("WiFi SET", setting);
#endif
   isprintf(buff,"SET:%s,%s", setting, value);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

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
   debug_print("WiFi CHECK", setting);
#endif
   isprintf(buff,"CHECK:%s", setting);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Value(value, wifi_DATA_SIZE);
   }
   return result;
}

/*
 * wifi_JOIN - Join a network via the ssid access point using passphrase.
 *
 * NOTE: JOIN may return success even on failure to join the network. 
 * Check station-ipaddr to ensure the adaptor has an IP address (other
 * than 0.0.0.0)
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_JOIN(char *ssid, char *passphrase) {
   char buff[CMD_MAXSIZE + 1];
   int result;
   int code;

   if (!wifi_init) {
      return wifi_Err_Unknown;
   }
   isprintf(buff,"JOIN:%s,%s", ssid, passphrase);
   result = wifi_Send_Command(buff);
   if (result == wifi_Success) {
      result = wifi_Read_Code(&code);
   }
   return result;
}

/*----------------------------------------------------------------------------*/

/*
 * This is a cut-down version of the tiny I/O library, containing only
 * the functions needed by the WiFi library (i.e. an integer version of 
 * sscanf & sprintf plus supporting functions). These functions are
 * called isscanf and iprintf, and are similar to sscanf and sprintf
 * but support only the %d, %u, %x, %c and %s format specifiers.
 *
 * This allows the wifi library to be used with both -lci and -lcix.
 *
 * Currently, these are only used by the wifi library, but in future these 
 * functions may be added to both libci and libcix.
 *
 * See the original header below for credits.
 */

/*
 * Super-simple text I/O for PropGCC, stripped of all stdio overhead.
 * Copyright (c) 2012, Ted Stefanik. Concept inspired by:
 *
 *     very simple printf, adapted from one written by me [Eric Smith]
 *     for the MiNT OS long ago
 *     placed in the public domain
 *       - Eric Smith
 *     Propeller specific adaptations
 *     Copyright (c) 2011 Parallax, Inc.
 *     Written by Eric R. Smith, Total Spectrum Software Inc.
 *
 * MIT licensed (see terms at end of file)
 */

#include <limits.h>
#include <string.h>
#include <stdarg.h>

#define PRINTF_NOT_MEMORY ((char*)0x3000000)

static int _printf_putc(unsigned ch, char* buf);
static int _printf_puts(const char* s, char* buf);
static int _printf_putn(const char* str, int width, unsigned int fillChar, char* origBuf);
static int _printf_putl(unsigned long u, int base, int isSigned, int width, unsigned int fillChar, char* buf);
static int _printf_pad(int width, int used, unsigned int fillChar, char* origBuf);

static int _doprintf(const char* fmt, va_list args, char* origBuf);

static const char* _scanf_getl(const char *str, int* dst, int base, unsigned width, int isSigned);

static int _doscanf(const char* str, const char *fmt, va_list args);


static int _printf_pad(int width, int used, unsigned int fillChar, char* origBuf)
{
    char* buf = origBuf;

    if (width <= 0)
        return 0;
    width -= used;

	while (width-- > 0)
		buf += _printf_putc(fillChar, buf);

    return buf - origBuf;
}


static int _printf_putc(unsigned ch, char* buf)
{
    if ((unsigned long)buf & (unsigned long)PRINTF_NOT_MEMORY)
        putchar(ch);
    else
        *buf++ = ch;

    return 1;
}

static char digits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

static int _printf_putl(unsigned long u, int base, int isSigned, int width, unsigned int fillChar, char* origBuf)
{
	char tmpBuf[12];  // Base must be 10 or 16, so ~4,000,000,000 is greatest number.
   register char* start;
	register char* tmp;
   register int rem;
   int used;
   char* buf;
   int tmpStart;


   
	tmpBuf[11] = 0;

   start = &tmpBuf[10];
	tmp = start;

    if (isSigned && base == 10 && (long)u < 0)
        u = -(long)u;
    else
        isSigned = 0;

	do
    {
#ifdef __CATALINA__
        rem = u % base; u = u / base;
#else
        __asm__ volatile("mov r0,%[_u] \n\t "
                         "mov r1,%[_base] \n\t "
                         "call #__UDIVSI \n\t "
                         "mov %[_u],r0 \n\t "
                         "mov %[_rem],r1"
                         : [_u] "+r" (u), [_rem] "=r" (rem)
                         : [_base] "r" (base)
                         : "r0", "r1");
#endif
		*tmp-- = digits[rem];
	} while (u > 0);

    if (isSigned)
		*tmp-- = '-';

    used = start - tmp;
    buf = origBuf;
    tmpStart = 1;

    if (isSigned && fillChar != ' ')
    {
        buf += _printf_putc('-', buf);
        tmpStart++;
    }
	buf += _printf_pad(width, used, fillChar, buf);
    buf += _printf_puts(tmp + tmpStart, buf);
	buf += _printf_pad(-width, used, ' ', buf);
	return buf - origBuf;
}

static int _printf_putn(const char* str, int width, unsigned int fillChar, char* origBuf)
{
    int len = strlen(str);
    char* buf = origBuf;
	buf += _printf_pad(-width, len, fillChar, buf);
    buf += _printf_puts(str, buf);
	buf += _printf_pad(width, len, fillChar, buf);
	return buf - origBuf;
}

static int _printf_puts(const char* sin, char* buf)
{
    const char* s = sin;
	while (*s)
        _printf_putc(*s++, buf++);
	return s - sin;
}

static int charToInt(char ch)
{
    ch -= '0';
    if (ch >= 10)
        ch -= 'A' - '9' - 1;
    if (ch > 15)
        ch -= 'a' - 'A';
    return ch;
}

static const char* _scanf_getl(const char *str, int* dst, int base, unsigned width, int isSigned)
{
    int isNegative = 0;

    int ch = *str;
    unsigned num;
    int foundAtLeastOneDigit;

    if (isSigned)
    {
        isNegative = (ch == '-');
        if (ch == '+' || ch == '-')
            str++;
    }

    num = 0;
    foundAtLeastOneDigit = 0;
    while (width--)
    {
        ch = *str;
        if (!((ch >= '0' && ch <= '9') ||
              (base == 16 && ((ch >= 'A' && ch <= 'F') || (ch >= 'a' && ch <= 'f')))))
        {
            if (!foundAtLeastOneDigit)
                return 0;
            break;
        }

        foundAtLeastOneDigit = 1;
        num = base * num + charToInt(ch);
        str++;
    }

    if (isNegative)
        *dst = -(int)num;
    else
        *dst = num;

    return str;
}

static int _doprintf(const char* fmt, va_list args, char* origBuf)
{
    char ch;
    char* buf = origBuf;
    int leftJust;
    int width;
    char fillChar;
    int base;
    unsigned long arg;
    unsigned long cch;

    while((ch = *fmt++) != 0)
    {
        if (ch != '%')
        {
            buf += _printf_putc(ch, buf);
            continue;
        }

        ch = *fmt++;

        leftJust = 0;
        if (ch == '-')
        {
            leftJust = 1;
            ch = *fmt++;
        }

        width = 0;
        fillChar = ' ';
        if (ch == '0')
            fillChar = '0';
        while (ch && isdigit(ch))
        {
            width = 10 * width + (ch - '0');
            ch = *fmt++;
        }

        if (!ch)
            break;
        if (ch == '%')
        {
            buf += _printf_putc(ch, buf);
            continue;
        }

        arg = va_arg(args, int);
        base = 16;

        switch (ch)
        {
        case 'c':
            cch = (char)arg;
            arg = (unsigned long)&cch;
            /* Fall Through */
        case 's':
            if (leftJust)
                width = -width;
            buf += _printf_putn((const char*)arg, width, fillChar, buf);
            break;
        case 'd':
        case 'u':
            base = 10;
            /* Fall Through */
        case 'x':
            if (!width)
                width = 1;
            if (leftJust)
                width = -width;
            buf += _printf_putl((unsigned long)arg, base, (ch == 'd'), width, fillChar, buf);
            break;

        }
    }
    
    return buf - origBuf;
}

static int isspace(int ch) 
{
    return (ch == 0 || ch == ' ' || ch == '\f' || ch == '\v' || ch == '\t' || ch == '\r' || ch == '\n');
}

static const char* trim(const char* str) 
{
    while (isspace(*str))
        str++;

    return str;
}

static const char* _scanf_gets(const char *str, char* dst, unsigned width, int gettingChars) 
{
    while (width-- && (gettingChars || !isspace(*str)))
        *dst++ = *str++;

    if (!gettingChars)
        *dst = 0;

    return str;
}

static int _doscanf(const char* str, const char *fmt, va_list args) 
{
    int blocks = 0;
   
    int fch;
    int width;
    int base;
    int isWhiteSpaceOK;
    unsigned long arg;
    int done;
        

    while (str && *str && (fch = *fmt++))
    {
        if (fch != '%')
        {
            if (isspace(fch))
                str = trim(str);
            else if (*str++ != fch)
                break;
            continue;
        }
                
        if (!isdigit(*fmt))
            width = INT_MAX;
        else
            fmt = _scanf_getl(fmt, &width, 10, 11, 0);
                
        fch = *fmt++;
        if (fch != 'c' && fch != '%')
        {
            str = trim(str);
            if (!*str)
                break;
        }
                
        base = 16;
        isWhiteSpaceOK = 0;
        arg = va_arg(args, int);
        done = 0;
        
        switch (fch) 
        {
        case '%':
            if (*str++ != '%')
                done = 1;
            break;
        case 'c':
            isWhiteSpaceOK = 1;
            if (width == INT_MAX)
                width = 1;
            /* Fall Through */
        case 's': 
            if ((str = _scanf_gets(str, (char*)arg, width, isWhiteSpaceOK)))
                blocks++;
            break;
        case 'u':
        case 'd':
            base = 10;
            /* Fall Through */
        case 'x': 
            if ((str = _scanf_getl(str, (int*)arg, base, width, (fch == 'd'))))
                blocks++;;
            break;
        default:
            done = 1;
        }

        if (done)
            break;
    }
    
    return blocks;
}

int isscanf(const char *str, const char *fmt, ...) 
{
    va_list args;
    int blocks;
    
    va_start(args, fmt);
    blocks = _doscanf(str, fmt, args);
    va_end(args);
    
    return blocks;
}

int isprintf(char* buf, const char* fmt, ...)
{
    va_list args;
    int r;

    va_start(args, fmt);
    r = _doprintf(fmt, args, buf);
    va_end(args);

    buf[r] = 0;
    return r;
}

/* +--------------------------------------------------------------------
 * ¦  TERMS OF USE: MIT License
 * +--------------------------------------------------------------------
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * +--------------------------------------------------------------------
 */


/*----------------------------------------------------------------------------*/


