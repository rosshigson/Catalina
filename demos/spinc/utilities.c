#include "utilities.h"

/*
 * wait : pause for a specified number of milliseconds
 */ 
void wait(int milliseconds) {
   _waitcnt(_cnt() + milliseconds *(_clockfreq()/1000));
}


