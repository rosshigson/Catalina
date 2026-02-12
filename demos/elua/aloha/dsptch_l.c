/*
 * my_dispatch_Lua_bg - A custom Lua/ALOHA dispatcher. Dispatches ALOHA
 *                      serial requests using information loaded from
 *                      the "service_index" and "port_n_index" tables
 *                      (n = 0 .. 1 if 2 port serial is used, or 0 .. 7
 *                      if 8 port serial is used) as well as RPC requests 
 *                      using information loaded from the "rpc_network" table
 *                      (if __CATALINA_libwifi is defined)
 */
#include <ctype.h>
#include <string.h>
#include <service.h>
#include <serial.h>
#include <lua.h>
#include <hmi.h>

#include "aloha.h"

#if defined(__CATALINA_libwifi)
#include <wifi.h>
#include <base64.h>
#if defined(__CATALINA_P2_WIFI2)
#define my_printf printf // use normal HMI printf on P2_WIFI2
#else
#define my_printf t_printf // use t_printf (port 1) on other platforms
#endif
#else
#define my_printf printf // use normal HMI printf on other platforms
#endif

#if defined(__CATALINA_libserial8)
#define PORTS 8
#elif defined(__CATALINA_libserial2)
#define PORTS 2
#else
#error dispatch_Lua requires a serial plugin (-lserial2 or -lserial8)
#endif

#if USER_PORT == 0
#else
#endif

#define REMOTE_TIMEOUT 1000  // timeout on response after sending request
#define PORT_TIMEOUT    200  // timeout on rx after receiving first byte

#define PATH_MAX        256  // maximum length of rpc path

#if defined(__CATALINA_libwifi)
#define REMOTE_MAX     2048  // maximum that can be sent/received
                             // (NOTE: http => must include bas64 encoding)
#define IP_RETRIES      30   // times to retry to get a valid IP addr
#define IP_RETRY_SECS    3   // seconds between retries
#define POLL_INTERVAL  250   // msecs between WiFi Polls
#define RETRY_INTERVAL 200   // msecs between RPC reply polls
#define REPLY_RETRIES (5*1000/RETRY_INTERVAL) // max 5 seconds for RPC reply
#define WIFI_INFO        1   // 1 to display WiFi info messages
#else
#define REMOTE_MAX     2048  // maximum size of message that can be received 
                             // (NOTE: serial => can be any size)
#endif

#define DEBUG_INFO       0   // 1 to enable debug messages

// set to 1 if we should check the port for messages ...
static int port_in_use[PORTS];

// set to 1 if we should poll for incoming WiFi events (i.e. RPC calls)
static int wifi_listening = 0;

#if defined(__CATALINA_libwifi)
// my IP address (filled in if we join a network, otherwise use the default
static char my_ip[32] = "192.168.4.1";
#endif

static int num_services = 0;

// strdup replacment (strdup is not ANSI!)
static char *strdup(const char *s) {
    char *p = malloc(strlen(s) + 1);
    if(p) { strcpy(p, s); }
    return p;
}

#if defined(__CATALINA_libwifi)

// rpc_recv - retrieve data from in the body of an RPC POST using wifi_RECV.
//            Note that the data is base64 encoded, and will be decoded. 
// Returns size of decoded data if ok, or -1 if buffer not large enough
int rpc_recv(int handle, char *ser_in, int max) {
   char recv_data[REMOTE_MAX + 1];
   int recv_size = 0;
   int result;
   int len = 0;
   char encoded[REMOTE_MAX + 1]; // temp space for base64 data 
  
   // assume the data can be fectched in one RECV
   result = wifi_RECV(handle, REMOTE_MAX, encoded, &len); 
#if DEBUG_INFO   
   if (result != wifi_Success) {
      my_printf("WiFi RECV failed, error = %d\n", result);
      len = 0;
   }
#endif   
   // zero terminate received base64 data
   encoded[len] = 0;
#if DEBUG_INFO
   my_printf("rpc_recv:\n");
   my_printf("base64 data = %s\n", encoded);
   my_printf("base64 length = %d\n", len);
#endif
   // decode base64 data into ser_in
   result = decode_buff(encoded, len, ser_in, max);
#if DEBUG_INFO
   if (result >= 0) {
      my_printf("decoded data = '%s'\n", ser_in);
      my_printf("decoded length = %d\n", result);
   }
   else {
      my_printf("decoding base64 failed\n");
   }
#endif
   return result;

}

// rpc_reply - send data from using wifi_REPLY and wifi_SEND (if necessary).
//             Note that the data must be base64 encoded. 
// Returns size of enccoded data if ok, or -1 if buffer not large enough
int rpc_reply(int handle, int len_out, char *ser_out, int max) {
   int recv_size = 0;
   int result;
   int len = 0;
   char encoded[REMOTE_MAX + 1]; // temp space for base64 data 
 
#if DEBUG_INFO
   my_printf("rpc_reply:\n");
   my_printf("raw data = %s\n", ser_out);
   my_printf("raw length = %d\n", len_out);
#endif
   // encode ser_out data into encoded
   if ((len = encode_buff(ser_out, len_out, encoded, max, 0)) >= 0) {
      encoded[len] = '\0'; // zero terminate base64 data
#if DEBUG_INFO
      my_printf("base64 data = '%s'\n", encoded);
      my_printf("base64 length = %d\n", len);
#endif
      if (wifi_SEND_DATA(handle, 200, len, encoded) != wifi_Success) {
         len = -1;
      }
   }
   return len;
}

