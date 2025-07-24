/*
 * This file is the same as the wifi.h include file, but is included here
 * for easier debugging/modification. It is included by wifi_full.c
 */

#ifndef _WIFI__H
#define _WIFI__H 1

/*
 * The Propeller WiFi module (32420D) is currently supported on the
 * WX Activity board (use -C WX).
 *
 * The Propeller WiFi module (32420S) is currently supported on all 
 * Propeller 2 boards via a P2 WX Adapter board (64007).
 *
 * To use the WiFi program load capabilities on the Propeller 2, the board 
 * must be plugged into the header on pins 56-63. This means that the pins 
 * used for serial comms HAVE to be pins 62 & 63. However, on the P2-EC32MB
 * pins 56 and 57 (RES and PGM) are used for PSRAM, so to be able to reset 
 * the board, a different base pin must be used (e.g. base pin 32).
 *
 * NOTE: Wifi Adaptor cannot be used to upload binaries over WiFi, and also
 * the serial CMD interface does not work correctly on the Propeller 2 when 
 * base pin 56 is used and a Rev B PropPlug is plugged in. Both work ok with 
 * a Rev E Prop Plug.
 */

// WiFi configuration parameters

//#define wifi_DATA_SIZE 1024 // Minimum size for returned data buffers
#define wifi_DATA_SIZE 512 // ok up to 900, but 950 causes failures - WHY???

/*
 * NOTES:
 *
 *  1. Pull _WIFI_DI low for ≥ 30/BaudRate seconds to send a BREAK which
 *     will enter Command mode. This can be used to exit Transparent mode.
 *
 *  2. Pull _WIFI_PGM low rapidly, 4 times in a row to put Wi-Fi module 
 *     into AP+STA mode. 
 */

// WiFi Command Tokens:

#define TKN_JOIN     0xEF
#define TKN_CHECK    0xEE
#define TKN_SET      0xED
#define TKN_POLL     0xEC
#define TKN_PATH     0xEB
#define TKN_SEND     0xEA
#define TKN_RECV     0xE9
#define TKN_CLOSE    0xE8
#define TKN_LISTEN   0xE7
#define TKN_ARG      0xE6
#define TKN_REPLY    0xE5
#define TKN_CONNECT  0xE4

// WiFi Parameter Tokens:

#define TKN_INT8     0xFD // followed by single byte
#define TKN_UINT8    0xFC // followed by single byte
#define TKN_INT16    0xFB // followed by two bytes (low byte first)
#define TKN_UINT16   0xFA // followed by two byte (low byte first)s
#define TKN_INT32    0xF9 // followed by four byte (low byte first)s
#define TKN_UINT32   0xF8 // followed by four byte (low byte first)s

// WiFi String tokens:

#define TKN_HTTP     0xF7 // "HTTP"
#define TKN_WS       0xF6 // "WS"
#define TKN_TCP      0xF5 // "TCP"
#define TKN_STA      0xF4 // "STA"
#define TKN_AP       0xF3 // "AP"
#define TKN_STA_AP   0xF2 // “STA+AP"

// Other tokens:

#define TKN_CMD      0xFE // this is the default - it can be redefined!

// GPIO pin numbers:

#define CPIO_PGM      0 // /PGM
#define GPIO_RX       1 // aka GPIO_DO
#define GPIO_DO       1 // aka GPIO_RX
#define GPIO_DBG      2
#define GPIO_TX       3 // aka GPIO_DI
#define GPIO_DI       3 // aka GPIO_TX
#define GPIO_PS       4 // aka GPIO_SEL
#define GPIO_SEL      4 // aka GPIO_PS
#define GPIO_ASC      5
#define GPIO_DTR     12 // /DTR
#define GPIO_CTS     13 // /CTS
#define GPIO_P14     14 //  ???
#define GPIO_RTS     15 // /RTS

// WiFi Request Status Codes:

#define wifi_Success        0 // Successful request
#define wifi_Err_Inv_Req    1 // Invalid request
#define wifi_Err_Inv_Arg    2 // Invalid argument
#define wifi_Err_Arg_Cnt    3 // Wrong argument count
#define wifi_Err_No_Lstn    4 // No free listener
#define wifi_Err_No_Conn    5 // No free connection
#define wifi_Err_Look_Fail  6 // Lookup failed
#define wifi_Err_Conn_Fail  7 // Connect failed
#define wifi_Err_Send_Fail  8 // Send failed
#define wifi_Err_Inv_State  9 // Invalid state
#define wifi_Err_Inv_Size  10 // Invalid size
#define wifi_Err_Disconn   11 // Disconnected
#define wifi_Err_Not_Impl  12 // Unimplemented
#define wifi_Err_Busy      13 // Busy
#define wifi_Err_Internal  14 // Internal error
#define wifi_Err_Timeout   15 // Serial Comms Timeout
#define wifi_Err_Unknown   16 // Unknown error

