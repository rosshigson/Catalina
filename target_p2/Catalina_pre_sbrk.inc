' This file is for plugin code and data that is required to be left in Hub
' RAM after the plugin is loaded into a cog and started.
'
' Anything placed in this file will be placed BEFORE the C sbrk. Normally,
' all plugin code and data is placed AFTER the C sbrk, and so will be lost 
' once the C program execution starts (unless the symbol SBRK_AFTER_PLUGINS
' is defined). 

' Catalina Init

DAT ' initialized data segment

#if defined(NEED_FLOAT_A) || defined (NEED_FLOAT_B)
  orgh
' The Float A and Float B Plugins require the Propeller 1 ROM tables ...
#include <P8X32A_ROM_TABLES.spin2>
#endif

   alignl

#if defined(VGA) || defined(LORES_VGA) || defined(HIRES_VGA) || defined(VGA_640) || defined(VGA_800) || defined(VGA_1024)

#ifndef VGA
#define VGA
#endif

  orgh
' The VGA HMI Plugin requires font data ...
FONT_TABLE
' the following include file was made using:
'   bindump unscii-16.bin -p "  long $" >unscii-16.inc
#include <unscii-16.inc>
' the following include file was made using:
'   bindump unscii-8-fantasy.bin -p "  long $" >unscii-8-fantasy.inc
'#include <unscii-8-fantasy.inc>

#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
' the USB keyboard/mouse plugin requires some code and data before SBRK
#include <Catalina_1CogKbM_Common.spin2>
' Note that we can use either port A or B for the keyboard or mouse:
#include <Catalina_1CogKbM_pre_sbrk_A.spin2>
#endif
#if !defined(NO_MOUSE) && !defined(NO_KEYBOARD)
#include <Catalina_1CogKbM_pre_sbrk_B.spin2>
#endif
#endif
