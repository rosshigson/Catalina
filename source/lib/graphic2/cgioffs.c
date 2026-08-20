#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get x_offs from CGI_Info
//
int cgi_x_offs() {
   int *addr;
   addr = (int *)_cgi_data();
   return *addr;
}

// Get y_offs from CGI_Info
//
int cgi_y_offs() {
   int *addr;
   addr = (int *)_cgi_data() + 1; // note this is pointer arithmetic!
   return *addr;
}