// WiFi Network Codes (all other codes are also "Undefined"):

#define wifi_Net_No_Error      0 No error
#define wifi_Net_Memory_Err   -1 Out of memory error
#define wifi_Net_Undefined    -2 Undefined
#define wifi_Net_Timeout      -3 Timeout
#define wifi_Net_Routing_Err  -4 Routing problem
#define wifi_Net_In_Progress  -5 Operation in progress
#define wifi_Net_Max_Exceeded -7 Total number exceeds the set maximum
#define wifi_Net_Conn_Abort   -8 Connection aborted
#define wifi_Net_Conn_Reset   -9 Connection reset
#define wifi_Net_Conn_Closed  -10 Connection closed
#define wifi_Net_Not_Conn     -11 Not connected
#define wifi_Net_Inv_Arg      -12 Illegal argument
#define wifi_Net_UDP_Send_Err -14 UDP send error
#define wifi_Net_Already_Conn -15 Already connected
#define wifi_Net_SSL_HS_Fail  -28 ssl handshake failed
#define wifi_Net_SSL_App_Inv  -61 ssl application invalid


// pin definition functions:


int wifi_DO_PIN();

int wifi_DI_PIN();

int wifi_PGM_PIN();

int wifi_RES_PIN();

int wifi_BRK_PIN();


// Initialization and General functions:


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

int wifi_INIT(int DI, int DO, int BRK, int RES, int PGM);

/*
 * wifi_AUTO - same as wifi_INIT() but using the pin functions.
 * On the Propeller 2, we can get the pin configurations from the 
 * platform configuration file automatically. On the Propeller 1,
 * we have to manually specify them by providing the pin functions
 * and/or use wifi_INIT() instead.
 */
int wifi_AUTO();

/*
 * wifi_OK - Check the WiFi adaptor is working and in command mode 
 *           by sending an empty request. 
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_OK();

/*
 * wifi_BREAK - Send a BREAK (can be used to exit transparent mode).
 */
void wifi_BREAK(); 

/*
 * wifi_RESET - Put RES low to reset the WiFi module
 */
void wifi_RESET(); 

/*
 * wifi_PGM - Pull PGM down 4 times rapidly to force AP+STA mode.
 */
void wifi_PGM();

// Connections functions:


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
int wifi_LISTEN(char protocol, char *path, int *id);

/*
 * wifi_CONNECT - Attempt a TCP connection to address on port.
 *                On wifi_Success, handle will be updated with the
                  handle of the TCP connection.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CONNECT(char *address, int port, int *handle); 

/*
 * wifi_CLOSE - Terminate an established connection or listener via its 
 *              handle or id (respectively), freeing it to rejoin the 
 *              available connection or listener pools.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CLOSE(int handle_id);

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
int wifi_POLL(int mask, char *event, int *handle , int *value);

/*
 * wifi_RECV - Retrieve incoming HTTP body or WebSocket/TCP data. The data
 *             buffer will be updated on success, and must be at least max
 *             bytes long.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_RECV(int handle, int max, char *data, int *size);

/*
 * wifi_SEND - Transmit WebSocket/TCP data, or extended HTTP body (after 
 *             REPLY command).
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SEND(int handle, int size, char *data);

/*
 * wifi_REPLY - Transmit WebSocket/TCP data, or extended HTTP body
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_REPLY(int handle, int rcode, int total, int size, char *data);


// Web or HHTP functions:


/*
 * wifi_PATH - Retrieve the path associated with a connection handle or 
 *             listener id. The path buffer will be set on success, and
 *             must be large enough to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_PATH(int handle_id, char *path);


// HHTP functions:


/*
 * wifi_ARG - Retrieve HTTP GET/POST’s name argument (in query or body) on 
 *            connection indicated by handle. The value buffer will be set 
 *            on success, and must be large enough to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_ARG(int handle, char *name, char *value);

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
int wifi_SEND_DATA(int handle, int rcode, int total, char *data);


// Settings functions:


/*
 * wifi_SET - Change the setting to value. But see also the convenience
 *            functions (defined below) which can be used for many common
 *            set requests.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_SET(char *setting, char *value);

/*
 * wifi_CHECK - Retrieve the current value of a setting. See also the 
 *              Convenience functions (defined below) for many common 
 *              check requests. The value field is set on success, 
 *              and must be of a suitable size to hold the result.
 *
 * Returns a WiFi Request Status Code (wifi_Err_Unknown if
 * WiFi has not been initialized)
 */
