#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_present() {
	return _short_service(SVC_K_PRESENT, 0);
}
