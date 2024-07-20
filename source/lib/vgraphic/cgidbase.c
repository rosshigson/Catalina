#include <vgraphic.h>

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();


// Get address of underlying CGI display.
//
// Note that this is always a Hub RAM address.
//
void *cgi_display_base() {
   return (void *)((_cgi_data() & 0xFFFF));
}
