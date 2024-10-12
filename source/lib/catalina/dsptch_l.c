#include <string.h>
#include <service.h>

// strdup replacment (strdup is not ANSI!)
static char *strdup(const char *s) {
    char *p = malloc(strlen(s) + 1);
    if(p) { strcpy(p, s); }
    return p;
}

// use _dispatch_Lua_bg if a background task is required
void _dispatch_Lua_bg(lua_State *L, svc_list_t list, char *bg) {
   request_t *rqst_ptr = REQUEST_BLOCK(_cogid());
   long req;
   int int_id;
   int svc_type;
   long param;
   int result;
   int isnum;

   // wait for request (i.e. non-zero value in request long)
   while ((req = rqst_ptr->request) == 0) {
     if (bg != NULL) {
        // call background task
        lua_getglobal(L, bg);
        result = lua_pcall(L, 0, 0, 0);
        if (result != LUA_OK) {
           t_printf("error '%s' running bg task '%s'\n", 
               lua_tostring(L, -1), bg);
        }
     }
#ifdef __CATALINA_lthreads
     _thread_yield();
#endif
   }
   // get the internal id and parameter
   int_id = req>>24;      // internal id is upper 8 bits
   if (int_id > 0) {
      svc_type = list[int_id-1].svc_type;
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
               t_printf("function '%s' should return a number",
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
               t_printf("function '%s' should return a number",
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
               t_printf("function '%s' should return a number",
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
               t_printf("function '%s' should return a number",
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
               t_printf("function '%s' should return a number",
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
               t_printf("function '%s' should return a number",
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
            // param is serial_t * pointed to by lower 24 bits
            serial  = (serial_t *)(*(long *)(req&0xFFFFFF));
            // execute function and return result
            lua_getglobal(L, list[int_id-1].name);
            // parameter is a Lua string (which may contain embedded zeroes)
            lua_pushlstring(L, serial->ser_in, serial->len_in);
            result = lua_pcall(L, 1, 1, 0);
            if (result != LUA_OK) {
               t_printf("error '%s' running function '%s'\n", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // result is a Lua string (which may contain embedded zeroes)
            out = lua_tolstring(L, -1, &len);
            if (out == NULL) {
               t_printf("function '%s' should return a string",
               list[int_id-1].name);
            }
            else if (len >= serial->max_out) {
               t_printf("function '%s' returned too long a string",
               list[int_id-1].name);
            }
            else {
               // copy result, include terminating zero
               memcpy(serial->ser_out, out, len+1);
               serial->len_out = len;
            }
            // pop returned value
            lua_pop(L, 1); 
            // return result
            rqst_ptr->response = (long)serial;
         }
         break;
      default:
         break;
   }
   // indicate completion
   rqst_ptr->request  = 0;

}

// retrieve the list of Lua services from the "service_index" table
// (note that all the services in this table must be serial services)
int _load_Lua_service_list(lua_State *L, svc_list_t services, int max) {
   int i, n = 0;
   // push the service_index table onto the stack
   lua_getglobal(L, "service_index"); 
   // make sure it is a table
   if (lua_istable(L, 1)) {
      // iterate across the table, up to max-1 entries
      // (we use the last entry to terminate the table)
      lua_pushnil(L);
      // fetch up to max entries from service table
      while ((n < max) && (lua_next(L, 1) != 0)) {
         /* uses 'key' (at index -2) and 'value' (at index -1) */
          if (lua_isinteger(L, -2) && lua_isstring(L, -1)) {
             //t_printf("svc=%d, name='%s'\n", 
             //   lua_tointeger(L, -2), lua_tostring(L, -1));
             services[n].name     = strdup(lua_tostring(L, -1));
             services[n].addr     = NULL;
             services[n].svc_type = SERIAL_SVC;
             services[n].svc_id   = lua_tointeger(L, -2);
             services[n].svc_port = 0;
             n++;
          }
          else {
             t_printf("service_index entry %d is invalid\n", n+1);
          }
          /* removes 'value'; keeps 'key' for next iteration */
          lua_pop(L, 1);
      }
   }
   else {
      t_printf("service_index table not found\n");
   }
   // terminate table with NULL service
   services[n].name     = strdup("");
   services[n].addr     = NULL;
   services[n].svc_type = 0;
   services[n].svc_id   = 0;
   services[n].svc_port = 0;
   return n;
}


