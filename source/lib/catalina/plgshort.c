#include <plugin.h>

/*
 * Short plugin request:
 */
int _short_plugin_request (long plugin_type, long code, long param) {
	return _sys_plugin (plugin_type, (code<<24) + (param & 0x00FFFFFF));
}

