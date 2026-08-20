' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_g_width_6_L000007 ' <symbol:6>
 byte 0
 byte 0
 byte 0
 byte 0
 byte 0
 byte 0
 byte 2
 byte 5
 byte 10
 byte 10
 byte 26
 byte 26
 byte 52
 byte 58
 byte 116
 byte 116

' Catalina Export g_width

' Catalina Code

DAT ' code segment

 alignl ' align long
C_g_width ' <symbol:g_width>
 calld PA,#NEWF
 sub SP, #48
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r13, FP
 sub r13, #-(-36) ' reg <- addrli
 mov r11, ##@C_G__V_A_R_+28
 rdlong r11, r11 ' reg <- INDIRP4 addrg
 mov r0, FP
 sub r0, #-(-52) ' reg <- addrli
 mov r1, ##@C_g_width_6_L000007 ' reg <- addrg
 calld PA,#CPYB
 long 16 ' ASGNB
 mov r22, r23
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_g_width_9 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #\@C_g_width_10 ' JUMPV addrg
C_g_width_9
 mov r7, #0 ' reg <- coni
C_g_width_10
 mov r19, r7 ' CVI, CVU or LOAD
 and r23, #15 ' BANDI4 coni
 mov r22, ##@C_G__V_A_R_+24
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 mov RI, r23
 sar RI, r22
 mov r22, RI ' RSHI (2)
 mov r21, r22
 adds r21, #1 ' ADDI4 coni
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 wrlong r21, r13 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
 mov r15, r23
 xor r15, #15 ' BXORI4 coni
 subs r21, #2 ' SUBI4 coni
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 adds r22, r23 ' ADDI/P (2)
 rdbyte r9, r22 ' reg <- INDIRU1 reg
 mov r17, #0 ' reg <- coni
 jmp #\@C_g_width_15 ' JUMPV addrg
C_g_width_12
 mov r22, ##$ffffffff ' reg <- con
 mov r20, r15
 shl r20, #1 ' LSHI4 coni
 shr r22, r20 ' RSHU (1)
 mov r20, r15
 and r20, #14 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r11 ' ASGNI4 reg reg
 adds r11, #4 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_g_width_16 ' EQI4
 mov r20, r9 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, #1 ' reg <- coni
 shl r18, r17 ' LSHI/U (1)
 and r20, r18 ' BANDI/U (1)
 cmps r20, r22 wz
 if_z jmp #\C_g_width_16 ' EQI4
 adds r15, #2 ' ADDI4 coni
C_g_width_16
 cmps r19,  #0 wz
 if_z jmp #\C_g_width_18 ' EQI4
 cmps r17, r21 wz
 if_nz jmp #\C_g_width_18 ' NEI4
 adds r15, #2 ' ADDI4 coni
C_g_width_18
' C_g_width_13 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_g_width_15
 mov r22, r23
 sar r22, #1 ' RSHI4 coni
 cmps r17, r22 wcz
 if_be jmp #\C_g_width_12 ' LEI4
' C_g_width_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #48 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
