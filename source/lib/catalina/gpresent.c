#include <hmi.h>

/*
 * HMI calls : gamepad present (i.e. gamepad port >= 0)
 */
int g_present(unsigned pad) {
	return (_short_service(SVC_G_PORT, pad) >= 0);
}
