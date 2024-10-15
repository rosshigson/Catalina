' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _doprintf

 alignl ' align long
C__doprintf ' <symbol:_doprintf>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r13, r19 ' CVI, CVU or LOAD
 jmp #\@C__doprintf_3 ' JUMPV addrg
C__doprintf_2
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 if_z jmp #\C__doprintf_5 ' EQI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__printf_putc
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #\@C__doprintf_3 ' JUMPV addrg
C__doprintf_5
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- INDIRU1 reg
 mov r11, #0 ' reg <- coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 if_nz jmp #\C__doprintf_7 ' NEI4
 mov r22, #1 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- INDIRU1 reg
C__doprintf_7
 mov r15, #0 ' reg <- coni
 mov r9, #32 ' reg <- coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 if_nz jmp #\C__doprintf_12 ' NEI4
 mov r9, #48 ' reg <- coni
 jmp #\@C__doprintf_12 ' JUMPV addrg
C__doprintf_11
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r0 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- INDIRU1 reg
C__doprintf_12
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C__doprintf_14 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_isdigit ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__doprintf_11 ' NEI4
C__doprintf_14
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C__doprintf_15 ' NEI4
 jmp #\@C__doprintf_4 ' JUMPV addrg
C__doprintf_15
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 if_nz jmp #\C__doprintf_17 ' NEI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__printf_putc
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #\@C__doprintf_3 ' JUMPV addrg
C__doprintf_17
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r7, r22 ' CVI, CVU or LOAD
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #99 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C__doprintf_22 ' EQI4
 cmps r22,  #100 wz
 if_z jmp #\C__doprintf_26 ' EQI4
 cmps r22, r20 wcz
 if_b jmp #\C__doprintf_19 ' LTI4
' C__doprintf_35 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #115 wz
 if_z jmp #\C__doprintf_23 ' EQI4
 cmps r22,  #117 wz
 if_z jmp #\C__doprintf_26 ' EQI4
 cmps r22,  #120 wz
 if_z jmp #\C__doprintf_27 ' EQI4
 jmp #\@C__doprintf_19 ' JUMPV addrg
C__doprintf_22
 mov r22, r7 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r7, r22 ' CVI, CVU or LOAD
C__doprintf_23
 cmps r11,  #0 wz
 if_z jmp #\C__doprintf_24 ' EQI4
 neg r15, r15 ' NEGI4
C__doprintf_24
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r7 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__printf_putn
 add SP, #12 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #\@C__doprintf_20 ' JUMPV addrg
C__doprintf_26
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doprintf_27
 cmps r15,  #0 wz
 if_nz jmp #\C__doprintf_28 ' NEI4
 mov r15, #1 ' reg <- coni
C__doprintf_28
 cmps r11,  #0 wz
 if_z jmp #\C__doprintf_30 ' EQI4
 neg r15, r15 ' NEGI4
C__doprintf_30
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #100 wz
 if_nz jmp #\C__doprintf_33 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C__doprintf_34 ' JUMPV addrg
C__doprintf_33
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doprintf_34
 mov RI, FP
 sub RI, #-(-20)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r7
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C__printf_putl
 add SP, #20 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
C__doprintf_19
C__doprintf_20
C__doprintf_3
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r17, r22 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C__doprintf_2 ' NEI4
C__doprintf_4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C__doprintf_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import _printf_putl

' Catalina Import _printf_putn

' Catalina Import _printf_putc

' Catalina Import isdigit
' end
