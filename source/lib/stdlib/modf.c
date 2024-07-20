
struct ieee754_bits {
   unsigned mnt : 23; /* bits 22 .. 0 */
   unsigned exp : 8; /* bits 30 .. 23 */
   unsigned sgn : 1; /* bit 31 */
};

union ieee754_twiddle {
   float x;
   unsigned u;
   struct ieee754_bits b;
};


double modf(double x, double *iptr) {
   union ieee754_twiddle t1,t2;
   int j0;
   unsigned i;
   t1.x = x;
   t2.x = x;
   j0 = t1.b.exp-127;          /* corrected exponent of x */
   if (t1.b.exp == 255) {      /* nan or inf */
      t1.b.exp = 0;
      t1.b.mnt = 0;
      if (t1.b.mnt != 0) { /* nan */
         t2.b.exp = 0;
         t2.b.mnt = 0;
      }
   }

   else if (j0 < 0) {      /* |x| < 1 */
      t2.b.exp = 0;
      t2.b.mnt = 0;
   }
   else {
      i = 0x7fffff>>j0;
      if ((j0 >= 23)||(t1.b.mnt&i == 0)) {   /* i is integral */
         t1.b.exp = 0;
         t1.b.mnt = 0;
      }
      else {
         t2.b.mnt &= ~i;
         t1.x -= t2.x;   
      }
   }
   *iptr = t2.x;
   return t1.x;
}
