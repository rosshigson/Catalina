#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_color (unsigned curs, unsigned color) {
	return _short_service(SVC_T_COLOR, ((curs&1)<<23) + color);
}
