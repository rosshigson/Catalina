#include <hmi.h>

/*
 * HMI calls : basic mouse
 */
int m_buttons() {
	return _short_service(SVC_M_BUTTONS, 0);
}
