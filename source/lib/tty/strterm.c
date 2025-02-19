#include <tty.h>

void s_strterm(char *stringptr, char term) {
   s_str(stringptr);
   s_tx(term);
}
