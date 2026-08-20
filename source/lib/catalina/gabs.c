#include <hmi.h>

/*
 * HMI calls : gamepad axes
 */
int g_abs_x(unsigned pad) {
	return _short_service(SVC_G_ABS_X, pad);
}

int g_abs_y(unsigned pad) {
	return _short_service(SVC_G_ABS_Y, pad);
}

int g_abs_z(unsigned pad) {
	return _short_service(SVC_G_ABS_Z, pad);
}
