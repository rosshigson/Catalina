#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_char (unsigned curs, unsigned ch) {
	return _short_service(SVC_T_CHAR, ((curs&1)<<23) + ch);
}

