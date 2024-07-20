#include <graphics.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();


// Get x_tiles
//
int cgi_x_tiles() {
#ifdef __CATALINA_P2
   unsigned char *addr;
   addr = (unsigned char *)_cgi_data();
   return *addr;
#else
   return _cgi_data() >> 24;
#endif
}
