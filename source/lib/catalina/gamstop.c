#include <gamepad.h>

/*
 * GAM calls : stop_gamepad_updates - stop the gamepad driver updates.
 */
extern unsigned long stop_gamepad_updates() {
	return _short_plugin_request(LMM_GAM, 1, 0);
}
