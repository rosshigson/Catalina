#include <graphics.h>

/*
 * Graphics Mouse calls : enhanced mouse (Z)
 */

int gm_bound_z() {
	return gm_bound(2, gm_delta_z());
}

