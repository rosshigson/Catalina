' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s8mk_67da3ebc_pixels_L000001 ' <symbol:pixels>
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
 jmp #NEWF
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+84
 mov r13, RI ' reg <- addrg
 jmp #LODL
 long @C_G__V_A_R_+36
 mov r11, RI ' reg <- addrg
 mov r22, r23
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_g_width_6 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_g_width_7 ' JUMPV addrg
C_g_width_6
 mov r7, #0 ' reg <- coni
C_g_width_7
 mov r19, r7 ' CVI, CVU or LOAD
 and r23, #15 ' BANDI4 coni
 jmp #LODL
 long @C_G__V_A_R_+16
 mov BC, r23
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, #1 ' reg <- coni
 mov RI, r23
 sar RI, r22
 mov r22, RI ' RSHI (2)
 mov r21, r22
 adds r21, #1 ' ADDI4 coni
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r13
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+84
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
 mov r15, r23
 xor r15, #15 ' BXORI4 coni
 subs r21, #2 ' SUBI4 coni
 jmp #LODL
 long @C_s8mk_67da3ebc_pixels_L000001
 mov r22, RI ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r9, BC ' reg <- INDIRU1 reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_width_13 ' JUMPV addrg
C_g_width_10
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 mov r20, r15
 shl r20, #1 ' LSHI4 coni
 shr r22, r20 ' RSHU (1)
 mov r20, r15
 and r20, #14 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, r11
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 adds r11, #4 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_g_width_14 ' EQI4
 mov r20, r9 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, #1 ' reg <- coni
 shl r18, r17 ' LSHI/U (1)
 and r20, r18 ' BANDI/U (1)
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_g_width_14 ' EQI4
 adds r15, #2 ' ADDI4 coni
C_g_width_14
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_g_width_16 ' EQI4
 cmps r17, r21 wz
 jmp #BRNZ
 long @C_g_width_16 ' NEI4
 adds r15, #2 ' ADDI4 coni
C_g_width_16
' C_g_width_11 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_g_width_13
 mov r22, r23
 sar r22, #1 ' RSHI4 coni
 cmps r17, r22 wz,wc
 jmp #BRBE
 long @C_g_width_10 ' LEI4
' C_g_width_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
