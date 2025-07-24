'------------------------- START OF RESERVED HUB ------------------------------

' this definition of the reserved Hub locations is for inclusion in cases
' where the values are defined during normal program compilation.
' Otherwise it should be identical to "reserven.inc"

DAT
         orgh  $1000

RESERVED jmp  #\NON_RESERVED  ' $1000 Lower 20 bits = addr of non-reserved hub
CLKFREQ  long _CLOCKFREQ      ' $1004 initial clock frequency (not updated)
CLKMODE  long _CLOCKMODE      ' $1008 initial clock mode (not updated)
BAUDRATE long _BAUDRATE       ' $100c initial baud rate (not updated)

' seglayout specifies the layout of the segments

seglayout                     ' $1010 - if this changes, change catbind.c
        long  SEGMENT_LAYOUT  

' segtable contains the start address of each of the segments

segtable
        long  @Catalina_Code
        long  @Catalina_Cnst
        long  @Catalina_Init
        long  @Catalina_Data
        long  @Catalina_Ends
        long  @Catalina_RO_Base
        long  @Catalina_RW_Base
        long  @Catalina_RO_Ends
        long  @Catalina_RW_Ends
init_PC long  @C_main                    ' should be filled in with @C_main

#if (defined(QUICKBUILD) || defined(QUICKFORCE)) && !defined(SMALL) && !defined(LARGE)
         orgh P2_LOAD_SIZE
#endif

NON_RESERVED

'--------------------------- END OF RESERVED HUB ------------------------------
