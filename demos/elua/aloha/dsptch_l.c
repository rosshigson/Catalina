#include <string.h>
#include <service.h>
#include <serial.h>
#include <lua.h>

#if defined(__CATALINA_libserial8)
#define PORTS 8
#elif defined(__CATALINA_libserial2)
#define PORTS 2
#else
#error dispatch_Lua requires a serial plugin (-lserial2 or -lserial8)
#endif

#define REMOTE_TIMEOUT 1000  // timeout on response after sending request
#define PORT_TIMEOUT    200  // timeout on rx after receiving first byte
#define REMOTE_MAX     2048  // maximum size of message that can be received 

// set to 1 if we should check the port for messages ...
static int port_in_use[PORTS];

static int num_services = 0;

// strdup replacment (strdup is not ANSI!)
static char *strdup(const char *s) {
    char *p = malloc(strlen(s) + 1);
    if(p) { strcpy(p, s); }
    return p;
}

void my_dispatch_Lua_bg(lua_State *L, svc_list_t list, char *bg) {
   request_t *rqst_ptr = REQUEST_BLOCK(_cogid());
   long req;
   int int_id;
   int svc_type;
   int svc_port;
   long param;
   int result;
   int isnum;
   int port;
   static int sq = 1;
   int msg;
   int i;

   // wait for a request (i.e. non-zero value in request long,
   // or a character to arrive at one of the the ports)
   do {
      if (bg != NULL) {
         // call background task
         lua_getglobal(L, bg);
         result = lua_pcall(L, 0, 0, 0);
         if (result != LUA_OK) {
            t_printf("error %s running bg task '%s'\n", 
                lua_tostring(L, -1), bg);
         }
      }
#ifdef __CATALINA_lthreads
      _thread_yield();
#endif
      port = -1;
      for (i = 0; i < PORTS; i++) {
        if (port_in_use[i]) {
           //t_printf("%d ", port);
           if (s_rxcount(i) > 0) {
              port = i;
              //t_printf("message on port %d\n", port);
              break; // we have a message
           }
        }
      }
   } while (((req = rqst_ptr->request) == 0) && (port == -1));

   if (port >= 0) {
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
                     t_printf("error '%s' running function '%s'\n", 
                            lua_tostring(L, -1), 
                            list[int_id].name);
                  }
                  // result is a Lua string (may contain embedded zeroes)
                  str = lua_tolstring(L, -1, &len_out);
                  if (str == NULL) {
                     t_printf("function '%s' should return a string\n",
                     list[int_id-1].name);
                  }
                  else if (len_out >= REMOTE_MAX) {
                     t_printf("function '%s' returned too long a string\n",
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
                  t_printf("function '%s' cannot be called remotely\n",
                  list[int_id-1].name);
               }
            }
            else {
               // no function with that id
               t_printf("no function with id %d for remote call\n", int_id);
            }
         }
         else {
            // zero is an invalid id
            t_printf("attempt to call service 0 in remote call\n");
         }
      }
      else {
         //t_printf("result %d receiving remote call\n", res);
      }
   }
   else {
      // get the internal id and parameter
      int_id = req>>24;      // internal id is upper 8 bits
      if (int_id > 0) {
         svc_type = list[int_id-1].svc_type;
         svc_port = list[int_id-1].svc_port;
      }
      switch (svc_type) {
         case SHORT_SVC :
            {
               // parameter is lower 24 bits
               param  = req&0xFFFFFF; 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushinteger(L, param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // param is 32 bit long pointed to by lower 24 bits
               param  = *(long *)(req&0xFFFFFF); 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushinteger(L, param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushinteger(L, tmp->par1);
               lua_pushinteger(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushnumber(L, tmp->par1);
               lua_pushnumber(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               r.f = lua_tonumberx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is two full 32 bits
               lua_pushnumber(L, tmp->par1);
               lua_pushnumber(L, tmp->par2);
               result = lua_pcall(L, 2, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // parameter is lower 24 bits, and represents a shared
               // data structure, so it is passed to Lua as lightuserdata
               // and the Lua function is expected to return an int
               param  = req&0xFFFFFF; 
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               lua_pushlightuserdata(L, (void *)param);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
                         lua_tostring(L, -1), 
                         list[int_id-1].name);
               }
               // retrieve result
               result = lua_tointegerx(L, -1, &isnum);
               if (!isnum) {
                  t_printf("function '%s' should return a number\n",
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
               // param is serial_t * pointed to by lower 24 bits
               serial  = (serial_t *)(*(long *)(req&0xFFFFFF));
               // execute function and return result
               lua_getglobal(L, list[int_id-1].name);
               // parameter is a Lua string (may contain embedded zeroes)
               lua_pushlstring(L, serial->ser_in, serial->len_in);
               result = lua_pcall(L, 1, 1, 0);
               if (result != LUA_OK) {
                  t_printf("error '%s' running function '%s'\n", 
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
                     t_printf("function '%s' should return a string\n",
                     list[int_id-1].name);
                  }
                  else if (len >= serial->max_out) {
                     t_printf("function '%s' returned too long a string\n",
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
               serial_t *s;
               int len;
               int res;
               int id;
               int ms = REMOTE_TIMEOUT;
               int max;
               char not_a_number[] = {203,255,255,255,127}; // serialized nan 
               //t_printf("calling remote service on port %d\n", svc_port);
               // param is serial_t * pointed to by lower 24 bits
               s  = (serial_t *)(*(long *)(req&0xFFFFFF));
               //t_printf("serial in len = %d\n", s->len_in);
               max = s->max_out;
               //t_printf("max out len = %d\n", max);
               // execute remote function and return result
               aloha_tx(svc_port, int_id, sq, s->len_in, s->ser_in);
               res = aloha_rx(svc_port, &id, &sq, &len, s->ser_out, max, ms);
               if (res == 0) {
                  // success
                  s->len_out = len;
                  //t_printf("serial out len = %d\n", s->len_out);
               }
               else {
                  switch (res) {
                  case -1:
                    {
                       t_printf("function '%s' timed out\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -2:
                    {
                       t_printf("function '%s' returned too much data\n",
                          list[int_id-1].name);
                    }
                    break;
                  case -3:
                    {
                       t_printf("function '%s' checksum error\n",
                          list[int_id-1].name);
                    }
                    break;
                  default: 
                    {
                       t_printf("function '%s' retrned error %d\n",
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
            }
            break;
         default:
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
   //t_printf("loading %s table\n", name);
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
            //t_printf("add %d, id=%d, name='%s', type=%d\n", 
            //  num, lua_tointeger(L, -2), lua_tostring(L, -1), svc_type);
            services[num].name     = strdup(lua_tostring(L, -1));
            services[num].addr     = NULL;
            services[num].svc_type = svc_type;
            services[num].svc_id   = lua_tointeger(L, -2);
            services[num].svc_port = port;
            num++;
         }
         else {
            t_printf("%s table entry %d is invalid\n", name, num+1);
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
   //t_printf("total of %d services\n", num);
   return num;
}

// mod_ports - modify port and type of service for services in the named 
// table, which must already be on the service list. Return non-zero if
// the table exists, because that indicates we should monitor the port
int mod_ports(lua_State *L, svc_list_t services, char *name, 
                  int port, int svc_type, int max) {
   int n = 0;
   int id;
   int i;

   //t_printf("loading %s table\n", name);
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
                  //t_printf("mod %d (svc_id=%d)' to type=%d, port=%d\n", 
                  //   i, lua_tointeger(L, -2), svc_type, port);
                  services[i].svc_port = port;
                  services[i].svc_type = svc_type;
                  n++;
               }
            }
            if (i == max) {
               t_printf("%s table entry %d not found\n", name, n+1);
            }
         }
         else {
            t_printf("%s table entry %d is invalid\n", name, n+1);
         }
         /* removes 'value'; keeps 'key' for next iteration */
         lua_pop(L, 1);
      }
      // pop the table
      lua_pop(L, 1);
      // indicate we had a table, even if it was empty
      return 1;
   }
   // indicate no such table
   return 0;
}

// my_load_Lua_service_list - retrieve the list of Lua services from the 
// "service_index" table, and the ports any remote services must use from 
// the "port_0_index" .. "port_n_index" tables (n = 1 or 7, depending on 
// which serial plugin is in use).
// All the services in these tables are assumed to be be serial services.
// The "service_index" table should be the same for all participating
// clients and servers, but the "port_n_index" tables should be present
// only in servers that need to call the services remotely (to indicate 
// the port to use).
int my_load_Lua_service_list(lua_State *L, svc_list_t services, int max) {
   int n = 0;
   int ports = PORTS;
   int i;
   char *table = "port_0_index";

   // load the "service_index" table into the service list
   lua_settop(L, 0);
   n = add_services(L, services, "service_index", 0, SERIAL_SVC, max); 
   // modify the ports of services in the "port_n_index" tables 
   for (i = 0; i < ports; i++) {
      if (mod_ports(L, services, table, i, REMOTE_SVC, max) > 0) {
         // check this port for messages
         port_in_use[i] = 1;
         //s_rxflush(i);
         //printf("s_rxcheck returns %d\n", s_rxcheck(i));
         //printf("s_rxcheck returns %d\n", s_rxcheck(i));
      }
      else {
         // do not check this port for messages
         port_in_use[i] = 0;
      }
      // increment table number
      table[5]++;
   }
   num_services = n;
   return n;
}


