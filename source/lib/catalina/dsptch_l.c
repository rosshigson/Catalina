#include <service.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

void _dispatch_Lua(lua_State *L, svc_list_t list) {
   request_t *rqst_ptr = REQUEST_BLOCK(_cogid());
   long req;
   int int_id;
   int svc_type;
   long param;
   int result;
   int isnum;

   // wait for request (i.e. non-zero value in request long)
   while ((req = rqst_ptr->request) == 0) {
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
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            result = lua_tointegerx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
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
            // execute function and return result
            lua_getglobal(L, list[int_id-1].name);
            // param is 32 bit long pointed to by lower 24 bits
            param  = *(long *)(req&0xFFFFFF); 
            lua_pushinteger(L, param);
            result = lua_pcall(L, 1, 1, 0);
            if (result != LUA_OK) {
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            result = lua_tointegerx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
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
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            result = lua_tointegerx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
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
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            r.f = lua_tonumberx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
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
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            result = lua_tointegerx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
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
               printf("error %s running function '%s'", 
                      lua_tostring(L, -1), 
                      list[int_id-1].name);
            }
            // retrieve result
            result = lua_tointegerx(L, -1, &isnum);
            if (!isnum) {
               printf("function '%s' should return a number",
               list[int_id-1].name);
            }
            // pop returned value
            lua_pop(L, 1); 
            // return result
            rqst_ptr->response = result;
         }
         break;
      default:
         break;
   }
   // indicate completion
   rqst_ptr->request  = 0;

}

