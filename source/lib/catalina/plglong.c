#include <plugin.h>

/*
 * Long plugin request (1 parameter):
 */
int _long_plugin_request (long plugin_type, long code, long param) {
	long tmp = param;
	return _sys_plugin (plugin_type, (code<<24) + (long)&tmp);
}

