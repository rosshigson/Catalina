#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get address of color palette from CGI_Info
//
void *cgi_palette() {
   int *addr;
   addr = (int *)_cgi_data() + 8; // note this is pointer arithmetic!
   return (void *)*addr;
}


