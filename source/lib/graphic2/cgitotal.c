#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get x_total from CGI_Info
//
int cgi_x_total() {
   int *addr;
   addr = (int *)_cgi_data() + 4;  // note this is pointer arithmetic!
   return *addr;
}

// Get y_total from CGI_Info
//
int cgi_y_total() {
   int *addr;
   addr = (int *)_cgi_data() + 5; // note this is pointer arithmetic!
   return *addr;
}


