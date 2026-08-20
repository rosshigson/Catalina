#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Draw a pixel sprite
//
//   x,y         - center of vector sprite
//   pixrot      - 0: 0 , 1: 90 , 2: 180 , 3: 270 , +4: mirror
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
   int args[8];
   register int *arg_ptr = args;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = pixrot;
   *arg_ptr = (int)pixdef_ptr;

   _setcommand(VGI_pix, (long)args);
}

