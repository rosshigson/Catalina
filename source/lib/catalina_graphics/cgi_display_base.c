#include <catalina_graphics.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();


// Get address of underlying CGI display.
//
// Note that this is always a Hub RAM address.
// The display data will be:
//   (x_tiles * y_tiles) tiles, or
//   ((x_tiles * y_tiles) * 16 * 16 * 2) / 8) bytes.
//
void *cgi_display_base() {
   return (void *)((_cgi_data() & 0xFFFF));
}
