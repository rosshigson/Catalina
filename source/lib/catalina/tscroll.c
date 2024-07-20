#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_scroll (unsigned count, unsigned first, unsigned last) {
	return _short_service(SVC_T_SCROLL, (count<<16) + (first<<8) + last);
}
