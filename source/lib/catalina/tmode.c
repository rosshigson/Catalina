#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_mode (unsigned curs, unsigned mode) {
  if (curs == 2) {
    // cursor 2 is graphics cursor
    return _short_service(SVC_T_MODE, (1<<22) + mode);
  }
  else {
    // cursor 0 and 1 are text cursors
    return _short_service(SVC_T_MODE, ((curs&1)<<23) + mode);
  }
}
