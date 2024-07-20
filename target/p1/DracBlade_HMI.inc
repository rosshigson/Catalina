'===============================================================================
'
' DracBlade HMI definitions:
' 
'===============================================================================

#ifndef NO_MOUSE
#define NO_MOUSE
#endif

#ifdef HIRES_TV
#define SUPPORT_HIRES_TV
#elseifdef LORES_TV
#define SUPPORT_LORES_TV
#elseifdef TV
#define SUPPORT_LORES_TV
#elseifdef HIRES_VGA
#define SUPPORT_HIRES_VGA
#elseifdef LORES_VGA
#define SUPPORT_LORES_VGA
#elseifdef VGA
#define SUPPORT_LORES_VGA
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
#define SUPPORT_HIRES_VGA
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

