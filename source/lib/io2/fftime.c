/*
 * A dummy implementation of get_fattime() for FatFs.
 *
 */

#include "ff.h"

// use dummy clock functions

void set_CLOCK_from_RTC() {
}

DWORD get_fattime() {
   return	(DWORD)((FF_NORTC_YEAR - 1980) << 25)
      |   (DWORD)(FF_NORTC_MON << 21)
      |   (DWORD)(FF_NORTC_MDAY << 16);
}

