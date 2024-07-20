#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_geometry () {
	return _short_service(SVC_T_GEOMETRY, 0);
}

