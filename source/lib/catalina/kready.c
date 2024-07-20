#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_ready() {
	return _short_service(SVC_K_READY, 0);
}
