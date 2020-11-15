' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.14 Code Generator by Ross Higson)
'

' Catalina Export main

 long ' align long
C_main ' <symbol:main>
#ifndef NO_ARGS
 jmp #CALA
 long @C_arg_setup
#endif
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__dira
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__outa
 add SP, #4 ' CALL addrg
C_main_2
' C_main_3 ' (symbol refcount = 0)
 jmp #JMPA
 long @C_main_2 ' JUMPV addrg
 mov r0, #0 ' RET coni
' C_main_1 ' (symbol refcount = 0)
#ifndef NO_EXIT
 jmp #JMPA
 long @C__exit
#endif

' Catalina Import _outa

' Catalina Import _dira
' end
