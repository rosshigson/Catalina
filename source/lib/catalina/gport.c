#include <hmi.h>

/*
 * HMI calls : gamepad port ($0xFFFF if not present)
 */
unsigned g_port(unsigned pad) {
	return _short_service(SVC_G_PORT, pad);
}

