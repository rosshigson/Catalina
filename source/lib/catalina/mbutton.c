#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_button (unsigned long b) {
	return _short_service(SVC_M_BUTTON, b);
}
