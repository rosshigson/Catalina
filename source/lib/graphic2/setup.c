#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

struct g_var G_VAR;

// Set bitmap parameters (P1 or P2)
//
//   x_org          - relative-x center pixel
//   y_org          - relative-y center pixel
//   n_tiles        - number of tiles in tile space
//   tile_ptr       - tile space pointer (TILE_SIZE * n_tiles longs)
//                    
// NOTE: this function is provided for compatibility with the P1,
//       and simply calls g_setup_2(), g_set_color(), g_clear() and 
//       g_add_ram(). 
//       It assumes the full screen is to be used for graphics and
//       does not allow setting graphic screen offsets or number of 
//       graphic tiles.
//
void g_setup(int x_org, int y_org, int n_tiles, void *tile_ptr) {
   g_setup_2(0, 0, cgi_x_total(), cgi_y_total(), x_org, y_org, 0);
   // For compatibility with the P1 in 4 colour mode, the default four color
   // palette should be:
   // g_set_colors(0, 15, 9, 12); 
   // i.e. black (color 0 or bg), white (color 1), red (color 2) & blue (color 3)
   // but for compatibility with the P1 in 2 color mode, the default four color
   // palette should be:
   g_set_colors(0, 15, 15, 15); 
   g_clear();
   // i.e. black (color 0 or bg), white (color 1), white (color 2) & white (color 3)
   // to change this, use g_set_colors() or g_palette() after g_setup()
   g_add_ram(tile_ptr, n_tiles*TILE_SIZE);
}

// Set graphics parameters (P2 only)
//
//   x_offs      - tile offset of top left of graphics
//   y_offs      - tile offset of top left of graphics window
//   x_tiles     - number of horizontal tiles in graphics window
//   y_tiles     - number of vertical tiles in graphics window
//   x_org       - relative-x center pixel
//   y_org       - relative-y centre pixel
//   reset       - reset tile data for re-use
//
// Note that these parameters are NOT COMPATIBLE with the P1 version 
// of this function. 
//
void g_setup_2(int x_offs, int y_offs, 
               int x_tiles, int y_tiles, 
               int x_org, int y_org,
               int reset) {
  
   int args[8];
   register int *arg_ptr = args;

   G_VAR.X_TILES      = x_tiles;
   G_VAR.Y_TILES      = y_tiles;
   G_VAR.TEXT_XS      = 0;
   G_VAR.TEXT_YS      = 0;
   G_VAR.TEXT_SP      = 0;
   G_VAR.TEXT_JUST    = 0;
   G_VAR.PIXEL_WIDTH  = cgi_pixel_width();
   G_VAR.SLICES       = cgi_slices();
   G_VAR.SCREEN       = cgi_screen_data(DOUBLE_BUFFER);
   G_VAR.COLORS[0]    = 0x00000000;
   G_VAR.COLORS[1]    = 0x55555555;
   G_VAR.COLORS[2]    = 0xAAAAAAAA;
   G_VAR.COLORS[3]    = 0xFFFFFFFF;
   *arg_ptr++ = x_offs;
   *arg_ptr++ = y_offs;
   *arg_ptr++ = x_tiles;
   *arg_ptr++ = y_tiles;
   *arg_ptr++ = x_org;
   *arg_ptr++ = y_org;
   *arg_ptr   = reset;
   _setcommand(VGI_setup,  (long)args);
}

// Ignored. Provided only for compatibility with the P1 
//
void g_flush() {
}

// Ignored. Provided only for compatibility with the P1 
//
void g_finish() {
}

// Set double buffer parameters
//
// This is provided only for compatibility with the P1, and is ignored.
//
void g_db_setup(int double_buffer) {
}

