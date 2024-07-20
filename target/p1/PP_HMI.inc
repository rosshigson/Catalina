'===============================================================================
'
' Propeller Platform HMI definitions:
' 
'===============================================================================

#ifdef HIRES_VGA
#define NOT_SUPPORTED
#elseifdef LORES_VGA
#define NOT_SUPPORTED
#elseifdef VGA
#define NOT_SUPPORTED
#elseifdef HIRES_TV
#define SUPPORT_HIRES_TV
#elseifdef LORES_TV
#define SUPPORT_LORES_TV
#elseifdef TV
#define SUPPORT_LORES_TV
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
#define SUPPORT_HIRES_TV
#endif

' PP has no mouse
#ifndef NO_MOUSE
#define NO_MOUSE
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

