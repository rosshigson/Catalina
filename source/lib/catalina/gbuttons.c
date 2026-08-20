#include <hmi.h>

/*
 * HMI calls : gamepad buttons
 */
unsigned g_buttons(unsigned pad) {
	return _short_service(SVC_G_BUTTONS, pad);
}
