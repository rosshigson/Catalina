/*
 * fltpr.c - print floating point numbers
 */
/* $Id: fltpr.c,v 1.6 1994/06/24 11:49:19 ceriel Exp $ */

#ifndef	NOFLOAT
#include	<string.h>
#include	<ctype.h>
#include	<stdarg.h>
#include	"loc_incl.h"

static char * NanOrInf(float r, char *s, int flags) {
   float f = r;
	if ((*((unsigned long *) &f) & 0x7f800000) == 0x7f800000) { /* NaN or Inf */
      if ((*((unsigned long *) &f) & 0x007fffff) == 0) { /* Inf */
         if (*((unsigned long *) &f) & 0x80000000) {
            *s++ = '-';
         }
    	   else if (flags & FL_SIGN) {
		      *s++ = '+';
         }
         strcpy(s, "inf");
         return s+3;
      }
      else { /* NaN */
         if (*((unsigned long *) &f) & 0x80000000) {
            *s++ = '-';
         }
    	   else if (flags & FL_SIGN) {
		      *s++ = '+';
         }
         strcpy(s, "nan");
         return s+3;
      }
   }
   else {
      return NULL;
   }
}

static char *
_pfloat(long double r, register char *s, int n, int flags)
{
	register char *s1;
	int sign, dp;
	register int i;
  char buf[81];

   if (s1 = NanOrInf(r, s, flags)) {
      return s1;
   }

	s1 = _fcvt(r, n, &dp, &sign, buf);
	if (sign)
		*s++ = '-';
	else if (flags & FL_SIGN)
		*s++ = '+';
	else if (flags & FL_SPACE)
		*s++ = ' ';

	if (dp<=0)
		*s++ = '0';
	for (i=dp; i>0; i--)
		if (*s1) *s++ = *s1++;
		else *s++ = '0';
	if (((i=n) > 0) || (flags & FL_ALT))
		*s++ = '.';
	while (++dp <= 0) {
		if (--i<0)
			break;
		*s++ = '0';
	}
	while (--i >= 0)
		if (*s1) *s++ = *s1++;
		else *s++ = '0';
	return s;
}

static char *
_pscien(long double r, register char *s, int n, int flags)
{
	int sign, dp; 
	register char *s1;
  char buf[81];

   if (s1 = NanOrInf(r, s, flags)) {
      return s1;
   }

	s1 = _ecvt(r, n + 1, &dp, &sign, buf);
	if (sign)
		*s++ = '-';
	else if (flags & FL_SIGN)
		*s++ = '+';
	else if (flags & FL_SPACE)
		*s++ = ' ';

	*s++ = *s1++;
	if ((n > 0) || (flags & FL_ALT))
		*s++ = '.';
	while (--n >= 0)
		if (*s1) *s++ = *s1++;
		else *s++ = '0';
	*s++ = 'e';
	if ( r != 0 ) --dp ;
	if ( dp<0 ) {
		*s++ = '-' ; dp= -dp ;
	} else {
		*s++ = '+' ;
	}
	if (dp >= 100) {
		*s++ = '0' + (dp / 100);
		dp %= 100;
	}
	*s++ = '0' + (dp/10);
	*s++ = '0' + (dp%10);
	return s;
}

#define	NDIGINEXP(exp)		(((exp) >= 100 || (exp) <= -100) ? 3 : 2)
#define	LOW_EXP			-4
#define	USE_EXP(exp, ndigits)	(((exp) < LOW_EXP + 1) || (exp >= ndigits + 1))

static char *
_gcvt(long double value, int ndigit, char *s, int flags)
{
	int sign, dp;
	register char *s1, *s2;
	register int i;
	register int nndigit = ndigit;
  char buf[81];

   if (s1 = NanOrInf(value, s, flags)) {
      return s1;
   }

	s1 = _ecvt(value, ndigit, &dp, &sign, buf);
	s2 = s;
	if (sign) *s2++ = '-';
	else if (flags & FL_SIGN)
		*s2++ = '+';
	else if (flags & FL_SPACE)
		*s2++ = ' ';

	if (!(flags & FL_ALT))
		for (i = nndigit - 1; i > 0 && s1[i] == '0'; i--)
			nndigit--;

	if (USE_EXP(dp,ndigit))	{
		/* Use E format */
		dp--;
		*s2++ = *s1++;
		if ((nndigit > 1) || (flags & FL_ALT)) *s2++ = '.';
		while (--nndigit > 0) *s2++ = *s1++;
		*s2++ = 'e';
		if (dp < 0) {
			*s2++ = '-';
			dp = -dp;
		}
		else	 *s2++ = '+';
		s2 += NDIGINEXP(dp);
		*s2 = 0;
		for (i = NDIGINEXP(dp); i > 0; i--) {
			*--s2 = dp % 10 + '0';
			dp /= 10;
		}
		return s;
	}
	/* Use f format */
	if (dp <= 0) {
		if (*s1 != '0')	{
			/* otherwise the whole number is 0 */
			*s2++ = '0';
			*s2++ = '.';
		}
		while (dp < 0) {
			dp++;
			*s2++ = '0';
		}
	}
	for (i = 1; i <= nndigit; i++) {
		*s2++ = *s1++;
		if (i == dp) *s2++ = '.';
	}
	if (i <= dp) {
		while (i++ <= dp) *s2++ = '0';
		*s2++ = '.';
	}
	if ((s2[-1]=='.') && !(flags & FL_ALT)) s2--;
	*s2 = '\0';
	return s;
}

char *
_f_print(va_list *ap, int flags, char *s, char c, int precision)
{
	register char *old_s = s;
	long double ld_val;

	if (flags & FL_LONGDOUBLE) ld_val = va_arg(*ap, long double);
	else ld_val = (long double) va_arg(*ap, double);

	switch(c) {
	case 'f':
	case 'F':
		s = _pfloat(ld_val, s, precision, flags);
		break;
	case 'e':
	case 'E':
		s = _pscien(ld_val, s, precision , flags);
		break;
	case 'g':
	case 'G':
		s = _gcvt(ld_val, precision, s, flags);
		s += strlen(s);
		break;
	}
	if ( c == 'E' || c == 'G') {
		while (*old_s && *old_s != 'e') old_s++;
		if (*old_s == 'e') *old_s = 'E';
	}
   else if ( c == 'F' ) {
		while (*old_s) {
         if (islower(*old_s)) {
   		   *old_s = toupper(*old_s);
         }
         old_s++;
      }
   }
	return s;
}
#endif	/* NOFLOAT */
