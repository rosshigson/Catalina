#include <plugin.h>

/*
 * structure used for passing three parameters to a long service
 */
typedef struct __service_param_3 {
   long par1;
   long par2;
   long par3;
};

/*
 * Long service request (3 parameters):
 */
int _long_service_3 (long svc, long par1, long par2, long par3) {
	struct __service_param_3 tmp;
   tmp.par1 = par1;
   tmp.par2 = par2;
   tmp.par3 = par3;
	return _sys_plugin (-svc, (long)&tmp);
}

