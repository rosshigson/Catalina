#include <serial2.h>

void s2_str(unsigned port, char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      s2_tx(port, ch);
   }
}
