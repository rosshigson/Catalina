#include <serial8.h>

void s8_str(unsigned port, char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      s8_tx(port, ch);
   }
}
