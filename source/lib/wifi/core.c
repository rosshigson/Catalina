#include "wificonf.h"

int wifi_init     = 0;  // set to 1 when WiFi module initialized.
int wifi_pin_di   = -1; // set to -1 if not initialized/used
int wifi_pin_do   = -1; // set to -1 if not initialized/used
int wifi_pin_res  = -1; // set to -1 if not initialized/used
int wifi_pin_pgm  = -1; // set to -1 if not initialized/used
int wifi_pin_brk  = -1; // set to -1 if not initialized/used

#if WIFI_DEBUG

void wifi_debug_str(char *str) {
  s_str(USER_PORT, str);
}
void wifi_debug_dec(int dec) {
  s_dec(USER_PORT, dec);
}
void wifi_debug_hex(int hex, int digits) {
  s_hex(USER_PORT, hex, digits);
}

void wifi_debug_char(int ch) {
  s_tx(USER_PORT, ch);
}

void wifi_debug_print(char *str1, char *str2) {
   wifi_debug_str("DEBUG: ");
   wifi_debug_str(str1);
   if (strlen(str2) > 0) {
      wifi_debug_str(" \"");
      wifi_debug_str(str2);
      wifi_debug_str("\"");
   }
   wifi_debug_str("\n");
}

#endif

// send command string preceded by CMD_BEGIN and terminated by CMD_END
int wifi_Send_Command(char *cmd) {
   char buff[CMD_MAXSIZE + 1];

   if (strlen(cmd) > CMD_MAXSIZE) {
#if WIFI_DEBUG
      wifi_debug_print("command too long", cmd);
#endif
      return wifi_Err_Unknown;
   }
   isprintf(buff,"%c%s%c", CMD_BEGIN, cmd, CMD_END); 
#if WIFI_DEBUG > 1
   wifi_debug_print("sending", cmd);
#endif
   s_str(WIFI_PORT, buff);
   s_txflush(WIFI_PORT);
   return wifi_Success;
}

// send Command With up to size bytes of data (note data need not be 
// null terminated)
int wifi_Send_Command_With_Data(char *cmd, char *data, int size) {
   char buff[CMD_MAXSIZE + 1];
   int i;

   if (strlen(cmd) > CMD_MAXSIZE) {
#if WIFI_DEBUG
      wifi_debug_print("command too long", cmd);
#endif
      return wifi_Err_Unknown;
   }
   isprintf(buff,"%c%s%c", CMD_BEGIN, cmd, CMD_END); 
#if WIFI_DEBUG > 1
   wifi_debug_print("sending", cmd);
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
      wifi_debug_hex(data[i], 2);
      wifi_debug_char(' ');
#endif
   }
   s_txflush(WIFI_PORT);
   return wifi_Success;
}

// wait for a wifi character for a specified time (millisecnds)
int wifi_timed_rx(int timeout) {
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
   wifi_debug_hex(ch, 2);
   wifi_debug_char(' ');
#endif
   return ch;
}

// read a response that is either a success 'S' with a value
// or an 'E' with an error code
int wifi_Read_Value(char *value, int max) {
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
         wifi_debug_print("timeout waiting for response", "");
#endif
         return wifi_Err_Timeout;
      }
   }
   while (count < max) {
      ch = wifi_timed_rx(CMD_TIMEOUT);
      if (ch < 0) {
#if WIFI_DEBUG
         wifi_debug_print("timeout waiting for response", "");
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
   wifi_debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// read a response that is either a success 'S' with a success code 
// (which should always be 0) or an 'E' with an error code.
int wifi_Read_Code(int *code) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   
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
                  wifi_debug_print("unexpected success code ", buff);
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
   wifi_debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

// wait for a response for a specified time (milliseconds) that is 
// either a success 'S' with a handle or an 'E' with an error code
int wifi_Read_Id(int *id, int timeout) {
   char buff[CMD_MAXSIZE + 1];
   int ch = 0;
   int count = 0;
   char result;
   unsigned int code = 0;

#if WIFI_DEBUG > 1
   wifi_debug_print("reading ", "");
#endif
   while (ch != RSP_BEGIN) {
      // use the specified timeout for first character of response
      // ( thereafter, use the normal CMD_TIMEOUT)
      ch = wifi_timed_rx(timeout);
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
         // decode response so we can return a success
         // and the id or an error indication
         buff[count] = 0; // terminate the response
#if WIFI_DEBUG > 1
         wifi_debug_print("response", buff);
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
   wifi_debug_print("response too long", "");
#endif
   return wifi_Err_Unknown;
}

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
      _waitms(500);
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

