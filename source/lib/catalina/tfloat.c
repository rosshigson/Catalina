#ifndef NOFLOAT

#include <math.h>
#include <string.h>

/*
 * t_float is a quick hack to provide a means of printing floating point 
 * numbers without having to include printf - it should have been included 
 * in the Catalina HMI plugin (or perhaps in Float_A or Float_B) but there
 * is not enough space.
 *
 * Be aware that this version is not absolutely accurate - e.g. it may print 
 * a number such as 3.2 as 3.19999 or 3.20001 !
 *
 */

#define FLOAT_STRLEN 40

/*
 * itoa() - convert integer to string
 *
 * expects: an integer, and a char buffer of at least ITOA_BUFSIZE 
 *
 * returns: a pointer to the filled portion of the buffer
 */

#define ITOA_BUFSIZE 12 /* 10 digits + 1 sign + 1 trailing nul */

static char *itoa(int i, char *itoa_buf) {
   char *pos = itoa_buf + ITOA_BUFSIZE - 1;
   unsigned int u;
   int negative = 0;

   if (i < 0) {
      negative = 1;
      u = ((unsigned)(-(1+i))) + 1;
   }
   else {
      u = i;
   }

   *pos = 0;

   do {
      *--pos = '0' + (u % 10);
      u /= 10;
   } while (u);

   if (negative) {
      *--pos = '-';
   }

   return pos;
}

static char * NanOrInf(float r, char *s) {
   float f = r;
   if ((*((unsigned long *) &f) & 0x7f800000) == 0x7f800000) { /* NaN or Inf */
      if ((*((unsigned long *) &f) & 0x007fffff) == 0) { /* Inf */
         if (*((unsigned long *) &f) & 0x80000000) {
            *s++ = '-';
         }
         strcpy(s, "inf");
         return s+3;
      }
      else { /* NaN */
         if (*((unsigned long *) &f) & 0x80000000) {
            *s++ = '-';
         }
         strcpy(s, "nan");
         return s+3;
      }
   }
   else {
      return NULL;
   }
}

void t_float(int curs, float f, int digits) {
  char str1[FLOAT_STRLEN], str2[FLOAT_STRLEN], str[FLOAT_STRLEN];
  char itoa_buf[ITOA_BUFSIZE];
  int n;
  float frac;
  int exp;
  char *fracstr;

  if (digits > 8) {
     digits = 8;
  }

   if (NanOrInf(f, str)) {
      t_string(curs, str);
      return;
   }


  if (f < 0) {
     f = -f;
     str[0] = '-';
     str[1] = '\0';
  }
  else {
     str[0] = '\0';
  }

  if (f == 0.0) {
     exp = 0;
  }
  else {
     exp = (int)log10(f);
  }

  if (exp > digits) {
     f = f/pow(10.0, exp);
     if (f >= 10.0) {
        f /= 10.0;
         exp++;
     }
  }
  else if (exp < -digits) {
     f = f * pow(10.0, -exp);
     if (f < 1.0) {
        f *= 10.0;
        exp--;
     }
  }
  else {
     exp = 0;
  }

  n = (int)f;
 
  frac = f - n;
  frac *= pow(10, digits);
 
  strcpy(str1, itoa(n, itoa_buf));
  strcpy(str2,  itoa((int)frac, itoa_buf));

  strcat(str, str1);
  strcat(str, ".");
  for (n = strlen(str2); n < digits; n++) {
     strcat(str, "0");
  }
  strcat(str, str2);
  if (exp != 0) {
     strcpy(str1, itoa(exp, itoa_buf));
     strcat(str, "e");
     strcat(str, str1);
  }
  t_string(curs, str);
}

#endif
