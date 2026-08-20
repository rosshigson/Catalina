#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// get address of color data from CGI_Info
void *cgi_color_data(int double_buffer) {
   int *addr;
   addr = (int *)_cgi_data() + 9; // note this is pointer arithmetic!
   return (void *)*addr;
}


