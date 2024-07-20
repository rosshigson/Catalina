#include <plugin.h>

/*
 * structure used for passing two parameters to a long service
 */
typedef struct __service_param_2 {
   long par1;
   long par2;
};

/*
 * Long service request (2 parameters):
 */
int _long_service_2 (long svc, long par1, long par2) {
	struct __service_param_2 tmp;
   tmp.par1 = par1;
   tmp.par2 = par2;
	return _sys_plugin (-svc, (long)&tmp);
}

