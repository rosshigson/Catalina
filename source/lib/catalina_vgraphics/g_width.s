' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_smuk_6188bf8d_pixels_L000001 ' <symbol:pixels>
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
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $feaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r13, ##@C_G__V_A_R_+96 ' reg <- addrg
 mov r22, ##@C_G__V_A_R_
 rdword r22, r22 ' reg <- INDIRI2 addrg
 mov r11, r22 ' CVII
 mov r11, r22 ' CVII
 shl r11, #16
 sar r11, #16 ' sign extend
 mov r9, ##@C_G__V_A_R_+48 ' reg <- addrg
 mov r22, r23
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_g_width_6 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_g_width_7 ' JUMPV addrg
C_g_width_6
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
C_g_width_7
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 and r23, #15 ' BANDI4 coni
 wrlong r23, ##@C_G__V_A_R_+28 ' ASGNI4 addrg reg
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
 mov r22, ##@C_G__V_A_R_+96 ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__setcommand
 add SP, #4 ' CALL addrg
 mov r22, r23
 xor r22, #15 ' BXORI4 coni
 mov r15, r22
 and r15, #15 ' BANDI4 coni
 subs r21, #2 ' SUBI4 coni
 mov r22, ##@C_smuk_6188bf8d_pixels_L000001 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r7, r22 ' reg <- INDIRU1 reg
 mov r17, #0 ' reg <- coni
 jmp #\@C_g_width_13 ' JUMPV addrg
C_g_width_10
 cmps r11,  #0 wz
 if_z jmp #\C_g_width_14 ' EQI4
 mov r22, ##$ffffffff ' reg <- con
 mov r20, r15
 shl r20, #1 ' LSHI4 coni
 shr r22, r20 ' RSHU (1)
 mov r20, r15
 and r20, #14 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 wrlong r22, r9 ' ASGNI4 reg reg
 jmp #\@C_g_width_15 ' JUMPV addrg
C_g_width_14
 mov r22, r15
 adds r22, #16 ' ADDI4 coni
 mov r20, ##$ffffffff ' reg <- con
 shr r20, r22 ' RSHU (1)
 sar r22, #1 ' RSHI4 coni
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 wrlong r22, r9 ' ASGNI4 reg reg
C_g_width_15
 adds r9, #4 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_g_width_16 ' EQI4
 mov r20, r7 ' CVUI
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
' C_g_width_11 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_g_width_13
 mov r22, r23
 sar r22, #1 ' RSHI4 coni
 cmps r17, r22 wcz
 if_be jmp #\C_g_width_10 ' LEI4
' C_g_width_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
