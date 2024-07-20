#include <graphics.h>

// Wait for any current graphics command to finish
// use this to insure that it is safe to manually manipulate the bitmap
//
void g_finish() {
   _setcommand(CGI_loop, 0);
}
