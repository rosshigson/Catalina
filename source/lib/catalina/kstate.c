#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_state(int key) {
	return _short_service(SVC_K_STATE, key);
}
