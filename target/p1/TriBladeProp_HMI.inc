'===============================================================================
'
' TriBladeProp HMI definitions:
' 
'===============================================================================

#ifdef CPU_1

#ifdef HIRES_VGA
#define SUPPORT_HIRES_VGA
#elseifdef LORES_VGA
#define SUPPORT_LORES_VGA
#elseifdef VGA
#define SUPPORT_LORES_VGA
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

#elseifdef CPU_2

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

#elseifdef CPU_3

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
#define SUPPORT_PC
#endif

#else

#error : CPU NOT SPECIFIED (SPECIFY CPU_1, CPU_2 OR CPU_3)

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

