'------------------------- START OF RESERVED HUB ------------------------------

' this definition of the reserved Hub locations is for inclusion in cases
' where the values normally stored here are not yet defined (e.g. in a 
' program loader where suitable values need to be calculated during load). 
' Otherwise it should be identical to "reserve.inc"

DAT
         orgh  $1000

RESERVED jmp  #\NON_RESERVED  ' $1000 Lower 20 bits = addr of non-reserved hub
CLKFREQ  long _CLOCKFREQ      ' $1004 initial clock frequency (not updated)
CLKMODE  long _CLOCKMODE      ' $1008 initial clock mode (not updated)
BAUDRATE long _BAUDRATE       ' $100c initial baud rate (not updated)

' seglayout specifies the compilation type and layout of the segments:

seglayout                     ' $1010 - if this changes, change catbind.c
#if defined(TINY)
        long  0               ' SEGMENT_LAYOUT 0 = TINY
#elif defined(SMALL)
        long  2               ' SEGMENT_LAYOUT 2 = XMM SMALL
#elif defined(LARGE)
        long  5               ' SEGMENT_LAYOUT 5 = XMM LARGE
#elif defined(COMPACT)
        long  8               ' SEGMENT_LAYOUT 8 = COMPACT
#elif defined(NATIVE)
        long  11              ' SEGMENT_LAYOUT 11 = NATIVE
#else
        long  -1              ' SEGMENT_LAYOUT -1 = UNKNOWN
#endif

' segtable contains the start address of each of the segments:

segtable
        long  0               ' @Catalina_Code
        long  0               ' @Catalina_Cnst
        long  0               ' @Catalina_Init
        long  0               ' @Catalina_Data
        long  0               ' @Catalina_Ends
        long  0               ' @Catalina_RO_Base
        long  0               ' @Catalina_RW_Base
        long  0               ' @Catalina_RO_Ends
        long  0               ' @Catalina_RW_Ends
init_PC long  0               ' @C_main

NON_RESERVED

'--------------------------- END OF RESERVED HUB ------------------------------
