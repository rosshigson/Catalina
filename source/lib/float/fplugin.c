#include <plugin.h>

/*
 * Plugin request for float plugins that return a float
 */
float _float_request(long plugin_type, long code, float a, float b) {
	struct float_params {
		float a;
		float b;
	} tmp;

	union sys_plugin_result {
		long l;
		float f;
	} result;

	tmp.a = a;
	tmp.b = b;
	result.l = _sys_plugin (plugin_type, (code<<24) + (long)&tmp);
	return result.f;
}

/*
 * Plugin request for float plugins that return a long
 */
long _long_float_request(long plugin_type, long code, float a, float b) {
	struct float_params {
		float a;
		float b;
	} tmp;

	tmp.a = a;
	tmp.b = b;
	return _sys_plugin (plugin_type, (code<<24) + (long)&tmp);
}
