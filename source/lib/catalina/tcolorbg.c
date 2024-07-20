#include <hmi.h>

/*
 * HMI calls : text (screen)
 */

// note: cursor not currently used
int t_color_bg (unsigned curs, unsigned color) {
   // note: cursor not currently used
   return _short_service(SVC_T_COLOR_BG, color&0xFFFFFF);
}
