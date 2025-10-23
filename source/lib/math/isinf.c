#include <math.h>

int isinf(double x) {
    register unsigned int mask = *(unsigned int *)(&x);
    if (((mask & 0x7F800000) == 0x7F800000) 
    &&  ((mask & 0x007FFFFF) == 0)) {
      return (mask & 0x80000000u ? 1 : -1); // +infinity or -infinity
    }
    return 0; // not infinity
}

