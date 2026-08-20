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

#if !defined (NO_HMI)

' if any VGA related options are defined, ensure VGA itself is defined (this
' simplifies subsequent cases). 

#if !defined(VGA) && !defined(HD_VGA)

#if defined(LORES_VGA) || defined(HIRES_VGA) || defined(VGA_640) || defined(VGA_800) || defined(VGA_1024)
#define VGA
#endif

#if !defined(VGA) && !defined(HD_VGA)

#if defined(FULL_HD_VGA) || defined(VGA_1080) || defined(VGA_1080P) || defined(VGA_1920)
#define HD_VGA
#endif

#endif

#endif

  orgh

#if defined(VGA)

' The VGA HMI Plugin requires font data ...
FONT_TABLE
' the following include file was made using:
'   bindump unscii-16.bin -p "  long $" >font16.inc
#include <font16.inc>
' the following include file was made using:
'   bindump unscii-8-fantasy.bin -p "  long $" >font8f.inc
'#include <font8f.inc>

#if defined(SMALL)
#include <cogvga.t>
#endif

#endif

#if defined(HD_VGA)

'
#if defined(SMALL)
#include <coghdvga.t>
#include <coghdgra.t>
#include <coghdcol.t>
#include <coghdlin.t>
#endif
' include the Hub code and data required by the VGA driver:
#include <hubhdvga.t>

' include the Hub code and data required by HD Graphics:
#include <hubhdgra.t>

#endif

#if defined(VGA) || defined (HD_VGA)

#include <kbmprec.t2>

#if defined(USE_USB_A) || defined(USE_USB_B)

' this is the NEW way to select whether to USE_USB_A and/or USE_USB_B
#if defined(USE_USB_A)
#include <kbmprea.t2>
#if defined(SMALL)
#include <cogkbma.t2>
#endif
#endif
#if defined(USE_USB_B)
#include <kbmpreb.t2>
#if defined(SMALL)
#include <cogkbmb.t2>
#endif
#endif

#else

' this is the OLD way to select whether to USE_USB_A and/or USE_USB_B
' i.e. A and B are BOTH used unless NO_KEYBOARD or NO_MOUSE is specified,
'      with only A being used if only one of these is specified
#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
' the USB keyboard/mouse plugin requires some code and data before SBRK
' Note that we can use either port A or B for the keyboard or mouse:
#if !defined(USE_USB_A) && !defined(SMALL)
#define USE_USB_A
#include <kbmprea.t2>
#endif
#endif
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#if !defined(USE_USB_B) && !defined(SMALL)
#define USE_USB_B
#include <kbmpreb.t2>
#endif
#endif

#endif

#endif

#endif
