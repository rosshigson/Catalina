#include <plugin.h>

/*
 * Long service request (1 parameter):
 */
int _long_service (long svc, long param) {
	long tmp = param;
	return _sys_plugin (-svc, (long)&tmp);
}

