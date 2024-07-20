/*
 * strtoi and strtou support functions:
 */
#include <ctype.h>

int isnumber(char c, int base) {
   char lc;

   if (base <= 10) {
      return (isdigit(c) && ((c - '0') < base));
   }
   else {
      lc = tolower (c);
      return ((isdigit(lc) && ((lc - '0') < base)
      ||      (isalpha(lc) && ((lc - 'a') < base - 10))));
   }
}

int tonumber(char c) {
   if (isdigit(c)) {
      return (c - '0');
   }
   else {
      if (isalpha(c)) {
         return (tolower(c) - 'a' + 10);
      }
      else {
         return 0;
      }
   }
}
