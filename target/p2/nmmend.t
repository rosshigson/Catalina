' Catalina Code

DAT ' code segment

' <<< INSERT FINAL PASM HERE (if any) >>>

#ifdef CATALINA_TOPLEVEL
#include <presbrk.inc>
#endif

' Catalina Data

DAT ' unitialized data segment

#ifndef SBRK_AFTER_PLUGINS

' sbrkinit is used by sbrk - it must be after all variables and data

' !!!  THIS IS WHERE sbrkinit SHOULD be, but if some plugins need access to
' !!!  their hub images after being loaded it can be moved to the end of 
' !!!  nmm_default.spin2 (nmmdef.t) by defining SBRK_AFTER_PLUGINS
'
 alignl ' align long
sbrkinit  ' heap starts here

#endif

