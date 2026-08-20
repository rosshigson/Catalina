#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

/* nes_encode : encode USB gamepad data to be compatible with NES gamepads.
 *
 * USB Gamepad data is reported as:
 *
 *    buttons = lrES0000YBAX (l=Left, r=Right, E=select, S=start)
 *
 *    x axes = 0   => U
 *           = 255 => D
 *           = 127 => neither
 *    y axes = 0   => L
 *           = 255 => R
 *           = 127 => neither
 *
 * The encoded NES bits are: ABESUDLR 
 *
 * This encoding is intended for compatibility with the P1 NES gamepads. 
 * For SNES gamepads, use snes_encode(). If NES or SNES compatibility is 
 * not required, use the g_x_abs(), g_y_abs() and g_butons() functions 
 * directly.
 */
unsigned nes_encode(int x, int y, unsigned buttons) {
   unsigned register nes = 0;
   if (y == 255) {
     nes |= NES_RIGHT; // R (X axes)
   }
   if (y == 0) {
     nes |= NES_LEFT; // L (X axes)
   }
   if (x == 255) {
     nes |= NES_DOWN; // D (Y axes)
   }
   if (x == 0) {
     nes |= NES_UP; // U (Y axes)
   }
   if (buttons&0x002) {
     nes |= NES_A;
   }
   if (buttons&0x004) {
     nes |= NES_B;
   }
   if (buttons&0x200) {
     nes |= NES_START;
   }
   if (buttons&0x100) {
     nes |= NES_SELECT;
   }
   return nes;
}

// reproduce P1 NES gamepad behaviour
//
unsigned g_nes(unsigned pad) {
  if (g_present(pad)) {
     return nes_encode(g_abs_x(pad), g_abs_y(pad), g_buttons(pad));
  }
  return 0; // if gamepad not present
}


