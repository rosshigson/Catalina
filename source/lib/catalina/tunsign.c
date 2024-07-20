#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_unsigned (unsigned curs, unsigned val) {
	return _short_service(SVC_T_UNSIGNED, ((curs&1)<<23) + (int)&val);
}
