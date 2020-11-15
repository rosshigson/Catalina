' Catalina Code

DAT ' code segment

'
' C_debug_init : just in case we use '-g' but then specify the debug target
'
C_debug_init
 jmp #RETN                 ' done

'
' Target-specific PASM goes here ...
'
