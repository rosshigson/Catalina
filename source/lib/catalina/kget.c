#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_get() {
	return _short_service(SVC_K_GET, 0);
}
