' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export t_vprintf

 alignl ' align long
C_t_vprintf ' <symbol:t_vprintf>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r15, #5 ' reg <- coni
C_t_vprintf_3
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 if_nz jmp #\C_t_vprintf_6 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wcz
 if_b jmp #\C_t_vprintf_8 ' LTI4
 cmps r22,  #57 wcz
 if_a jmp #\C_t_vprintf_8 ' GTI4
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r15, r22
 subs r15, #48 ' SUBI4 coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 jmp #\@C_t_vprintf_11 ' JUMPV addrg
C_t_vprintf_10
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r0 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_t_vprintf_11
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wcz
 if_b jmp #\C_t_vprintf_13 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_t_vprintf_10 ' LEI4
C_t_vprintf_13
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 if_nz jmp #\C_t_vprintf_14 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 jmp #\@C_t_vprintf_17 ' JUMPV addrg
C_t_vprintf_16
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_t_vprintf_17
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wcz
 if_b jmp #\C_t_vprintf_19 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_t_vprintf_16 ' LEI4
C_t_vprintf_19
C_t_vprintf_14
C_t_vprintf_8
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #104 wz
 if_z jmp #\C_t_vprintf_22 ' EQI4
 cmps r22,  #108 wz
 if_nz jmp #\C_t_vprintf_20 ' NEI4
C_t_vprintf_22
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #104 wz
 if_z jmp #\C_t_vprintf_25 ' EQI4
 cmps r22,  #108 wz
 if_nz jmp #\C_t_vprintf_23 ' NEI4
C_t_vprintf_25
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_t_vprintf_23
C_t_vprintf_20
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tolower ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r13,  #99 wz
 if_z jmp #\C_t_vprintf_29 ' EQI4
 mov r22, #100 ' reg <- coni
 cmps r13, r22 wz
 if_z jmp #\C_t_vprintf_31 ' EQI4
 cmps r13, r22 wcz
 if_a jmp #\C_t_vprintf_36 ' GTI4
' C_t_vprintf_35 ' (symbol refcount = 0)
 cmps r13,  #0 wz
 if_z jmp #\C_t_vprintf_7 ' EQI4
 jmp #\@C_t_vprintf_26 ' JUMPV addrg
C_t_vprintf_36
 cmps r13,  #115 wz
 if_z jmp #\C_t_vprintf_32 ' EQI4
 cmps r13,  #117 wz
 if_z jmp #\C_t_vprintf_30 ' EQI4
 cmps r13,  #120 wz
 if_z jmp #\C_t_vprintf_33 ' EQI4
 jmp #\@C_t_vprintf_26 ' JUMPV addrg
C_t_vprintf_29
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_30
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_unsigned
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_31
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_integer
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_32
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_33
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_hex
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_26
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 jmp #\@C_t_vprintf_7 ' JUMPV addrg
C_t_vprintf_6
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_t_vprintf_37 ' EQI4
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
C_t_vprintf_37
C_t_vprintf_7
' C_t_vprintf_4 ' (symbol refcount = 0)
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_t_vprintf_3 ' NEI4
 mov r0, r17 ' CVI, CVU or LOAD
' C_t_vprintf_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export t_printf

 alignl ' align long
C_t_printf ' <symbol:t_printf>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_vprintf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_t_printf_39 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import tolower

' Catalina Import t_hex

' Catalina Import t_unsigned

' Catalina Import t_integer

' Catalina Import t_string

' Catalina Import t_char
' end
