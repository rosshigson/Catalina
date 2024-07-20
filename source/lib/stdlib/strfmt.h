
#ifndef NOFLOAT

/* NOTE buf must be at least 81 chars! */

char * _ecvt(long double value, int ndigit, int *decpt, int *sign, char *buf);

char * _fcvt(long double value, int ndigit, int *decpt, int *sign, char *buf);

#endif	/* NOFLOAT */
