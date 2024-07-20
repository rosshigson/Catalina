#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_clear() {
	return _short_service(SVC_K_CLEAR, 0);
}
