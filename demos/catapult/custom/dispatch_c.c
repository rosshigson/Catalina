#include "service.h"

void my_dispatch_C(svc_list_t list) {
   request_t *rqst_ptr = REQUEST_BLOCK(_cogid());
   long req;
   int int_id;
   int svc_type;
   long param;
   int result;

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
      case SHARED_SVC :
         {
            call_SHORT_SVC func = (call_SHORT_SVC)list[int_id-1].addr;
            // parameter is lower 24 bits
            param  = req&0xFFFFFF; 
            // execute function and return result
            rqst_ptr->response = (int)((*func)(param)); 
         }
         break;
      case LONG_SVC :
         {
            call_LONG_SVC func = (call_LONG_SVC)list[int_id-1].addr;
            // param is 32 bit long pointed to by lower 24 bits
            param  = *(long *)(req&0xFFFFFF); 
            // execute function and return result 
            rqst_ptr->response = (int)((*func)(param)); 
         }
         break;
      case LONG_2_SVC :
         {
            call_LONG_2_SVC func = (call_LONG_2_SVC)list[int_id-1].addr;
            // param is a pointer to a structure with two parameters
            long_param_2_t *tmp = (long_param_2_t *)(req&0xFFFFFF);
            // execute function and return result
            rqst_ptr->response = (int)((*func)(tmp->par1, tmp->par2)); 
         }
         break;
      case FLOAT_SVC : 
         {
            call_FLOAT_SVC func = (call_FLOAT_SVC)list[int_id-1].addr;
            // param is a pointer to a structure with two parameters
            float_param_2_t *tmp = (float_param_2_t *)(req&0xFFFFFF);
            result_t r;
            //  execute function
            r.f = (*func)(tmp->par1, tmp->par2); 
            // return result
            rqst_ptr->response = r.l;
         }
         break;
      case LONG_FLOAT_SVC :
         {
            call_LONG_FLOAT_SVC func = (call_LONG_FLOAT_SVC)list[int_id-1].addr;
           // param is a pointer to a structure with two parameters
            float_param_2_t *tmp = (float_param_2_t *)(req&0xFFFFFF);
            //  execute function
            result = (*func)(tmp->par1, tmp->par2); 
            // return result
            rqst_ptr->response = result;
         }
         break;
      case CHAR_2_SVC :
         {
            call_CHAR_2_SVC func = (call_CHAR_2_SVC)list[int_id-1].addr;
            // param is a pointer to a structure with two parameters
            char_param_2_t *tmp = (char_param_2_t *)(req&0xFFFFFF);
            // execute function and return result
            rqst_ptr->response = (int)((*func)(tmp->par1, tmp->par2)); 
         }
         break;
      default:
         break;
   }
   // indicate completion
   rqst_ptr->request  = 0;

}


