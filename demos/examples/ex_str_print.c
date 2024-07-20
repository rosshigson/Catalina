/*
 * str_bin, str_dec, str_hex are implementations of the serial output
 * functions, found in source/lib/tty as tty_bin.c, tty_dec.c, tty_hex,c,
 * etc. They accept a char buffer as an additional parameter - the result 
 * is null terminated. 
 *
 * str_float is an enhanced version of the original t_float found in 
 * /source/lib//catalina. Accepts a char buffer as an additional 
 * parameter - the result is null terminated. 
 *
 * str_float accepts the following to specify how to print the float:
 *
 *    width     : field width (up to MAX_WIDTH)
 *    precision : number of digits after decimal point (up to MAX_PRECN)
 *    flags     : bit 0 : 0 use 'e' when printing exponents.
 *                        1 use 'E' when printing exponents
 *                bit 1 : 0 precision takes priority over width.
 *                        1 width takes priority over precision
 *                bit 2 : 0 do not include sign for positive numbers.
 *                        1 always include sign (i.e. '+' or '-').
 *
 * Enhancements: 
 *
 *    Exponents will always be output with at least 2 digits (as per printf).
 *
 *    It can print 'E' in place of 'e' for exponents (as per printf).
 *
 *    It can always include a sign (as per printf).
 *
 *    If the width is greater than zero, and greater than that required by
 *    the specified precision (up to MAX_PRECN) the field will be padded to 
 *    the specified width (up to MAX_WIDTH) with spaces.
 *
 *    If the precision is greater than zero, that number of digits will be
 *    added after the decimal point (up to MAX_PRECN).
 *
 *    If the precision is zero, the decimal point will be omitted.
 *
 *    If width is given priority only width characters will be output unless 
 *    the width is too small to contain the result.
 *
 *    If precision is given priority, that number of digits will always
 *    be output after the decimal point even if the result is wider than the
 *    specified width.
 *
 *    If the specified width and precision cannot both be honoured then 
 *    precision is prioritized over field width.
 *
 * In all cases it is the responsibility of the caller to make sure 
 * the buffer provided is large enough!
 *
 * Compile this demo program with a command like:
 *
 *   catalina -C C3 -C TTY ex_str_print.c -lc -lm
 *
 */
#include <float.h>
#include <math.h>
#include <limits.h>
#include <stdlib.h>

#define MAX_WIDTH 30            // maximum field width supported (arbitrary)
#define MAX_PRECN FLT_DIG+2     // maximum precision supported (for float)

/*
 * itoa() - convert integer to string
 *
 * expects: an integer, and a char buffer of at least ITOA_BUFSIZE 
 *
 * returns: a pointer to the filled portion of the buffer
 */

#define ITOA_BUFSIZE 22 /* for 64 bits = 20 digits + sign + trailing nul */

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

/* ascii exponent, padded to at least 2 digits and with sign - 32 bit only! */
static char *exptoa(int e, char *itoa_buf) {
   char *pos = itoa_buf + ITOA_BUFSIZE - 1;
   unsigned int u;
   int pad = 0;
   int negative = 0;

   if (e < 0) {
      negative = 1;
      u = ((unsigned)(-(1+e))) + 1;
   }
   else {
      u = e;
   }
   
   if (u < 10) {
     pad = 1;
   }

   *pos = 0;

   do {
      *--pos = '0' + (u % 10);
      u /= 10;
   } while (u);

   if (pad) {
     *--pos = '0';
   }

   if (negative) {
      *--pos = '-';
   }

   return pos;
}

/* check for nan or inf - 32 bit only! */

static char * NanOrInf(double r, char *s) {
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
      return (char *)0;
   }
}

static float _powten[] = {
                  1e-37, 1e-36, 1e-35, 1e-34, 1e-33, 1e-32, 1e-31, 1e-30,
    1e-29, 1e-28, 1e-27, 1e-26, 1e-25, 1e-24, 1e-23, 1e-22, 1e-21, 1e-20,
    1e-19, 1e-18, 1e-17, 1e-16, 1e-15, 1e-14, 1e-13, 1e-12, 1e-11, 1e-10,
    1e-09, 1e-08, 1e-07, 1e-06, 1e-05, 1e-04, 1e-03, 1e-02, 1e-01, 1e-00,
    1e+01, 1e+02, 1e+03, 1e+04, 1e+05, 1e+06, 1e+07, 1e+08, 1e+09, 1e+10,
    1e+11, 1e+12, 1e+13, 1e+14, 1e+15, 1e+16, 1e+17, 1e+18, 1e+19, 1e+20,
    1e+21, 1e+22, 1e+23, 1e+24, 1e+25, 1e+26, 1e+27, 1e+28, 1e+29, 1e+30,
    1e+31, 1e+32, 1e+33, 1e+34, 1e+35, 1e+36, 1e+37, 1e+38
};

