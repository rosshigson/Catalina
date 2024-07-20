#include <gamepad.h>

/*
 * GAM calls : start_gamepad_updates - set the address of a Hub long
 *             that the gamepad driver should update with the gamepad
 *             bits. It will do this until stopped.
 */
extern unsigned long start_gamepad_updates(void * addr) {
	return _short_plugin_request(LMM_GAM, 1, ((unsigned long)(addr) & 0xFFFFFF));
}
