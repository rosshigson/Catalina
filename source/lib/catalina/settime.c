#include <sd.h>

unsigned long _settime(unsigned long time) {
  unsigned long tmp = time;
	return _sys_plugin (-SVC_SETTIME, (long)&tmp&0x00FFFFFF);
}

