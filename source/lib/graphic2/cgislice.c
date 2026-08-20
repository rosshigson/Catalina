#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get address of slices from CGI_Info
//
void *cgi_slices() {
   int *addr;
   addr = (int *)_cgi_data() + 7; // note this is pointer arithmetic!
   return (void *)*addr;
}


