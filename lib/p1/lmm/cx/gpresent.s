' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_present

 alignl ' align long
C_g_present ' <symbol:g_present>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #70 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_g_present_4 ' LTI4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_g_present_5 ' JUMPV addrg
C_g_present_4
 mov r21, #0 ' reg <- coni
C_g_present_5
 mov r0, r21 ' CVI, CVU or LOAD
' C_g_present_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _short_service
' end
