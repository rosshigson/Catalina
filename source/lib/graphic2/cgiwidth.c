#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get address of pixel_width from CGI_Info
//
void *cgi_pixel_width() {
   int *addr;
   addr = (int *)_cgi_data() + 6; // note this is pointer arithmetic!
   return (void *)*addr;
}


