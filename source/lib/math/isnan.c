#include <math.h>

static int isnan(double x) {
    register unsigned int mask = *(unsigned int *)(&x);
    return (((mask & 0x7F800000) == 0x7F800000)
        &&  ((mask & 0x007FFFFF) != 0 ));
}

