'===============================================================================
'
' Morpheus HMI definitions:
' 
'===============================================================================

#ifdef CPU_1

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
#elseifdef PC
#define SUPPORT_PC
#else
' default
'
'instead of "SUPPORT_PC" as the default, we define a local keyboard and mouse 
' driver so that we can use proxy drivers - but we disable the screen
'
#ifndef NO_SCREEN
#define NO_SCREEN
#endif
#define SUPPORT_LORES_TV
#endif

#elseifdef CPU_2

#ifdef HIRES_TV
#define NOT_SUPPORTED
#elseifdef LORES_TV
#define NOT_SUPPORTED
#elseifdef TV
#define NOT_SUPPORTED
#elseifdef HIRES_VGA
#define SUPPORT_MORPHEUS_HIRES_VGA
#elseifdef PROPTERMINAL
#define SUPPORT_PROPTERMINAL
#elseifdef TTY
#define SUPPORT_TTY
#elseifdef PC
#define SUPPORT_PC
#else
' default
#define SUPPORT_MORPHEUS_HIRES_VGA
#endif

#else

#error : CPU NOT SPECIFIED (SPECIFY CPU_1 OR CPU_2) 

#endif

#ifdef libgraphics

#ifdef PROXY_SCREEN
#error : GRAPHICS NOT SUPPORTED WHEN USING PROXY DRIVERS
#endif

#define SUPPORT_GRAPHICS_TV

#ifndef NO_SCREEN
#define NO_SCREEN
#endif

#endif

