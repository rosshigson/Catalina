#include <plugin.h>

/*
 * structure used for passing two parameters to a long request
 */
typedef struct __plugin_param_2 {
   long par1;
   long par2;
};

/*
 * Long plugin request (2 parameters):
 */
int _long_plugin_request_2 (long plugin_type, long code, long par1, long par2) {
	struct __plugin_param_2 tmp;
   tmp.par1 = par1;
   tmp.par2 = par2;
	return _sys_plugin (plugin_type, (code<<24) + (long)&tmp);
}

