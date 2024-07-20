#include <graphics.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();


// Get address of underlying CGI bitmap to draw on.
//
// We must tell this function if we are double buffering.
//
// Note that this is always a Hub RAM address.
// The bitmap data will be:
//   (x_tiles * y_tiles) tiles, or
//   ((x_tiles * y_tiles) * 16 * 16 * 2) / 8) bytes.
//
void *cgi_bitmap_base(int double_buffer) {   
   int x_tiles = cgi_x_tiles();
   int y_tiles = cgi_y_tiles();
   unsigned long addr;

#ifdef __CATALINA_P2
   addr = (_cgi_data() & 0xFFFFFF) + 4; // 24 bit address
#else
   addr = (_cgi_data() & 0xFFFF);   // 16 bit address
#endif

   if (double_buffer) {
      return (void *)(addr + ((x_tiles * y_tiles) * 16 * 16 * 2) / 8);
   }
   else {
      return (void *)addr;
   }
}
