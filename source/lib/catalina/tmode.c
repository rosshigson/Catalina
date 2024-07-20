#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_mode (unsigned curs, unsigned mode) {
	return _short_service(SVC_T_MODE, ((curs&1)<<23) + mode);
}
