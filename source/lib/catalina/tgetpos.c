#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_getpos (unsigned curs) {
	return _short_service(SVC_T_GETPOS, ((curs&1)<<23));
}