int wifi_CHECK(char *setting, char *value);

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
int wifi_JOIN(char *ssid, char *passphrase);


// Convenience function definitions:

/*
 * wifi_SET_SSID - Convenience function for setting module ssid.
 *                 ssid can be up to 32 characters.
 *
 */
#define wifi_SET_SSID(ssid) wifi_SET("module-name", ssid)

/*
 * wifi_TRANS - Convenience function for entering transparent mode.
 *              Once in tansparent mode, normal serial functions 
 *              can be used. Call wifi_Break to exit transparent mode.
 *
 */
#define wifi_TRANS() wifi_SET("cmd-enable","0")

/*
 * wifi_MODE_XXX - Convenience functions for setting WiFi mode XXX
 */
#define wifi_MODE_STA() wifi_SET("wifi-mode","STA")
#define wifi_MODE_AP() wifi_SET("wifi-mode","AP")
#define wifi_MODE_AP_STA() wifi_SET("wifi-mode","STA+AP")

/*
 * wifi_XXXX - Convenience functions for checking (retrieving) values.
 *             Note that value must be a pointer to a char array
 *             of a suitable size to receive the results.
 *
 * NOTE: Only the following pins are connected when the WX adaptor
 *       board (64007) is used with the WiFi adaptor on the Propeller 2:
 *
 *          RES  _WIFI_Base + 0   n/a       
 *          PGM  _WIFI_Base + 1  GPIO0  
 *          DO   _WIFI_Base + 7  GPIO1  
 *          DI   _WIFI_Base + 6  GPIO3  
 */
#define wifi_VERSION(value) wifi_CHECK("version", value)
#define wifi_MODULE(value) wifi_CHECK("module-name", value)
#define wifi_MODE(value) wifi_CHECK("wifi-mode", value)
#define wifi_SSID(value) wifi_CHECK("wifi-ssid", value)
#define wifi_STA_IP(value) wifi_CHECK("station-ipaddr", value)
#define wifi_STA_MAC(value) wifi_CHECK("station-macaddr", value)
#define wifi_AP_IP(value) wifi_CHECK("softap-ipaddr", value)
#define wifi_AP_MAC(value) wifi_CHECK("softap-macaddr", value)
#define wifi_STARTCHAR(value) wifi_CHECK("cmd-start-char", value)
#define wifi_ENABLE(value) wifi_CHECK("cmd-enable", value)
#define wifi_EVENTS(value) wifi_CHECK("cmd-events", value)
#define wifi_LOAD_BAUD(value) wifi_CHECK("loader-baud-rate", value)
#define wifi_BAUD(value) wifi_CHECK("baud-rate", value)
#define wifi_STOPBITS(value) wifi_CHECK("stop-bits", value)
#define wifi_DBG_BAUD(value) wifi_CHECK("dbg-baud-rate", value)
#define wifi_DBG_STOPBITS(value) wifi_CHECK("dbg-stop-bits", value)
#define wifi_RESET_PIN(value) wifi_CHECK("reset-pin", value)
#define wifi_CONNECT_LED(value) wifi_CHECK("connect-led-pin", value)
#define wifi_RX_PULLUP(value) wifi_CHECK("rx-pullup", value)
#define wifi_GPIO0(value) wifi_CHECK("pin-gpio0", value)
#define wifi_GPIO1(value) wifi_CHECK("pin-gpio1", value)
#define wifi_GPIO2(value) wifi_CHECK("pin-gpio2", value)
#define wifi_GPIO3(value) wifi_CHECK("pin-gpio3", value)
#define wifi_GPIO4(value) wifi_CHECK("pin-gpio4", value)
#define wifi_GPIO5(value) wifi_CHECK("pin-gpio5", value)
#define wifi_GPIO12(value) wifi_CHECK("pin-gpio12", value)
#define wifi_GPIO13(value) wifi_CHECK("pin-gpio13", value)
#define wifi_GPIO14(value) wifi_CHECK("pin-gpio14", value)
#define wifi_GPIO15(value) wifi_CHECK("pin-gpio15", value)

#endif
