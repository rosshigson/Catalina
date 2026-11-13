' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _strtoi

 alignl ' align long
C__strtoi ' <symbol:_strtoi>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C__strtoi_4 ' NEI4
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, #1 ' ADDP4 coni
 jmp #\@C__strtoi_9 ' JUMPV addrg
C__strtoi_4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C__strtoi_6 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, #1 ' ADDP4 coni
 jmp #\@C__strtoi_9 ' JUMPV addrg
C__strtoi_6
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C__strtoi_9 ' JUMPV addrg
C__strtoi_8
 adds r23, #1 ' ADDP4 coni
C__strtoi_9
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_z jmp #\C__strtoi_8 ' EQI4
 jmp #\@C__strtoi_12 ' JUMPV addrg
C__strtoi_11
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tonumber ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15, r19 wcz
 if_a jmp #\C__strtoi_16 ' GTI4
 cmps r15,  #0 wcz
 if_ae jmp #\C__strtoi_14 ' GEI4
C__strtoi_16
 mov r0, #0 ' reg <- coni
 jmp #\@C__strtoi_3 ' JUMPV addrg
C__strtoi_14
 mov r13, r17 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r17, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r0 ' CVI, CVU or LOAD
 adds r17, r15 ' ADDI/P (1)
 cmps r13, r17 wcz
 if_be jmp #\C__strtoi_17 ' LEI4
 mov r11, #1 ' reg <- coni
C__strtoi_17
C__strtoi_12
 mov r2, r19 ' CVI, CVU or LOAD
 rdbyte r3, r23 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__strtoi_11 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__strtoi_19 ' EQU4
 wrlong r23, r21 ' ASGNP4 reg reg
C__strtoi_19
 cmps r11,  #0 wz
 if_z jmp #\C__strtoi_21 ' EQI4
 mov r17, ##2147483647 ' reg <- con
C__strtoi_21
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r17, r22 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
C__strtoi_3
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import tonumber

' Catalina Import isnumber
' end
