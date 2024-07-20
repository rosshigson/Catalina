/*
 * A set of "wrapper" functions to access the 
 * services provided by the Generic Plugin
 */
#ifndef CATALINA_GENERIC_PLUGIN_H
#define CATALINA_GENERIC_PLUGIN_H

#include <plugin.h>

#include <cog.h>

#ifndef __CATALINA_PLUGIN
// warn the user they have forgotten to load the plugin!
#error ERROR: This program must be compiled with -C PLUGIN
#endif

// define the type of this plugin (Dummy)
#define LMM_DUM 8

// define the buffer size required by this plugin
#define BUFFER_SIZE 100

// Service_1 is an example "initialization" service:
extern int Service_1(char *buffer);

// Service_2 turns on up to 24 outputs:
extern int Service_2(unsigned long outputs);

// Service_3 turns on up to 32 outputs:
extern int Service_3(unsigned long outputs);

// Service 4 delays for the specified count, then 
// turns off up to 32 ouptuts:
extern int Service_4(unsigned long outputs, unsigned long count);

#endif

