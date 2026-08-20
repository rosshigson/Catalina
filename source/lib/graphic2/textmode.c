#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Set text size and justification
//
//   x_scale        - x character scale, should be 1+
//   y_scale        - y character scale, should be 1+
//   spacing        - character spacing, 6 is normal
//   justification  - bits[1..0]: 0..3 = left, center, right, left
//                    bits[3..2]: 0..3 = bottom, center, top, bottom
//
void g_textmode(int x_scale, int y_scale, 
                int spacing, int justification) {
   int args[4];
   int *text_ptr = args;

   // remember the values
   G_VAR.TEXT_XS = x_scale;
   G_VAR.TEXT_YS = x_scale;
   G_VAR.TEXT_SP = spacing;
   G_VAR.TEXT_JUST = justification;

   *text_ptr++   = x_scale;
   *text_ptr++   = y_scale;
   *text_ptr++   = spacing;
   *text_ptr = justification;

   _setcommand(VGI_textmode, (long)args);
}

