#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_present() {
	return _short_service(SVC_M_PRESENT, 0);
}
