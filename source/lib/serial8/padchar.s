' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s8_padchar

 alignl ' align long
C_s8_padchar ' <symbol:s8_padchar>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 jmp #\@C_s8_padchar_5 ' JUMPV addrg
C_s8_padchar_2
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s8_tx
 add SP, #4 ' CALL addrg
' C_s8_padchar_3 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_s8_padchar_5
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22, r21 wcz 
 if_b jmp #\C_s8_padchar_2 ' LTU4
' C_s8_padchar_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import s8_tx
' end
