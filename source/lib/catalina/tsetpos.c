#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_setpos (unsigned curs, unsigned cols, unsigned rows) {
  if (curs == 2) {
    // cursor 2 is graphics cursor
    return _short_service(SVC_T_SETPOS, (1<<22) + (cols<<8) + rows);
  }
  else {
    // cursor 0 and 1 are text cursors
    return _short_service(SVC_T_SETPOS, ((curs&1)<<23) + (cols<<8) + rows);
  }
}
