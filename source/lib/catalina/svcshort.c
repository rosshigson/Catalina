#include <plugin.h>

/*
 * Short service request:
 */
int _short_service (long svc, long param) {
	return _sys_plugin (-svc, param & 0x00FFFFFF);
}

