/*
 * math.h - mathematics
 */
/* $Id: math.h,v 1.7 1994/06/24 11:41:01 ceriel Exp $ */

#if	!defined(_MATH_H)
#define	_MATH_H

double __huge_val(void);	/* may be infinity */
#define	HUGE_VAL	(__huge_val())
// Catalina only has double, but these may be expected to exist ...
#define	HUGE_VALF	((float)__huge_val())
#define	HUGE_VALL	((long double)__huge_val())

//int	__IsNan(double d);	/* test for Not A Number (now a macro!) */

double	acos(double _x);
double	asin(double _x);
double	atan(double _x);
double	atan2(double _y, double _x);

double	cos(double _x);
double	sin(double _x);
double	tan(double _x);

double	cosh(double _x);
double	sinh(double _x);
double	tanh(double _x);

double	exp(double _x);
double	log(double _x);
double	log10(double _x);

double	sqrt(double _x);
double	ceil(double _x);
double	fabs(double _x);
double	floor(double _x);

double	pow(double _x, double _y);

double	frexp(double _x, int *_exp);
double	ldexp(double _x, int _exp);
double	modf(double _x, double *_iptr);
double	fmod(double _x, double _y);

/*
 *    Return values for fpclassify
 */
#define FP_NAN		   1
#define FP_INFINITE	 2
#define FP_NORMAL	   4
#define FP_ZERO		   8
#define FP_SUBNORMAL 16

int fpclassify(double x);
int isfinite(double x);
int isnormal(double x);
int isnan(double x);
int isinf(double x);

#define __IsNan(x) isnan(x)

#endif	/* _MATH_H */
