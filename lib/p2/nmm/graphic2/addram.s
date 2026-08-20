' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_add_ram

 alignl ' align long
C_g_add_ram ' <symbol:g_add_ram>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-36) ' reg <- addrli
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_g_add_ram_5 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #18 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
C_g_add_ram_5
' C_g_add_ram_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand
' end
