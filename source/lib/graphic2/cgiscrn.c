#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// get address of screen (tile) data from CGI_Info
void *cgi_screen_data(int double_buffer) {
   int *addr;
   addr = (int *)_cgi_data() + 10; // note this is pointer arithmetic!
   return (void *)*addr;
}


