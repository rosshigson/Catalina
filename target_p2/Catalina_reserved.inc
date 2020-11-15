'------------------------- START OF RESERVED HUB ------------------------------
DAT

        orgh  $1000

RESERVED jmp  #\NON_RESERVED  ' Lower 20 bits = address of non-reserved hub
CLKFREQ  long _CLOCKFREQ      ' initial clock frequency (not updated)
CLKMODE  long _CLOCKMODE      ' initial clock mode (not updated)
BAUDRATE long _BAUDRATE       ' initial baud rate (not updated)

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

NON_RESERVED
'--------------------------- END OF RESERVED HUB ------------------------------
