#include <floatext.h>

/*
 * Float_A calls:
 */
long _ltrunc(float a) {
	return _long_float_request(LMM_FLA, 6, a, 0);
}

long _lround(float a) {
	return _long_float_request(LMM_FLA, 7, a, 0);
}

float sqrt(float a) {
	return _float_request(LMM_FLA, 8, a, 0);
}

float sin(float a) {
	return _float_request(LMM_FLA, 10, a, 0);
}

float cos(float a) {
	return _float_request(LMM_FLA, 11, a, 0);
}

float tan(float a) {
	return _float_request(LMM_FLA, 12, a, 0);
}

float log(float a) {
	return _float_request(LMM_FLA, 13, a, 0);
}

float log10(float a) {
	return _float_request(LMM_FLA, 14, a, 0);
}

float exp(float a) {
	return _float_request(LMM_FLA, 15, a, 0);
}

float exp10(float a) {
	return _float_request(LMM_FLA, 16, a, 0);
}

float pow(float a, float b) {
	return _float_request(LMM_FLA, 17, a, b);
}

float frac(float a) {
	return _float_request(LMM_FLA, 18, a, 0);
}

