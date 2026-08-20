#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

/* snes_encode : encode usb gamepad data to be compatible with snes gamepads.
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
 * The encoded SNES bits are: rlXARLDUSEYB 
 *
 * For NNES gamepads, use nes_encode(). If NES or SNES compatibility is 
 * not required, use the g_x_abs(), g_y_abs() and g_butons() functions 
 * directly.
 */
unsigned snes_encode(int x, int y, unsigned buttons) {
   unsigned register snes = 0;
   if (y == 255) {
     snes |= SNES_RIGHT; // R (X axes)
   }
   if (y == 0) {
     snes |= SNES_LEFT; // L (X axes)
   }
   if (x == 255) {
     snes |= SNES_DOWN; // D (Y axes)
   }
   if (x == 0) {
     snes |= SNES_UP; // U (Y axes)
   }
   if (buttons&0x0002) {
     snes |= SNES_A;
   }
   if (buttons&0x0004) {
     snes |= SNES_B;
   }
   if (buttons&0x0200) {
     snes |= SNES_START;
   }
   if (buttons&0x0100) {
     snes |= SNES_SELECT;
   }
   if (buttons&0x0010) {
     snes |= SNES_L;
   }
   if (buttons&0x0020) {
     snes |= SNES_R; 
   }
   if (buttons&0x0001) {
     snes |= SNES_X;
   }
   if (buttons&0x0008) {
     snes |= SNES_Y;
   }
   return snes;
}

// reproduce SNES gamepad behaviour
//
unsigned g_snes(unsigned pad) {
  if (g_present(pad)) {
     return snes_encode(g_abs_x(pad), g_abs_y(pad), g_buttons(pad));
  }
  return 0; // if gamepad not present
}


