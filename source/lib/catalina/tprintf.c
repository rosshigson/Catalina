#include <hmi.h>

int
t_vprintf (char *str, va_list ap)
{
  int i, n;
  char c;

  i = 0;
  n = 5;
//  va_start (ap, str);         /* Initialize the argument list. */
  do {
     c = str[i++];
     if (c == '%') {
         c = str[i++];
         if ((c >= '0') && (c <= '9')) {
             n = c - '0';
             c = str[i++];
             while ((c >= '0') && (c <= '9')) {
                n = 10*n + (c - '0');
                c = str[i++];
             }
             if (c == '.') {
                c = str[i++];
                while ((c >= '0') && (c <= '9')) {
                  c = str[i++];
                }
             }
         }
         if ((c == 'h') || (c == 'l')) {
            c = str[i++];
            if ((c == 'h') || (c == 'l')) {
               c = str[i++];
            }
         }
         switch (tolower(c)) {
            case 'c' : t_char(1, va_arg (ap, char)); break;
            case 'u' : t_unsigned(1, va_arg (ap, int)); break;
            case 'd' : t_integer(1, va_arg (ap, int)); break;
            case 's' : t_string(1, va_arg (ap, char *)); break;
#ifndef NOFLOAT
            case 'e' : 
            case 'f' : 
            case 'g' : t_float(1, va_arg(ap, float), n); break;
#endif                       
            case 'x' : t_hex(1, va_arg(ap, unsigned)); break;
            case '\0': break;
            default  : t_char(1, c); break;
         }
     }
     else if (c != '\0') {
         t_char(1, c);
     }
  } while (c);

//  va_end (ap);                  /* Clean up. */
  return i;
}


int
t_printf (char *str, ...)
{
  va_list ap;
  int retval;

  va_start (ap, str);         /* Initialize the argument list. */
  retval = t_vprintf (str, ap);
  va_end (ap);                  /* Clean up. */
  return retval;
}

