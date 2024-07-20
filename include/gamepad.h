#ifndef _GAMEPAD__H
#define _GAMEPAD__H

#include <plugin.h>

// NES bit encodings for NES gamepad 0
#define  NES0_RIGHT  0x0001
#define  NES0_LEFT   0x0002
#define  NES0_DOWN   0x0004
#define  NES0_UP     0x0008
#define  NES0_START  0x0010
#define  NES0_SELECT 0x0020
#define  NES0_B      0x0040
#define  NES0_A      0x0080

// NES bit encodings for NES gamepad 1
#define  NES1_RIGHT  0x0100
#define  NES1_LEFT   0x0200
#define  NES1_DOWN   0x0400
#define  NES1_UP     0x0800
#define  NES1_START  0x1000
#define  NES1_SELECT 0x2000
#define  NES1_B      0x4000
#define  NES1_A      0x8000

/*
 * Gamepad calls. We don't get the gamepad bits directly. 
 * Instead, the gamepad driver works by updating a long 
 * whose address we provide (must be in hub RAM) with the
 * gamepad bits. It does this continually until we stop it.
 *
 * NOTE We must remember to stop the updates before we use
 * the Hub RAM for anything else!!!
 */
extern unsigned long start_gamepad_updates(void * addr);
extern unsigned long stop_gamepad_updates();

#endif
