#include <tty.h>

void tty_strterm(char *stringptr, char term) {
   tty_str(stringptr);
   tty_tx(term);
}
