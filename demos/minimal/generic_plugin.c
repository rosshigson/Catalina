#include "generic_plugin.h"

#define DUM 8 // the generic plugin has this type

int Service_1(char *buffer) {
   // Service 1 is an initialization service - it uses a long request
	return _long_plugin_request(DUM, 1, (unsigned long)buffer);
}

int Service_2(unsigned long outputs) {
   // Service 2 is a short request - parameter is limited to 24 bits
	return _short_plugin_request(DUM, 2, outputs & 0x00FFFFFF);
}

int Service_3(unsigned long outputs) {
   // Service 3 is a long request with 1 parameter - which can be 32 bits
	return _long_plugin_request(DUM, 3, outputs);
}
int Service_4(unsigned long outputs, unsigned long count) {
   // Service 4 is a long request with 2 parameters - each can be 32 bits
	return _long_plugin_request_2(DUM, 4, outputs, count);
}

