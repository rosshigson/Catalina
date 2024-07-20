#include <graphics.h>

void g_fill(int x, int y, int da, int db, int db2, 
            int linechange, int lines_minus_1) {
   register int *arg_ptr = G_VAR.ARGS;

   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = da;
   *arg_ptr++ = db;
   *arg_ptr++ = db2;
   *arg_ptr++ = linechange;
   *arg_ptr = lines_minus_1;
   _setcommand(CGI_fill, (long)G_VAR.ARGS);
}
