#include <math.h>

int isfinite(double x) {
    register unsigned int mask = *(unsigned int *)(&x);
    return ((mask & 0x7F800000) != 0x7F800000); // i.e. NOT inf or nan
}

int isnormal(double x) {
    register unsigned int mask = *(unsigned int *)(&x);
    return (   ((mask & 0x7F800000) != 0x7F800000) // i.e. not inf or nan
            && ((mask & 0x7F800000) != 0)); // i.e. and not zero or subnormal
}

int fpclassify(double x) {
    register unsigned int mask = *(unsigned int *)(&x);
    if ((mask & 0x7F800000) == 0x7F800000) {
       if ((mask & 0x007FFFFF) == 0 ) {
         return FP_INFINITE;
       }
       else {
         return FP_NAN;
       }
    }
    else if ((mask & 0x7F800000) == 0) {
       if ((mask & 0x007FFFFF) == 0) {
          return FP_ZERO;
       }
       else {
          return FP_SUBNORMAL;
       }
    }
    else {
       return FP_NORMAL;
    }
}

