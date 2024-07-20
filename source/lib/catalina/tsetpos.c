#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_setpos (unsigned curs, unsigned cols, unsigned rows) {
	return _short_service(SVC_T_SETPOS, ((curs&1)<<23) + (cols<<8) + rows);
}