// rpc_call - generate a POST request to make an RPC call
//            RETURNS the length of the decoded response (in ser_out) or -1.
int rpc_call(char *ip, char *name, 
             int len_in, char *ser_in, 
             int len_out, char *ser_out) {
   int handle;
   int rhandle;
   int result;
   int value;
   char encoded[REMOTE_MAX]; // temp space for base64 data 
   char send_data[REMOTE_MAX + PATH_MAX + 64 + 1]; // allow for http header
   int sent;
   int len;
   int send_len;
   char recv_data[REMOTE_MAX + PATH_MAX + 64 + 1]; // allow for http header
   int recv_size;
   int body_size;
   char *body;
   char *cont;
   int cont_len;
   int poll_retries;
   int data_retries;
   char event;
   int i;

   // encode ser_in data into encoded
#if DEBUG_INFO
   my_printf("rpc_call:\n");
   my_printf("raw data = %s\n", ser_in);
   my_printf("raw length = %d\n", len_in);
   my_printf("data:\n");
   for (i = 0; i < len_in; i++) {
     my_printf("[%2X] ", ser_in[i]);
   }
   my_printf("\n");
#endif
   if ((len = encode_buff(ser_in, len_in, encoded, REMOTE_MAX, 0)) >= 0) {
      encoded[len] = '\0';
#if DEBUG_INFO
      my_printf("base64 data = %s\n", encoded);
      my_printf("base64 length = %d\n", len);
#endif
      // TCP connect - must use port 80 ...
#if DEBUG_INFO
         my_printf("WiFi CONNECT to %s\n", ip);
#endif         
      result = wifi_CONNECT(ip, 80, &handle);
      if (result == wifi_Success) {
#if DEBUG_INFO
         my_printf("connected ok, handle = %d\n", handle);
#endif         
         // send POST ... 
         send_len = isprintf(send_data,
                             "POST /rpc/%s HTTP/1.1\r\n"
                             "Host: %s \r\n"
                             "Content-Length: %d\r\n"
                             "\r\n"
                             "%s",
                             name, ip, len, encoded);
#if DEBUG_INFO
         my_printf("RPC request = '%s'\n", send_data);
#endif         
         result = wifi_SEND(handle, strlen(send_data), send_data);
         if (result != wifi_Success) {
#if DEBUG_INFO
            my_printf("wifi SEND failed, result = %d\n", result);
#endif
            return -1;
         }
         len = 0;
         // poll for response - abandon if we get an 'X' (DISCONNECT) 
         // or after a certain number of poll retries
         for (poll_retries = 0; poll_retries < REPLY_RETRIES; poll_retries++) {
            event = 'N';
            if ((wifi_POLL(1<<handle, &event, &rhandle, &value)) == wifi_Success) {
               if (event == 'D') {
#if DEBUG_INFO
                  my_printf("DATA: %d %d\n", rhandle, value);
#endif
                  cont_len = 0;
                  data_retries = 0;
                  while (1) {
                     recv_size = 0;
                     result = wifi_RECV(rhandle, REMOTE_MAX, recv_data, &recv_size); 
                     if ((result == wifi_Success) &&  (cont_len == 0) &&  (recv_size > 0)) {
#if DEBUG_INFO
                        recv_data[recv_size]='\0';
                        my_printf("data:\n'%s'\n", recv_data);
#endif
                        // must be first reply - decode the header
                        // first, check the response code
                        if ((isscanf(recv_data, "HTTP/1.1 %d OK", &result) != 1)
                        ||  (result != 200)) {
#if DEBUG_INFO
                           my_printf("Response Code error = '%s'\n", recv_data);
#endif
                           len = 0;
                           break;
                        }
                        // then extract the content length
                        if (((cont = strstr(recv_data, "Content-Length: ")) == NULL)
                        ||  (isscanf(cont, "Content-Length: %d", &cont_len) != 1)) {
#if DEBUG_INFO
                           my_printf("Content Length error = '%s'\n", cont);
#endif
                           len = 0;
                           break;
                        }
                        // then find the start of the base64 data (past the header)
                        if ((body = strstr(recv_data, "\r\n\r\n")) == NULL) {
#if DEBUG_INFO
                           my_printf("Body error, '%s'\n", body);
#endif
                           len = 0;
                           break;
                        }
                        body += 4; // skip "\r\n\r\n");
                        body_size = recv_size - (body - recv_data);
                        // add body to encoded data
                        memcpy(&encoded[len], body, body_size);
                        len = body_size;
                        // zero terminate received data
                        encoded[len] = 0;
#if DEBUG_INFO
                        my_printf("cont len = %d\n", cont_len);
                        my_printf("len now  = %d\n", len);
                        my_printf("data now = '%s'\n", encoded);
#endif
                     }
                     else if ((result == wifi_Success) && (cont_len > 0) && (recv_size > 0)) {
#if DEBUG_INFO
                        recv_data[recv_size]='\0';
                        my_printf("data:\n'%s'\n", recv_data);
#endif
                        // add body to encoded data
                        memcpy(&encoded[len], recv_data, recv_size);
                        len += recv_size;
                        // zero terminate received data
                        encoded[len] = 0;
#if DEBUG_INFO
                        my_printf("len now  = %d\n", len);
                        my_printf("data now = '%s'\n", encoded);
#endif
                     }
                     else {
                        data_retries++;
                        if (data_retries > REPLY_RETRIES) {
#if DEBUG_INFO
                           my_printf("WiFi RECV failed, error = %d\n", result);
#endif
                           len = 0;
                           break;
                        }
                        else {
#if DEBUG_INFO
                           my_printf("WiFi RECV failed, error = %d - WILL RETRY\n", result);
#endif
                           _waitms(RETRY_INTERVAL);
                        }
                     }
                     if (len == cont_len) {
                        // we got all the data we expected
                        break;
                     }
                  }
                  // close the handle
                  if ((result = wifi_CLOSE(rhandle)) != wifi_Success) {
#if DEBUG_INFO
                     my_printf("failed to close handle %d\n", rhandle);
#endif                  
                  }
                  if (len >= 0) {
                     // decode base64 data into ser_out
                     len = decode_buff(encoded, len, ser_out, len_out);
                     if (len >= 0) {
                        ser_out[len] = '\0';
                     }
#if DEBUG_INFO
                     my_printf("raw data = '%s'\n", ser_out);
                     my_printf("raw length = %d\n", len);
#endif                     
                     return len; // success
                  }
               }
               else if (event == 'X') {
#if DEBUG_INFO
                  my_printf("DISCONNECT: %d %d\n", rhandle, value);
#endif                  
                  // don't wait any longer
                  len = 0;
                  break;
               }
#if DEBUG_INFO
               else {
                  my_printf("EVENT '%c': %d %d\n", event, rhandle, value);
               }
#endif                  
            }
            _waitms(RETRY_INTERVAL);
         }
         result = wifi_CLOSE(handle);
#if DEBUG_INFO
         if (result != wifi_Success) {
            my_printf("failed to close RPC handle %d\n", handle);
         }
#endif
      }
#if DEBUG_INFO
      else {
         my_printf("WiFi CONNECT failed, result = %d\n", result);
      }
#endif
   }
#if DEBUG_INFO
   else {
      my_printf("encode failed, result = %d\n", len);
   }
#endif
   return -1;
}

