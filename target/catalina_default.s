' Catalina Code

DAT ' code segment

#ifndef NO_DEBUG
'
' C_debug_init : just in case we use '-g' but then specify the default target
'
C_debug_init
#ifdef COMPACT
 word I16B_RETN             ' done
 long ' align long
#else
 jmp #RETN                 ' done
 long ' align long
#endif
#endif

'
' Target-specific PASM goes here ...
'
