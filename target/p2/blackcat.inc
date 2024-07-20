' Load and initialize the BlackCat/BlackBox debug cog

DAT

' BlackCat initialization code ...

INITIALIZE_BLACKCAT
         rdlong  r0, ##FREE_MEM
         sub     r0, #_BLACKCAT_SIZE ' allocate BlackCat block
         andn    r0, #$3             ' FREE_MEM should always be long aligned
         wrlong  r0, ##FREE_MEM
         wrlong  r0, ##@bc_buff
         mov     r1,#0
         wrlong  r1,##DEBUG_ADDR
         wrlong  r1,##DEBUG_FLAG
         mov     r2,#_BLACKCAT_SIZE/4
.zero_bc_buff 
         wrlong  r1,r0
         add     r0,#4
         djnz    r2,#.zero_bc_buff
         setq    ##@bc_pars                   ' start ...
         coginit #%10000, ##@BLACKCAT_START   ' ... the BlackCat cog
         ret

' these only need to stay around long enough in Hub RAM for the BlackCat 
' cog to start ...

bc_pars  long _BLACKCAT_RX_PIN
         long _BLACKCAT_TX_PIN
         long _BLACKCAT_MODE
         long (_CLOCKFREQ + (_BLACKCAT_BAUD/2)) / _BLACKCAT_BAUD
bc_buff  long 0

#ifndef CATALINA_TOPLEVEL

' stop the optimizer complaining that these are undefined when compiling 
' intermediate files ...

BLACKCAT_START

#endif