/* calculate 10^n with as much precision as possible - 32 bit only! */
float powten(int n)
{
    if (n < -37) {
        return 0.0f;
    }
    if (n > 38) {
        return FLT_MAX; /* infinity */
    }
    return _powten[n+37];
}

/*
 * str_float - print a float to a buffer.
 *
 */
void str_float(double d, int width, int precision, int flags, char *buffer) {
   char str1[MAX_WIDTH + 1];
   char str2[MAX_WIDTH + 1];
   char str3[MAX_WIDTH + 1];
   char str[MAX_WIDTH + 1];
   char itoa_buf[ITOA_BUFSIZE];
   int n;
   double frac;
   int exp;
   int l1;
   int l2;
   int l3;
   int digits;
   int sign;

   if (NanOrInf(d, str)) {
      strcpy(buffer, str);
      return;
   }

  if (d < 0) {
     d = -d;
     sign = -1;
     str[0] = '-';
     str[1] = '\0';
  }
  else if (flags & 4) {
     sign = -1;
     str[0] = '+';
     str[1] = '\0';
  }
  else {
     sign = 0;
     str[0] = '\0';
  }

  if (d == 0.0) {
     exp = 0;
  }
  else {
     exp = (int)log10(d);
  }

  if (width > MAX_WIDTH) {
     width = MAX_WIDTH;
  }

  if (flags & 2) {
     // width takes precedence when calculating digits
     digits = width + sign - 1;
     if (precision > 0) {
       digits --; // allow for '.'
     }
     if (digits <= 0) {
        digits = (precision > 0 ? 1 : 0);
     }
  }
  else {
     // precision takes precedence
     digits = precision;
  }

  if (digits > MAX_PRECN) {
     digits = MAX_PRECN;
  }

  if ((exp > digits) || (d > (float)(INT_MAX & ~0x7F))) {
     d /= powten(exp);
     if (d >= 10.0) {
        d /= 10.0;
        exp++;
     }
  }
  else if ((exp < 0) && ((exp <= -digits) || (digits > precision))) {
     d *= powten(-exp);
     if (d < 1.0) {
        d *= 10.0;
        exp--;
     }
  }
  else {
     // print without exponent
     if (exp > 0) {
        digits -= exp;
     }
     exp = 0;
  }

  if (flags & 2) {
     // calculate digits required for exponent 
     if (exp > 0) {
        digits -= 1 + (exp < 100 ? 2 : 3);
     }
     else if (exp < 0) {
        digits -= 2 + (-exp < 100 ? 2 : 3);
     }
     if (digits <= 0) {
        digits = (precision > 0 ? 1 : 0);
     }
  }

  n = (int)d;

  frac = d - n;
  if (digits > precision) {
     digits = precision;
  }
  frac *= powten(digits);

  strcpy(str1, itoa(n, itoa_buf));
  l1 = strlen(str1);

  if (precision > 0) {
     strcpy(str2, itoa((int)frac, itoa_buf));
     l2 = strlen(str2);
  }
  else {
     str2[0] = 0;
     l2 = 0;
  }

  *str3 = 0;
  if (exp != 0) {
     strcpy(str3, exptoa(exp, itoa_buf));
     l3 = strlen(str3);
  }
  else {
     l3 = 0;
  }

  strcat(str, str1);
  if (precision > 0) {
     strcat(str, ".");
     for (n = strlen(str2); n < digits; n++) {
        strcat(str, "0");
     }
     strcat(str, str2);
     if (exp != 0) {
        for (n = strlen(str2); n < precision; n++) {
           strcat(str2, "0");
        }
     }
  }
  if (exp != 0) {
     if (flags & 1) {
        strcat(str, "E");
     }
     else {
        strcat(str, "e");
     }
     strcat(str, str3);
  }
  for (n = strlen(str); n < width; n++) {
     *(buffer++) = ' ';
  }
  n = 0;
  while (str[n] != 0) {
     *(buffer++) = str[n++];
  }
  *buffer = 0;
}

