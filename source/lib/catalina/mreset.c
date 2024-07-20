#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_reset() {
	return _short_service(SVC_M_RESET, 0);
}


