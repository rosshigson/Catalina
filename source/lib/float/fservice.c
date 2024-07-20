#include <plugin.h>

/*
 * Service request for float services that return a float
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

/*
 * Service request for float services that return a long
 */
long _long_float_service(long svc, float a, float b) {
	struct float_params {
		float a;
		float b;
	} tmp;

	tmp.a = a;
	tmp.b = b;
	return _sys_plugin (-svc, (long)&tmp);
}
