' Catalina Code

DAT ' code segment

' <<< INSERT FINAL PASM HERE (if any) >>>

#ifdef CATALINA_TOPLEVEL
#include <Catalina_pre_sbrk.inc>
#endif

' Catalina Data

DAT ' unitialized data segment

#ifndef SBRK_AFTER_PLUGINS

' sbrkinit is used by sbrk - it must be after all variables and data

' !!!  THIS IS WHERE sbrkinit SHOULD be, but if some plugins need access to
' !!!  their hub images after being loaded it can be moved to the end of 
' !!!  cmm_default.spin2 by defining SBRK_AFTER_PLUGINS
'
 alignl ' align long
:malign
 ' this code ensures that sbrkinit is NOT aligned on a boundary of
 ' $XXXXXXXX0C or $XXXXXXXX00, which causes memory allocation to fail
  long 0[((((@:malign+$20)&$FFFFFFE0) - @:malign)>>2)+1]
sbrkinit  ' heap starts here

#endif

