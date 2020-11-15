#include <catalina_plugin.h>

/*
 * Plugin request for float plugins
 */
float _float_service(long svc, float a, float b) {
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
	result.l = _sys_plugin (-svc, (long)&tmp);
	return result.f;
}
