' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fflush

 alignl ' align long
C_fflush ' <symbol:fflush>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_catalina_fflush ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_fflush_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export __cleanup

 alignl ' align long
C___cleanup ' <symbol:__cleanup>
' C___cleanup_2 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Import catalina_fflush
' end
