
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


double frexp(double x, int *eptr) {
	union ieee754_twiddle t;
	t.x = x;
	*eptr = 0;
        if ((t.b.exp == 255) || (t.b.mnt == 0) && (t.b.exp == 0)) {
		// inf, nan or zero
		return x;
	}
	if (t.b.exp < 1) {
		// subnormal
		t.x *= 8.388608e6; /* (float) 2^23 */
		*eptr = -23;
		
	}
	*eptr += t.b.exp - 126;
	t.b.exp = 126;
	return t.x;
}
