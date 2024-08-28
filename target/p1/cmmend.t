' Catalina Code

DAT ' code segment

'
' Final PASM goes here (if any) ...
'

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

 long ' align long

'
' sbrkinit is used by sbrk - it must be after all variables and data
'
sbrkinit  ' heap starts here

 long 0 ' this long is required to workaround an obscure homespun bug!!!


