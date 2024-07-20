#include <graphics.h>

// Draw a pixel sprite
//
//   x,y         - center of vector sprite
//   pixrot      - 0: 0°, 1: 90°, 2: 180°, 3: 270°, +4: mirror
//   pixdef_ptr  - address of pixel sprite definition
//
//
// Pixel sprite definition:
//
//    word    'word align, express dimensions and center, define pixels
//    byte    xwords, ywords, xorigin, yorigin
//    word    %%xxxxxxxx,%%xxxxxxxx
//    word    %%xxxxxxxx,%%xxxxxxxx
//    word    %%xxxxxxxx,%%xxxxxxxx
//    ...
//
void g_pix(int x, int y, int pixrot, void *pixdef_ptr) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = pixrot;
   *arg_ptr = (int)pixdef_ptr;

   _setcommand(CGI_pix, (long)G_VAR.ARGS);
}
