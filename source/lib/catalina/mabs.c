#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_abs_x() {
	return _short_service(SVC_M_ABS_X, 0);
}

int m_abs_y() {
	return _short_service(SVC_M_ABS_Y, 0);
}

int m_abs_z() {
	return _short_service(SVC_M_ABS_Z, 0);
}