#endif

void my_dispatch_Lua_bg(lua_State *L, svc_list_t list, char *bg) {
   request_t *rqst_ptr = REQUEST_BLOCK(_cogid());
   long req;
   int int_id;
   int svc_type;
   int svc_port;
   int svc_handle;
   long param;
   int result;
   int isnum;
   int port;
   char event;
   int handle;
   int value;
   static int sq = 1;
   int msg;
   int i;

   // wait for a request (i.e. non-zero value in request long,
   // or a character to arrive at one of the the ports if
   // serial is enabled, or a WiFi event if WiFi is enabled)
   do {
      if (bg != NULL) {
         // call background task
         lua_getglobal(L, bg);
         result = lua_pcall(L, 0, 0, 0);
         if (result != LUA_OK) {
            my_printf("error %s running bg task '%s'\n", 
                lua_tostring(L, -1), bg);
         }
      }
#ifdef __CATALINA_lthreads
      _thread_yield();
#endif
#if defined(__CATALINA_DISABLE_SERIAL)
      port = -1;
#else
      // check serial ports
      port = -1;
      for (i = 0; i < PORTS; i++) {
        if (port_in_use[i]) {
           //my_printf("%d ", port);
           if (aloha_rxcount(i) > 0) {
              port = i;
              //my_printf("message on port %d\n", port);
              break; // we have a message
           }
        }
      }
#endif
      // check for WiFi events
      event = 'N';
      if ((port < 0) && (wifi_listening)) {
#if defined(__CATALINA_libwifi)
        wifi_POLL(0, &event, &handle, &value);
        _waitms(POLL_INTERVAL);
#endif        
      }
      // check for registry requests
      req = 0;
      if ((port < 0) && (event != 'P')) {
         req = rqst_ptr->request;
      }
   } while ((req == 0) && (port == -1) && (event != 'P'));

   if (port >= 0) {
#if !defined(__CATALINA_DISABLE_SERIAL)
      // a character has arrived at the port, so get the message
      int sq;
      int res;
      int len_in;
      unsigned int len_out;
      int ms = PORT_TIMEOUT;
      char ser_in[REMOTE_MAX+1];
      char ser_out[REMOTE_MAX+1];
      const char *str;
      int i;
#if DEBUG_INFO
      my_printf("ALOHA call\n");
#endif
      res = aloha_rx(port, &int_id, &sq, &len_in, ser_in, REMOTE_MAX, ms);
      if (res == 0) {
         if (int_id > 0) {
            if (int_id <= num_services) {
               const char *out;
               unsigned int len;
               svc_type = list[int_id-1].svc_type;
               if ((svc_type == SERIAL_SVC)
               ||  (svc_type == REMOTE_SVC)) {
                  // execute function and return result
                  lua_getglobal(L, list[int_id-1].name);
                  // parameter is a Lua string (may contain embedded zeroes)
                  lua_pushlstring(L, ser_in, len_in);
                  result = lua_pcall(L, 1, 1, 0);
                  if (result != LUA_OK) {
                     my_printf("error '%s' running function '%s'\n", 
                            lua_tostring(L, -1), 
                            list[int_id].name);
                  }
                  // result is a Lua string (may contain embedded zeroes)
                  str = lua_tolstring(L, -1, &len_out);
                  if (str == NULL) {
                     my_printf("function '%s' should return a string\n",
                     list[int_id-1].name);
                  }
                  else if (len_out >= REMOTE_MAX) {
                     my_printf("function '%s' returned too long a string\n",
                     list[int_id-1].name);
                  }
                  else {
                     // copy result, include terminating zero
                     memcpy(ser_out, str, len_out+1);
                  }
                  // pop returned value
                  lua_pop(L, 1); 
                  // return result to the port we got request from
                  aloha_tx(port, int_id, sq, len_out, ser_out);
               }
               else {
                  // function is not a serial or remote service
                  my_printf("function '%s' cannot be called remotely\n",
                  list[int_id-1].name);
               }
            }
            else {
               // no function with that id
               my_printf("no function with id %d for remote call\n", int_id);
            }
         }
         else {
            // zero is an invalid id
            my_printf("attempt to call service 0 in remote call\n");
         }
      }
      else {
         //my_printf("result %d receiving remote call\n", res);
      }
#endif
   }

#if defined(__CATALINA_libwifi)
   else if (event == 'P') {
      // a WiFi RPC call (POST) has arrived
      int res;
      int len_in;
      unsigned int len_out;
      char path[PATH_MAX+1];
      char ser_in[REMOTE_MAX+1];
      char ser_out[REMOTE_MAX+1];
      const char *str;
      int i;

#if DEBUG_INFO
      my_printf("RPC call\n");
#endif      
      if ((wifi_PATH(handle, path) == wifi_Success) && (strlen(path) > 5)) {
         int id;
#if DEBUG_INFO
         my_printf("POST: %d %d to %s\n", handle, value, path);
#endif      
         i = 0;
         // find id by comparing names with path (AFTER initial "/rpc/")
         while ((id = (list[i].svc_id) != 0) 
         &&     (   (list[i].svc_handle != value)
                 || (strcmp(list[i].name, &path[5]) != 0))) {
            i++;
         }
         if (id != 0) {
            res = rpc_recv(handle, ser_in, REMOTE_MAX);
            if (res >= 0) {
               const char *out;
               unsigned int len;
               len_in = res;
               svc_type = list[i].svc_type;
               if (svc_type == RPC_SVC) {
                  // execute function and return result
                  lua_getglobal(L, list[i].name);
                  // parameter is a Lua string (may contain embedded zeroes)
                  lua_pushlstring(L, ser_in, len_in);
                  result = lua_pcall(L, 1, 1, 0);
                  if (result != LUA_OK) {
                     my_printf("error '%s' running function '%s'\n", 
                            lua_tostring(L, -1), 
                            list[i].name);
                  }
                  // result is a Lua string (may contain embedded zeroes)
                  str = lua_tolstring(L, -1, &len_out);
                  if (str == NULL) {
                     my_printf("function '%s' should return a string\n",
                     list[i].name);
                  }
                  else if (len_out >= REMOTE_MAX) {
                     my_printf("function '%s' returned too long a string\n",
                     list[i].name);
                  }
                  else {
                     // copy result, include terminating zero
                     memcpy(ser_out, str, len_out+1);
                  }
                  // pop returned value
                  lua_pop(L, 1); 
                  // return result to the port we got request from
                  res = rpc_reply(handle, len_out, ser_out, REMOTE_MAX);
                  if (res <= 0) {
                     my_printf("result %d sending RPC data\n", res);
                  }
               }
               else {
                  // function is not an RPC service
                  my_printf("function '%s' cannot be called remotely\n",
                  list[i].name);
               }
            }
            else {
               my_printf("failed to receive RPC data, result = %d\n", res);
            }
         }
         else {
            // could not find path
            my_printf("RPC path '%s' unknown\n", path);
         }
      }
      else {
         my_printf("failed to retrieve RPC path\n");
      }
   }
#endif 

   else if (req > 0) {
      // a registry request has arrived
#if DEBUG_INFO
      my_printf("registry call\n");
#endif
      // get the internal id and parameter
      int_id = req>>24;      // internal id is upper 8 bits
      if (int_id > 0) {
         svc_type = list[int_id-1].svc_type;
         svc_port = list[int_id-1].svc_port;
      }
      switch (svc_type) {
         case SHORT_SVC :
            {
#if DEBUG_INFO
               my_printf("short svc\n");
#endif               
               // parameter is lower 24 bits
               param  = req&0xFFFFFF; 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushinteger(L, param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = result;
            }
            break;
         case LONG_SVC :
            {
#if DEBUG_INFO
               my_printf("long svc\n");
#endif               
               // param is 32 bit long pointed to by lower 24 bits
               param  = *(long *)(req&0xFFFFFF); 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushinteger(L, param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = result;
            }
            break;
         case LONG_2_SVC :
            {
               // param is a pointer to a structure with two parameters
               long_param_2_t *tmp = (long_param_2_t *)(req&0xFFFFFF);
#if DEBUG_INFO
               my_printf("long 2 svc\n");
#endif               
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushinteger(L, tmp->par1);
               lua_pushinteger(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = result;
            }
            break;
         case FLOAT_SVC : 
            {
               // param is a pointer to a structure with two parameters
               float_param_2_t *tmp = (float_param_2_t *)(req&0xFFFFFF);
               result_t r;
#if DEBUG_INFO
               my_printf("float svc\n");
#endif               
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushnumber(L, tmp->par1);
               lua_pushnumber(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               r.f = lua_tonumberx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = r.l;
            }
            break;
         case LONG_FLOAT_SVC :
            {
               // param is a pointer to a structure with two parameters
               float_param_2_t *tmp = (float_param_2_t *)(req&0xFFFFFF);
#if DEBUG_INFO
               my_printf("long float svc\n");
#endif               
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushnumber(L, tmp->par1);
               lua_pushnumber(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = result;
            }
            break;
         case SHARED_SVC :
            {
#if DEBUG_INFO
               my_printf("shared svc\n");
#endif               
               // parameter is lower 24 bits, and represents a shared
               // data structure, so it is passed to Lua as lightuserdata
               // and the Lua function is expected to return an int
               param  = req&0xFFFFFF; 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushlightuserdata(L, (void *)param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  my_printf("function '%s' should return a number\n",
                  list[int_id-1].name);
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = result;
            }
            break;
         case SERIAL_SVC :
            {
               serial_t *serial;
               const char *out;
               unsigned int len;
               char not_a_number[] = {203,255,255,255,127}; // serialized nan 

#if DEBUG_INFO
               my_printf("serial svc\n");
#endif               
               // param is serial_t * pointed to by lower 24 bits
               serial  = (serial_t *)(*(long *)(req&0xFFFFFF));
               // execute function and return result
#if DEBUG_INFO
               my_printf("calling name '%s'\n", list[int_id-1].name);
#endif               
               lua_getglobal(L, list[int_id-1].name);
               // parameter is a Lua string (may contain embedded zeroes)
               lua_pushlstring(L, serial->ser_in, serial->len_in);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  my_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
                  // return a 'serialized' nan
                  memcpy(serial->ser_out, not_a_number, 5);
                  serial->len_out = 5;
               }
               else {
                  // result is a Lua string (may contain embedded zeroes)
                  out = lua_tolstring(L, -1, &len);
                  if (out == NULL) {
                     my_printf("function '%s' should return a string\n",
                     list[int_id-1].name);
                  }
                  else if (len >= serial->max_out) {
                     my_printf("function '%s' returned too long a string\n",
                     list[int_id-1].name);
                  }
                  else {
                     // copy result, include terminating zero
                     memcpy(serial->ser_out, out, len+1);
                     serial->len_out = len;
                  }
               }
               // pop returned value
               lua_pop(L, 1); 
               // return result
               rqst_ptr->response = (long)serial;
            }
            break;
         case REMOTE_SVC :
            {
#if !defined(__CATALINA_DISABLE_SERIAL)
               serial_t *s;
               int len;
               int res;
               int id;
               int ms = REMOTE_TIMEOUT;
               int max;
               char not_a_number[] = {203,255,255,255,127}; // serialized nan 

#if DEBUG_INFO
               my_printf("remote svc\n");
#endif               
               //my_printf("calling remote service on port %d\n", svc_port);
               // param is serial_t * pointed to by lower 24 bits
               s  = (serial_t *)(*(long *)(req&0xFFFFFF));
               //my_printf("serial in len = %d\n", s->len_in);
               max = s->max_out;
               //my_printf("max out len = %d\n", max);
               // execute remote function and return result
               aloha_tx(svc_port, int_id, sq, s->len_in, s->ser_in);
               res = aloha_rx(svc_port, &id, &sq, &len, s->ser_out, max, ms);
               if (res == 0) {
                  // success
                  s->len_out = len;
                  //my_printf("serial out len = %d\n", s->len_out);
               }
               else {
                  switch (res) {
                  case -1:
                    {
                       my_printf("function '%s' timed out\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -2:
                    {
                       my_printf("function '%s' returned too much data\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -3:
                    {
                       my_printf("function '%s' checksum error\n",
                          list[int_id-1].name);
                    }
                    break;
                  default: 
                    {
                       my_printf("function '%s' returned error %d\n",
                          list[int_id-1].name, res);
                    }
                    break;
                  }
                  // return a 'serialized' -1
                  memcpy(s->ser_out, not_a_number, 5);
                  s->len_out = 5;
               }
               // return result
               rqst_ptr->response = (long)s;
               // use a different sequence number on each remote call
               sq = (sq + 1) & 0xFF;
#endif
            }
            break;

#if defined(__CATALINA_libwifi)
         case RPC_SVC :
            {
               serial_t *s;
               int len;
               int res;
               int id;
               int max;
               char not_a_number[] = {203,255,255,255,127}; // serialized nan 

#if DEBUG_INFO
               my_printf("calling RPC service at http://%s/rpc/%s\n", 
                   list[int_id-1].svc_ip, list[int_id-1].name);
#endif      
               // param is serial_t * pointed to by lower 24 bits
               s  = (serial_t *)(*(long *)(req&0xFFFFFF));
               //my_printf("serial in len = %d\n", s->len_in);
               max = s->max_out;
               //my_printf("max out len = %d\n", max);
               // execute RPC function and return result
               res = rpc_call(list[int_id-1].svc_ip, list[int_id-1].name, 
                              s->len_in, s->ser_in, 
                              s->len_out, s->ser_out);
               if (res >= 0) {
                  // success
                  s->len_out = res;
                  //my_printf("serial out len = %d\n", s->len_out);
               }
               else {
                  switch (res) {
                  case -1:
                    {
                       my_printf("function '%s' invalid response\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -2:
                    {
                       my_printf("function '%s' returned too much data\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -3:
                    {
                       my_printf("function '%s' checksum error\n",
                          list[int_id-1].name);
                    }
                    break;
                  default: 
                    {
                       my_printf("function '%s' returned error %d\n",
                          list[int_id-1].name, res);
                    }
                    break;
                  }
                  // return a 'serialized' -1
                  memcpy(s->ser_out, not_a_number, 5);
                  s->len_out = 5;
               }
               // return result
               rqst_ptr->response = (long)s;
            }
            break;
#endif

         default:
#if DEBUG_INFO
               my_printf("unknown svc\n");
#endif               
            break;
      }
      // indicate completion
      rqst_ptr->request  = 0;
   }
}

// add_services - add services from the named table to the service list, 
// stopping if we reach max-1, and return the number of services added.
int add_services(lua_State *L, svc_list_t services, char *name, 
                 int port, int svc_type, int max) {
   int num = 0;
#if DEBUG_INFO
   my_printf("loading %s table\n", name);
#endif   
   lua_settop(L, 0);
   // push the table onto the stack
   lua_getglobal(L, name); 
   // make sure it is a table
   if (lua_istable(L, 1)) {
      // iterate across the table, up to max-1 entries
      lua_pushnil(L);
      // fetch up to max entries from the table
      while ((num < max) && (lua_next(L, 1) != 0)) {
         /* uses 'key' (at index -2) and 'value' (at index -1) */
         if (lua_isinteger(L, -2) && lua_isstring(L, -1)) {
            //my_printf("add %d, id=%d, name='%s', type=%d\n", 
            //  num, lua_tointeger(L, -2), lua_tostring(L, -1), svc_type);
            services[num].name     = strdup(lua_tostring(L, -1));
            services[num].addr     = NULL;
            services[num].svc_type = svc_type;
            services[num].svc_id   = lua_tointeger(L, -2);
            services[num].svc_port = port;
            num++;
         }
         else {
            my_printf("%s table entry %d is invalid\n", name, num+1);
         }
         /* removes 'value'; keeps 'key' for next iteration */
         lua_pop(L, 1);
      }
      // pop the table
      lua_pop(L, 1);
   }
   // terminate table with NULL service
   services[num].name     = strdup("");
   services[num].addr     = NULL;
   services[num].svc_type = 0;
   services[num].svc_id   = 0;
   services[num].svc_port = 0;
   //my_printf("total of %d services\n", num);
   return num;
}

#if !defined(__CATALINA_DISABLE_SERIAL)
// mod_ports - modify port and type of service for services in the named 
// table, which must already be on the service list. Return non-zero if
// the table exists, because that indicates we should monitor the port
int mod_ports(lua_State *L, svc_list_t services, char *name, 
                  int port, int svc_type, int max) {
   int n = 0;
   int id;
   int i;

#if DEBUG_INFO
   my_printf("loading %s table\n", name);
#endif   
   lua_settop(L, 0);
   // push the table onto the stack
   lua_getglobal(L, name); 
   // make sure it is a table
   if (lua_istable(L, 1)) {
      // iterate across the table, up to max-1 entries
      lua_pushnil(L);
      // fetch entries from the table
      while (lua_next(L, 1) != 0) {
         /* uses 'key' (at index -2) and 'value' (at index -1) */
         if (lua_isinteger(L, -2) && lua_isstring(L, -1)) {
            id = lua_tointeger(L, -2);
            // find the service in the list
            for (i = 0; i < max; i++) {
               if (services[i].svc_id == 0) {
                  // end of list
                  break;
               }
               if (services[i].svc_id == id) {
                  //my_printf("mod svc_id=%d' to type=%d, port=%d\n", 
                  //         lua_tointeger(L, -2), svc_type, port);
                  services[i].svc_port = port;
                  services[i].svc_type = svc_type;
                  n++;
               }
            }
            if (i == max) {
               my_printf("%s table entry %d not found\n", name, n+1);
            }
         }
         else {
            my_printf("%s table entry %d is invalid\n", name, n+1);
         }
         /* removes 'value'; keeps 'key' for next iteration */
         lua_pop(L, 1);
      }
      // pop the table
      lua_pop(L, 1);
      // indicate we had a table, even if it was empty
      return 1;
   }
#if DEBUG_INFO   
   else {
     my_printf("'%s' not found, or is not a table\n", name);
   }
#endif
   // indicate no such table
   return 0;
}
#endif

#if defined(__CATALINA_libwifi)

// mod_handles - modify handle, IP address and type of service for services 
// in the "rpc_network" table, which must already be on the service list. 
// Return non-zero if the table exists and has entries that contain our IP 
// address, because that indicates we need to poll for WiFi events.
int mod_handles(lua_State *L, svc_list_t services, char *name, 
                int svc_type, int max) {
   int n = 0;
   int id;
   int i;
   char my_name[32];
   char path[PATH_MAX];
   const char *ssid = NULL;
   const char *pass = NULL;
   const char *ip = NULL;
   int retries;
   int handle;
   int result;
   int listening;

#if DEBUG_INFO
   my_printf("loading %s table\n", name);
#endif
   lua_settop(L, 0);
   // push the table onto the stack
   lua_getglobal(L, name); 
   // make sure it is a table
   if (lua_istable(L, 1)) {
      // if the table exists at all, initialize the WiFi module
      if (wifi_AUTO() != wifi_Success) {
         my_printf("WiFi initialization failed\n");
         return -1;
      }
      // get the SSID and PASSPHRASE from the table (if they exist)
      if (lua_getfield(L, -1, "SSID") == LUA_TSTRING) {
         ssid = lua_tostring(L, -1);
         lua_pop(L, 1);
      }
      else {
         ssid = NULL;
      }
      if (lua_getfield(L, -1, "PASSPHRASE") == LUA_TSTRING) {
         pass = lua_tostring(L, -1);
         lua_pop(L, 1);
      }
      else {
         pass = "";
      }
#if WIFI_INFO
      if ((ssid == NULL) || (strlen(ssid) == 0)) {
         my_printf("No SSID in table '%s'\n", name);
      }
      else {
         my_printf("WiFi SSID = '%s'\n", ssid);
      }
#endif
      // get our own module name
      if (wifi_CHECK("module-name", my_name) == wifi_Success) {
#if WIFI_INFO
         my_printf("WiFi module name = '%s'\n", my_name);
#endif
      }
      else {
         my_printf("WiFi cannot get module name\n");
         return -1;
      }
      if ((ssid == NULL) || (strlen(ssid) == 0)) {
         // use our module name as SSID
         ssid = my_name;
#if WIFI_INFO
         my_printf("Clients can JOIN SSID '%s'\n", ssid);
#endif
      }
      // put WiFi in AP mode (forces the module off any current network)
      result = wifi_SET("wifi-mode", "AP");
      if (result != wifi_Success) {
         my_printf("WiFi SET failed\n");
      }
      // now go back to STA+AP mode
      result = wifi_SET("wifi-mode", "STA+AP");
      if (result != wifi_Success) {
         my_printf("WiFi SET failed\n");
      }
      // if the SSID is not our own module name
      // then JOIN the specified network.
      if ((ssid != NULL) && (strcmp(ssid, my_name) != 0)) {
#if WIFI_INFO
         my_printf("WiFi JOIN '%s'\n", ssid);
#endif
         if (wifi_JOIN((char *)ssid, (char *)pass) != wifi_Success) {
            my_printf("WiFi JOIN %d failed\n", ssid);
            return -1;
         }
#if DEBUG_INFO
         my_printf("WiFi JOIN ok\n", ssid);
#endif

         retries = 0;
         while (retries < IP_RETRIES) {
            if (wifi_CHECK("station-ipaddr", my_ip) == wifi_Success) {
               if (strcmp(my_ip, "0.0.0.0") != 0) {
                  break;
               }
#if DEBUG_INFO
               my_printf("WiFi IP address = '%s'\n", my_ip);
#endif
            }
            else {
               my_printf("WiFi failed to read IP address\n");
               return -1;
            }
            _waitsec(IP_RETRY_SECS);
            retries++;
         }
         if (strcmp(my_ip, "0.0.0.0") == 0) {
             my_printf("WiFi failed to get a valid IP address\n");
             return -1;
         }
      }
#if WIFI_INFO
      my_printf("WiFi IP address = '%s'\n", my_ip);
#endif
      listening = 0;
      // iterate across the table, up to max-1 entries
      lua_pushnil(L);
      // fetch entries from the table which have integer keys 
      // (i.e not the SSID or PASSPHRASE)
      while (lua_next(L, 1) != 0) {
         /* uses 'key' (at index -2) and 'value' (at index -1) */
         if (lua_isinteger(L, -2) && lua_isstring(L, -1)) {
            id = lua_tointeger(L, -2);
            ip = lua_tostring(L, -1);
            // find the service in the list
            for (i = 0; i < max; i++) {
               if (services[i].svc_id == 0) {
                  // end of list
                  break;
               }
               if (services[i].svc_id == id) {
                  // this is an RPC service
                  services[i].svc_type = svc_type;
                  // check the IP address - if it is an empty address,
                  // an invalid address, or OUR address, then it means
                  // we should listen for RPC calls to this service.
                  if ((strlen(ip) == 0) 
                  || !isdigit(ip[0]) 
                  || (strcmp(ip, my_ip) == 0)) {
                     // listen (once!) for RPC calls
                     if (!listening) {
                        result = wifi_LISTEN(TKN_HTTP, "/rpc/*", &handle);
                        if (result == wifi_Success) {
                           listening = 1;
#if DEBUG_INFO
                           my_printf("WiFi LISTEN, path = '/rpc/*', handle = %d\n",
                                    handle);
#endif                        
                        }
                        else {
                           my_printf("WiFi LISTEN failed\n");
                           // what to do? 
                        }
                     }
                     services[i].svc_handle = handle;
#if DEBUG_INFO
                     my_printf("mod svc_id=%d' to type=%d, handle=%d\n", 
                              lua_tointeger(L, -2), svc_type, handle);
#endif
                  }
                  else {
                     // an IP address but not ours - call it using RPC
                     services[i].svc_ip = strdup(ip);
                     services[i].svc_type = svc_type;
#if DEBUG_INFO
                     my_printf("mod svc_id=%d' to type=%d\n", 
                              lua_tointeger(L, -2), svc_type);
#endif
                  }
                  n++;
               }
            }
            if (i == max) {
               my_printf("%s table entry %d not found\n", name, n+1);
            }
         }
         /* removes 'value'; keeps 'key' for next iteration */
         lua_pop(L, 1);
      }
      // pop the table
      lua_pop(L, 1);
      // return 1 if listening
      return listening;
   }
#if DEBUG_INFO   
   else {
     my_printf("'%s' not found, or is not a table\n", name);
   }
#endif
   return 0;
}

#endif

// my_load_Lua_service_list - retrieve the list of Lua services from the 
// "service_index" table, and then modify it according to the serial port 
// and RPC network tables. 
//
// The ports any remote serial services must use are loaded from the 
// "port_0_index" .. "port_n_index" tables (n = 1 or 7, depending on which 
// serial plugin is in use). All the services in these tables should also be
// in the "service_index" table, and are assumed to be be serial services. 
// This means the "port_n_index" tables may be present (but different) in 
// both the "server" Lua program (for local services) and the "remote" Lua
// program (for remote services).
//
// The names and IP addresses of any RPC services from the "rpc_network" 
// table. All the services in the "rpc_network" table should also be in the 
// "service_index" table, and are assumed to be RPC services. 
//
// The "service_index" table should be present and the same for all the 
// MASTER and SLAVE clients and servers, but the "port_n_index" tables 
// should be present only in servers that need to call the serial services 
// remotely (to indicate the port to use) or which provide the service
// ( to indicate which serial ports to monitor).
//
// The "rpc_network" table should be present both in MASTER and SLAVE
// clients and servers that make RPC calls (to indicate the IP address to 
// send the RPC request) and SLAVEs that accept RPC calls (to set up a 
// listener handle for the path if the IP address matches their own). 
// This means that the "rpc_network" table may be in the "common" Lua program. 
//
// The WiFi module is initialized (in STA+AP mode) if the "rpc_network" table
// exists at all, and if it contains an entry for an SSID that does NOT match 
// the WiFi modules name, then the SSID and PASSPHRASE in this table are used
// to JOIN the specified WiFi network (otherwise It is assumed that the other 
// modules will JOIN the Access Point offered by this WiFi module).
//
int my_load_Lua_service_list(lua_State *L, svc_list_t services, int max) {
   int n = 0;
   int ports = PORTS;
   int i;
   char *table = "port_0_index";

   // load the "service_index" table into the service list
   lua_settop(L, 0);
   n = add_services(L, services, "service_index", 0, SERIAL_SVC, max); 
#if !defined(__CATALINA_DISABLE_SERIAL)
   // modify the ports of services in the "port_n_index" tables 
   for (i = 0; i < ports; i++) {
      if (mod_ports(L, services, table, i, REMOTE_SVC, max) > 0) {
         // check this port for messages
         port_in_use[i] = 1;
      }
      else {
         // do not check this port for messages
         port_in_use[i] = 0;
      }
      // increment table number
      table[5]++;
   }
#endif
#if defined(__CATALINA_libwifi)
   if (mod_handles(L, services, "rpc_network", RPC_SVC, max) > 0) {
      // indicate we should poll for WiFi events, 
      // because we are listening for RPC calls
      wifi_listening = 1;
   }
#endif
   num_services = n;
   return n;
}


