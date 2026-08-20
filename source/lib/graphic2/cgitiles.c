#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get x_tiles from CGI_Info
//
int cgi_x_tiles() {
   int *addr;
   addr = (int *)_cgi_data() + 2; // note this is pointer arithmetic!
   return *addr;
}


// Get y_tiles from CGI_Info
//
int cgi_y_tiles() {
   int *addr;
   addr = (int *)_cgi_data() + 3; // note this is pointer arithmetic!
   return *addr;
}


