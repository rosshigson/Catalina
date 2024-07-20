#include <serial2.h>

void s2_strterm(unsigned port, char *stringptr, char term) {
   s2_str(port, stringptr);
   s2_tx(port, term);
}
