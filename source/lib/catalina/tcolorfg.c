#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

int t_color_fg (unsigned curs, unsigned color) {
   // note: cursor not currently used
   return _short_service(SVC_T_COLOR_FG, color&0xFFFFFF);
}
