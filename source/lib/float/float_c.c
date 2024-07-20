#include <floatext.h>

/*
 * Float_C calls:
 */
long _ltrunc(float a) {
	return _long_float_request(LMM_FLC, 6, a, 0);
}

long _lround(float a) {
	return _long_float_request(LMM_FLC, 7, a, 0);
}

float sqrt(float a) {
	return _float_request(LMM_FLC, 8, a, 0);
}

float sin(float a) {
	return _float_request(LMM_FLC, 10, a, 0);
}

float cos(float a) {
	return _float_request(LMM_FLC, 11, a, 0);
}

float tan(float a) {
	return _float_request(LMM_FLC, 12, a, 0);
}

float log(float a) {
	return _float_request(LMM_FLC, 13, a, 0);
}

float log10(float a) {
	return _float_request(LMM_FLC, 14, a, 0);
}

float exp(float a) {
	return _float_request(LMM_FLC, 15, a, 0);
}

float exp10(float a) {
	return _float_request(LMM_FLC, 16, a, 0);
}

float pow(float a, float b) {
	return _float_request(LMM_FLC, 17, a, b);
}

float frac(float a) {
	return _float_request(LMM_FLC, 18, a, 0);
}
float mod(float a) {
	return _float_request(LMM_FLC, 19, a, 0);
}

float asin(float a) {
	return _float_request(LMM_FLC, 20, a, 0);
}

float acos(float a) {
	return _float_request(LMM_FLC, 21, a, 0);
}

float atan(float a) {
	return _float_request(LMM_FLC, 22, a, 0);
}

float atan2(float a, float b) {
	return _float_request(LMM_FLC, 23, a, b);
}

float floor(float a) {
	return _float_request(LMM_FLC, 24, a, 0);
}

float ceil(float a) {
	return _float_request(LMM_FLC, 25, a, 0);
}

