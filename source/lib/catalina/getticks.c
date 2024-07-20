#include <sd.h>

unsigned long _getticks(unsigned long *seconds, unsigned long *ticks) {
  int result;
	struct __service_param_2 {
    unsigned long seconds;
    unsigned long ticks;
  } tmp = {0, 0};
	result = _sys_plugin (-SVC_GETTICKS, (long)&tmp&0x00FFFFFF);
  *seconds = tmp.seconds;
  *ticks = tmp.ticks;
  return result;
}
