#include <graphics.h>

/*
 * Round pixel recipes
 */
static unsigned char pixels[] = {
   0x00, 0x00, 0x00, 0x00, // 0, 1, 2, 3 
   0x00, 0x00, 0x02, 0x05, // 4, 5, 6, 7
   0x0A, 0x0A, 0x1A, 0x1A, // 8, 9, A, B
   0x34, 0x3A, 0x74, 0x74  // C, D, E, F
};

// Set pixel width
// actual width is w[3..0] + 1
//
//   width      - 0..15 for round pixels, 16..31 for square pixels
//
void g_width(int width) {
   register int pixel_passes, r, i, p;
   register int *arg_ptr = G_VAR.ARGS;
   int *slice = G_VAR.SLICES;
   unsigned char pixwidth;

   r = ((width & 0x10) == 0); //determine pixel shape/width
   width &= 0xF;
   G_VAR.PIXEL_WIDTH = width;
   pixel_passes = (width >> 1) + 1;
   *arg_ptr++ = width;
   *arg_ptr = pixel_passes;
   _setcommand(CGI_width, (long)G_VAR.ARGS);
   // do width command now to avoid updating slices when busy
   p = width ^ 0xF; // update slices to new shape/width
   pixel_passes -= 2;
   pixwidth = pixels[width];
   for (i = 0; i <= (width >> 1); i++) {
      *slice = (0xFFFFFFFF >> (p << 1)) << (p & 0xE);
      slice++;
      if (r && (pixwidth & (1 << i))) {
         p += 2;
      }
      if (r && (i == pixel_passes)) {
         p += 2;
      }
   }
}
