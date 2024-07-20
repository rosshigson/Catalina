#include <vgraphic.h>

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
   int *text_ptr = &G_VAR.TEXT_XS;

   *text_ptr++   = x_scale;
   *text_ptr++   = y_scale;
   *text_ptr++   = spacing;
   *text_ptr = justification;

   _setcommand(VGI_textmode, (long)&G_VAR.TEXT_XS);
}
