' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s8_bin

 alignl ' align long
C_s8_bin ' <symbol:s8_bin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #32 ' reg <- coni
 subs r22, r19 ' SUBI/P (1)
 shl r21, r22 ' LSHI/U (1)
 jmp #\@C_s8_bin_3 ' JUMPV addrg
C_s8_bin_2
 mov r22, ##$80000000 ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_nz jmp #\C_s8_bin_6  ' NEU4
 mov r17, #48 ' reg <- coni
 jmp #\@C_s8_bin_7 ' JUMPV addrg
C_s8_bin_6
 mov r17, #49 ' reg <- coni
C_s8_bin_7
 mov r22, r17 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s8_tx
 add SP, #4 ' CALL addrg
 shl r21, #1 ' LSHU4 coni
C_s8_bin_3
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 subs r19, #1 ' SUBI4 coni
 cmps r22,  #0 wcz
 if_a jmp #\C_s8_bin_2 ' GTI4
' C_s8_bin_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import s8_tx
' end