void str_bin(unsigned value, int digits, char *buffer) {
  value <<= (32 - digits);
  while (digits-- > 0) {
     *(buffer++) = (((value & 0x80000000) == 0) ? '0' : '1');
     value <<= 1;
  }
  *buffer++ = 0;
}

void str_decl(int value, int digits, int flag, char *buffer) {
   int i = 1000000000;
   int j;
   int result = 0;

   if (digits < 1) {
      digits = 1;
   }
   if (digits > 10) {
      digits = 10;
   }
   if (value < 0) {
      value = -value;
      *(buffer++) = '-';
   }
   if (flag & 3) {
       for (j = 10-digits; j > 0; j--) {
         i /= 10; //  adjust divisor
       }
   }
   
   for (j = 0; j < digits; j++) {
     if (value >= i) {
       *(buffer++) = value / i + '0';
       value %= i;
       result = -1;
     }
     else if ((i == 1) || result || (flag & 2)) {
       *(buffer++) = '0';
     }
     else if (flag & 1) {
        *(buffer++) = ' ';
     }
     i /= 10;
   }
   *buffer = 0;
}

#define str_dec(value, buffer) str_decl(value, 10, 0, buffer)

#define str_decf(value, width, buffer) str_decl(value,width,1, buffer)

#define str_decx(value, width, buffer) str_decl(value,width,2, buffer)

void str_hex(unsigned value, int digits, char *buffer) {
   int i;
   int j;
   int count = 0;

   if (digits < 1) {
      digits = 1;
   }
   if (digits > 8) {
      digits = 8;
   }
   value <<= ((8 - digits) << 2);
   for (j = 0; j < digits; j++) {
      i = ((value >> 28) & 0xF);
      if (i > 9) {
         i += 'A' - 10 - '0';
      }
      *(buffer++) = (i + '0');
      value <<= 4;
   }
   *buffer = 0;
}

void test_float (float f, int width, int precision, int flags) {
   char buffer[MAX_WIDTH + 1] = "";

   str_float(f, width, precision, flags, buffer);
   t_printf("result = \"%s\"\n", buffer);
}

void main() {
   char buffer[MAX_WIDTH + 1] = "";
   float f;

   str_hex(0x1234, 4, buffer);
   t_printf("result = \"%s\"\n", buffer);

   str_dec(0x1234, buffer);
   t_printf("result = \"%s\"\n", buffer);

   str_decf(0x1234, 8, buffer);
   t_printf("result = \"%s\"\n", buffer);

   str_decx(0x1234, 8, buffer);
   t_printf("result = \"%s\"\n", buffer);

   str_bin(0x1234, 16, buffer);
   t_printf("result = \"%s\"\n", buffer);

   f = 1.2345678;
   test_float(f, 0, 1, 3);

   f = -1.2345678;
   test_float(f, 0, 1, 3);

   f = 123.45678;
   test_float(f, 5, 1, 3);

   f = -123.45678;
   test_float(f, 5, 1, 3);

   f = 123.45678;
   test_float(f, 8, 8, 3);

   f = -123.45678;
   test_float(f, 8, 8, 3);

   f = 1234.5678e-03;
   test_float(f, 10, 8, 0);

   f = -1234.5678e-03;
   test_float(f, 10, 8, 2);

   f = -1.2345678e06;
   test_float(f, 10, 8, 3);

   f = 1.2345678e-06;
   test_float(f, 10, 8, 3);
 
   f = -1.2345678e09;
   test_float(f, 10, 2, 7);

   f = 1.2345678e-09;
   test_float(f, 10, 2, 7);

   f = -1.2345678e09;
   test_float(f, 10, 8, 0);

   f = 1.2345678e-09;
   test_float(f, 10, 8, 0);

   f = -1.2345678e15;
   test_float(f, 20, 8, 0);

   f = 1.2345678e-15;
   test_float(f, 20, 8, 0);

   f = -1.2345678e15;
   test_float(f, 40, 4, 4);

   f = 1.2345678e-15;
   test_float(f, 40, 4, 4);

   f = -1.2345678e38;
   test_float(f, 40, 0, 4);

   f = 1.2345678e-38;
   test_float(f, 40, 0, 4);

   while(1);
}
