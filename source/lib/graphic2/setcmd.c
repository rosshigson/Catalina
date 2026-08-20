#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

/* internal suport functions */

int _setcommand(long cmd, long argptr) {
  long g_cmd;
  g_cmd = (cmd<<24) + argptr;
  return _short_service(SVC_T_GRAPHICS, (long)&g_cmd);
}


