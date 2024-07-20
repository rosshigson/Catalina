' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export freopen

 alignl ' align long
C_freopen ' <symbol:freopen>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r13, r22
 and r13, #76 ' BANDI4 coni
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__close ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r7, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #114 ' reg <- coni
 cmps r7, r22 wz
 if_z jmp #\C_freopen_7 ' EQI4
 cmps r7, r22 wcz
 if_a jmp #\C_freopen_11 ' GTI4
' C_freopen_10 ' (symbol refcount = 0)
 cmps r7,  #97 wz
 if_z jmp #\C_freopen_9 ' EQI4
 jmp #\@C_freopen_4 ' JUMPV addrg
C_freopen_11
 cmps r7,  #119 wz
 if_z jmp #\C_freopen_8 ' EQI4
 jmp #\@C_freopen_4 ' JUMPV addrg
C_freopen_7
 or r13, #1 ' BORI4 coni
 mov r11, #0 ' reg <- coni
 jmp #\@C_freopen_13 ' JUMPV addrg
C_freopen_8
 or r13, #2 ' BORI4 coni
 mov r11, #1 ' reg <- coni
 mov r9, #48 ' reg <- coni
 jmp #\@C_freopen_13 ' JUMPV addrg
C_freopen_9
 mov r22, ##514 ' reg <- con
 or r13, r22 ' BORI/U (1)
 mov r11, #1 ' reg <- coni
 or r9, #80 ' BORI4 coni
 jmp #\@C_freopen_13 ' JUMPV addrg
C_freopen_4
 mov r0, ##0 ' RET con
 jmp #\@C_freopen_3 ' JUMPV addrg
C_freopen_12
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #43 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_freopen_19 ' EQI4
 cmps r22, r20 wcz
 if_b jmp #\C_freopen_14 ' LTI4
' C_freopen_20 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #98 wz
 if_z jmp #\C_freopen_13 ' EQI4
 jmp #\@C_freopen_14 ' JUMPV addrg
C_freopen_19
 mov r11, #2 ' reg <- coni
 or r13, #3 ' BORI4 coni
C_freopen_13
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_freopen_12 ' NEI4
C_freopen_14
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_freopen_23 ' NEI4
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__open
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wcz
 if_ae jmp #\C_freopen_21 ' GEI4
 mov r22, r9
 and r22, #16 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_freopen_21 ' EQI4
C_freopen_23
 mov r2, #438 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__creat
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wcz
 if_ae jmp #\C_freopen_24 ' GEI4
 mov r22, r13
 or r22, #1 ' BORI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_freopen_24 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__close ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__open
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_freopen_24
C_freopen_21
 cmps r15,  #0 wcz
 if_ae jmp #\C_freopen_26 ' GEI4
 mov r17, #0 ' reg <- coni
C_freopen_28
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C___iotab ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_freopen_32  ' NEU4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___iotab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_freopen_30 ' JUMPV addrg
C_freopen_32
' C_freopen_29 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #64 wcz
 if_b jmp #\C_freopen_28 ' LTI4
C_freopen_30
 mov r20, ##@C___stdin ' reg <- addrg
 cmp r19, r20 wz
 if_z jmp #\C_freopen_34 ' EQU4
 mov r20, ##@C___stdout ' reg <- addrg
 cmp r19, r20 wz
 if_z jmp #\C_freopen_34 ' EQU4
 mov r20, ##@C___stderr ' reg <- addrg
 cmp r19, r20 wz
 if_z jmp #\C_freopen_34 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_freopen_34
 mov r0, ##0 ' RET con
 jmp #\@C_freopen_3 ' JUMPV addrg
C_freopen_26
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 wrlong r13, r22 ' ASGNI4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_freopen_3
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _close

' Catalina Import _creat

' Catalina Import _open

' Catalina Import free

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import __iotab
' end
