#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Get mode - always returns 3 (for 8 bit color). This is intended mainly
// for programs to differentiate P2 virtual graphics from P1  virtual 
// graphics - on the P1, g_mode may return either 0 (for 1 bit color, 
// or 1 (for 2 bit color).
//
int g_mode() {
   return 3;
}


