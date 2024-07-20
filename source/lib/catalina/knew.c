#include <hmi.h>

/*
 * HMI calls : keyboard
 */
int k_new() {
	return _short_service(SVC_K_NEW, 0);
}
