#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_integer (unsigned curs, int val) {
	return _short_service(SVC_T_INT, ((curs&1)<<23) + (int)&val);
}
