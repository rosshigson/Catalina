#include <vgraphic.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();

// external functions to return x, y tiles
extern int cgi_x_tiles();
extern int cgi_y_tiles();


// Get address of underlying CGI screen data.
//
// We must tell this function if we are double buffering.
//
// Note that this is always a Hub RAM address.
// You must provide x and y size.
// The screen data will be (x_tiles * y_tiles) words.
//
void *cgi_screen_data(int double_buffer) {
   int x_tiles = cgi_x_tiles();
   int y_tiles = cgi_y_tiles();
   unsigned long addr;
   unsigned long offs = ((x_tiles * y_tiles) * 16 * 16 * 2) / 8;

   addr = (_cgi_data() & 0xFFFF) + offs;

   if (double_buffer) {
      return (void *)(addr + offs);
   }
   else {
      return (void *)addr;
   }
}
