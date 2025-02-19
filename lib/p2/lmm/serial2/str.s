' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s_str

 alignl ' align long
C_s_str ' <symbol:s_str>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s_str_3 ' JUMPV addrg
C_s_str_2
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s_tx
 add SP, #4 ' CALL addrg
C_s_str_3
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s_str_2 ' NEI4
' C_s_str_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import s_tx
' end
