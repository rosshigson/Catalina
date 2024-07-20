' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_color

 alignl ' align long
C_g_color ' <symbol:g_color>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #2 ' reg <- coni
 mov r20, r23
 and r20, #3 ' BANDI4 coni
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_G__V_A_R_+68
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_color_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
