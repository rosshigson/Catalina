' This file is for plugin code and data that is required to be left in Hub
' RAM after the plugin is loaded into a cog and started.
'
' Anything placed in this file will be placed BEFORE the C sbrk. Normally,
' all plugin code and data is placed AFTER the C sbrk, and so will be lost 
' once the C program execution starts (unless the symbol SBRK_AFTER_PLUGINS
' is defined).

#if defined (libma) || defined (libmb) || defined(NEED_FLOAT_A) || defined (NEED_FLOAT_B)
  orgh
' The Float A and Float B Plugins require the Propeller 1 ROM tables ...
#include <p1rom.t>
#endif

   alignl

#if !defined(NO_HMI)

#if defined(SUPPORT_VGA) || defined(VGA) || defined(LORES_VGA) || defined(HIRES_VGA) || defined(VGA_640) || defined(VGA_800) || defined(VGA_1024)

#ifndef VGA
#define VGA
#endif

  orgh

' The VGA HMI Plugin requires font data ...
FONT_TABLE
' the following include file was made using:
'   bindump unscii-16.bin -p "  long $" >font16.inc
#include <font16.inc>
' the following include file was made using:
'   bindump unscii-8-fantasy.bin -p "  long $" >font8f.inc
'#include <font8f.inc>

#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
' the USB keyboard/mouse plugin requires some code and data before SBRK
#include <cogkbmc.t>
' Note that we can use either port A or B for the keyboard or mouse:
#include <kbmprea.t>
#endif
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#include <kbmpreb.t>
#endif

#endif

#endif
