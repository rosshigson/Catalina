/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 */

#include <stdint.h>

/* A union which permits us to convert between a float and a 32 bit int.  */

typedef union
{
  float value;
  uint32_t word;
} ieee_float_shape_type;

/* Get a 32 bit int from a float.  */

#define GET_FLOAT_WORD(i,d)                                     \
do {                                                            \
  ieee_float_shape_type gf_u;                                   \
  gf_u.value = (d);                                             \
  (i) = gf_u.word;                                              \
} while (0)

/* Set a float from a 32 bit int.  */

#define SET_FLOAT_WORD(d,i)                                     \
do {                                                            \
  ieee_float_shape_type sf_u;                                   \
  sf_u.word = (i);                                              \
  (d) = sf_u.value;                                             \
} while (0)


long lround(float x)
{
  int32_t exponent_less_127;
  uint32_t w;
  long result;
  int32_t sign;

  GET_FLOAT_WORD (w, x);
  exponent_less_127 = ((w & 0x7f800000) >> 23) - 127;
  sign = (w & 0x80000000) != 0 ? -1 : 1;
  w &= 0x7fffff;
  w |= 0x800000;

  if (exponent_less_127 < (int)((8 * sizeof (long int)) - 1))
    {
      if (exponent_less_127 < 0)
        return exponent_less_127 < -1 ? 0 : sign;
      else if (exponent_less_127 >= 23)
        result = (long int) w << (exponent_less_127 - 23);
      else
        {
          w += 0x400000 >> exponent_less_127;
          result = w >> (23 - exponent_less_127);
        }
    }
  else
      return (long int) x;

  return sign * result;
}

