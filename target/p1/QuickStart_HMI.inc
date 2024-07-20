'
' This file has been modified to suit the Parallax QuickStart board, with
' the QuickStart Human Interface board.
'
' This combination supports all HMI options. However, if you do not have
' the QuickStart Human Interface baord, only the serial options, such as 
' the TTY, TTY256, PC and PROPTERM options will work correctly. The default
' is to use the TV option. If you don't have the Human Interfave board, you
' may wish to change the default to PC.
'
' Programs should be compiled to use the QuickStart platform - e.g:
'
'    catalina hello_world.c -lc -C QUICKSTART
'
'===============================================================================
'
' QuickStart HMI definitions:
' 
'===============================================================================

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
'
' the default is HiRes TV - change this to SUPPORT_PC if you do not 
' have the QuickStart Human Interface board installed:
'
#define SUPPORT_HIRES_TV 
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


