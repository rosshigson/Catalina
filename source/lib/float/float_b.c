#include <floatext.h>

/*
 * Float_B calls:
 */

float mod(float a) {
	return _float_request(LMM_FLB, 19, a, 0);
}

float asin(float a) {
	return _float_request(LMM_FLB, 20, a, 0);
}

float acos(float a) {
	return _float_request(LMM_FLB, 21, a, 0);
}

float atan(float a) {
	return _float_request(LMM_FLB, 22, a, 0);
}

float atan2(float a, float b) {
	return _float_request(LMM_FLB, 23, a, b);
}

float floor(float a) {
	return _float_request(LMM_FLB, 24, a, 0);
}

float ceil(float a) {
	return _float_request(LMM_FLB, 25, a, 0);
}
