#include <vgraphic.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();


// Get x_tiles
//
int cgi_x_tiles() {
   return _cgi_data() >> 24;
}
