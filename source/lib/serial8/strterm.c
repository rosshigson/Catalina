#include <serial8.h>

void s8_strterm(unsigned port, char *stringptr, char term) {
   s8_str(port, stringptr);
   s8_tx(port, term);
}
