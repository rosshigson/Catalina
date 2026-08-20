#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_getpos (unsigned curs) {
  if (curs == 2) {
    // cursor 2 is graphics cursor
    return _short_service(SVC_T_GETPOS, (1<<22));
  }
  else {
    // cursor 0 and 1 are text cursors
    return _short_service(SVC_T_GETPOS, ((curs&1)<<23));
  }
}
