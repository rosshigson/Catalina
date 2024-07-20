#ifndef _FLOATEXT__H
#define _FLOATEXT__H

#include <plugin.h>

/*
 * Sofware implementations:
 */
extern long ltrunc(float a);
extern long lround(float a);
/*
 * Float_A calls:
 */
extern long _ltrunc(float a);
extern long _lround(float a);
extern float sqrt(float a);
extern float sin(float a);
extern float cos(float a);
extern float tan(float a);
extern float log(float a);
extern float log10(float a);
extern float exp(float a);
extern float exp10(float a);
extern float pow(float a, float b);
extern float frac(float a);

/*
 * Float_B calls:
 */
extern float mod(float a);
extern float asin(float a);
extern float acos(float a);
extern float atan(float a);
extern float atan2(float a, float b);
extern float floor(float a);
extern float ceil(float a);

#endif
