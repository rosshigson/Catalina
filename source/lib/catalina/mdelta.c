#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_delta_x() {
	return _short_service(SVC_M_DELTA_X, 0);
}

int m_delta_y() {
	return _short_service(SVC_M_DELTA_Y, 0);
}

int m_delta_z() {
	return _short_service(SVC_M_DELTA_Z, 0);
}
