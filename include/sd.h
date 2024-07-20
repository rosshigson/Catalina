#ifndef _SD__H
#define _SD__H

#include <plugin.h>

#define __CATALINA_SECTOR_SIZE 512

/*
 * SD calls :
 */
extern unsigned long sd_sectread(char * buffer, long sector);
extern unsigned long sd_sectwrite(char * buffer, long sector);
extern unsigned long _getticks(unsigned long * seconds, unsigned long * ticks);
extern unsigned long _settime(unsigned long time);

#define sd_settime _settime
#define sd_getticks _getticks

#endif
