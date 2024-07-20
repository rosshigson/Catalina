'
' This file has been modified to suit the Parallax QuickStart board.
'
' This board supports only serial comms HMI options, such as the PC
' and PROPTERM options (the default is TTY). 
'
' It assumes a 5Mhz crystal is installed. 
'
' Programs should be compiled to use the CUSTOM platform - e.g:
'
'    catalina hello_world.c -lc -C CUSTOM
'
'===============================================================================
'
' QuickStart HMI definitions:
' 
'===============================================================================

#ifdef HIRES_VGA
#define NOT_SUPPORTED
#elseifdef LORES_VGA
#define NOT_SUPPORTED
#elseifdef VGA
#define NOT_SUPPORTED
#elseifdef HIRES_TV
#define NOT_SUPPORTED
#elseifdef LORES_TV
#define NOT_SUPPORTED
#elseifdef TV
#define NOT_SUPPORTED
#elseifdef PROPTERMINAL
#define SUPPORT_PROPTERMINAL
#elseifdef TTY
#define SUPPORT_TTY
#elseifdef TTY256
#define SUPPORT_TTY256
#elseifdef PC
#define SUPPORT_PC
#else
' default
#define SUPPORT_TTY
#endif

#ifdef libgraphics

#error : GRAPHICS NOT SUPPORTED ON SELECTED PLATFORM

#ifndef NO_SCREEN
#define NO_SCREEN
#endif

#endif

