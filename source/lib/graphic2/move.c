#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Move the double buffer bitmap to the display.
//
// This is provided for compatibility with the P1 - it just does g_copy().
//
void g_move(int double_buffer) {
   g_copy(double_buffer);
}


