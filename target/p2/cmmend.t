' Catalina Code

DAT ' code segment

' <<< INSERT FINAL PASM HERE (if any) >>>

#ifdef CATALINA_TOPLEVEL
#include <presbrk.inc>
#endif

' Catalina Init

DAT ' initialized data segment

 long ' align long
'
' sbrkover is the maximum top (+1) of the heap - the actual top 
' depends on the stack, but we can't simply use the SP because 
' multithreaded programs can have a stack anywhere in Hub RAM, 
' so we default to this, and expect it to be overwritten at run 
' time with a true value ...
'
sbrkover ' top of heap (+1) used by sbrk 

 long HEAP_TOP

' Catalina Data

DAT ' unitialized data segment

#ifndef SBRK_AFTER_PLUGINS

' sbrkinit is used by sbrk - it must be after all variables and data

' !!!  THIS IS WHERE sbrkinit SHOULD be, but if some plugins need access to
' !!!  their hub images after being loaded it can be moved to the end of 
' !!!  cmm_default.spin2 (cmmdef.t) by defining SBRK_AFTER_PLUGINS
'
 alignl ' align long
sbrkinit  ' heap starts here

#endif

