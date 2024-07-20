#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_wait() {
	return _short_service(SVC_K_WAIT, 0);
}
