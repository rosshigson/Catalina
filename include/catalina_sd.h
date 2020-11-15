#ifndef CATALINA_SD__H
#define CATALINA_SD__H

#include <catalina_plugin.h>

#define __CATALINA_SECTOR_SIZE 512

/*
 * SD calls :
 */
extern unsigned long sd_sectread(char * buffer, long sector);
extern unsigned long sd_sectwrite(char * buffer, long sector);

#endif
