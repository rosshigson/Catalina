' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export jsll_decstr

 alignl ' align long
C_jsll_decstr ' <symbol:jsll_decstr>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_jsll_decstr_2 ' GEI4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_jsll_decstr_6 ' EQU4
 mov r19, #1 ' reg <- coni
 jmp #\@C_jsll_decstr_7 ' JUMPV addrg
C_jsll_decstr_6
 mov r19, #0 ' reg <- coni
C_jsll_decstr_7
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r19 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #45 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23
 adds r3, #1 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_udecstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_jsll_decstr_1 ' JUMPV addrg
C_jsll_decstr_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_udecstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_jsll_decstr_1
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export jsll_udecstr

 alignl ' align long
C_jsll_udecstr ' <symbol:jsll_udecstr>
 calld PA,#NEWF
 sub SP, #60
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##10000 ' reg <- con
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_udecstr_10  ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_udecstr_10  ' NEU4
 mov r2, ##@C_jsll_udecstr_13_L000014 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_jsll_udecstr_8 ' JUMPV addrg
C_jsll_udecstr_10
 mov r15, FP
 sub r15, #-(-48) ' reg <- addrli
C_jsll_udecstr_15
 mov r0, FP
 sub r0, #-(-56) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-28) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-12) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_udivmod
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_udecstr_22  ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_jsll_udecstr_20 ' EQU4
C_jsll_udecstr_22
 mov r9, #1 ' reg <- coni
 jmp #\@C_jsll_udecstr_21 ' JUMPV addrg
C_jsll_udecstr_20
 mov r9, #0 ' reg <- coni
C_jsll_udecstr_21
 mov r22, r9 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r17, #4 ' reg <- coni
 jmp #\@C_jsll_udecstr_26 ' JUMPV addrg
C_jsll_udecstr_23
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1
 adds r22, #48 ' ADDI4 coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
' C_jsll_udecstr_24 ' (symbol refcount = 0)
 adds r15, #1 ' ADDP4 coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C_jsll_udecstr_26
 mov r22, #0 ' reg <- coni
 mov r20, r17 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_jsll_udecstr_27 ' EQI4
 mov r20, r13 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_nz jmp #\C_jsll_udecstr_23 ' NEI4
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 if_nz jmp #\C_jsll_udecstr_23 ' NEI4
C_jsll_udecstr_27
' C_jsll_udecstr_16 ' (symbol refcount = 0)
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_jsll_udecstr_15 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 sub r22, r20 ' SUBU (1)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_jsll_udecstr_31 ' JUMPV addrg
C_jsll_udecstr_28
 mov r22, ##-1 ' reg <- con
 adds r22, r15 ' ADDI/P (2)
 mov r15, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r23 ' ASGNU1 reg reg
' C_jsll_udecstr_29 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C_jsll_udecstr_31
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_jsll_udecstr_28 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r0, r11 ' CVI, CVU or LOAD
C_jsll_udecstr_8
 calld PA,#POPM ' restore registers
 add SP, #60 ' framesize
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s4so1_6af55206___chexdigit_L000032 ' <symbol:__chexdigit>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102
 byte 0

' Catalina Export jsll_hexstr

' Catalina Code

DAT ' code segment

 alignl ' align long
C_jsll_hexstr ' <symbol:jsll_hexstr>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_hexstr_34  ' NEU4
 rdlong r20, r21 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_jsll_hexstr_34  ' NEU4
 mov r2, ##@C_jsll_hexstr_36_L000037 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, #16 ' reg <- coni
 jmp #\@C_jsll_hexstr_33 ' JUMPV addrg
C_jsll_hexstr_34
 mov r15, FP
 sub r15, #-(-20) ' reg <- addrli
 rdlong r17, r21 ' reg <- INDIRU4 reg
 mov r19, #0 ' reg <- coni
C_jsll_hexstr_38
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r17
 and r20, #15 ' BANDU4 coni
 mov r18, ##@C_s4so1_6af55206___chexdigit_L000032 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r17, #4 ' RSHU4 coni
' C_jsll_hexstr_39 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wcz
 if_b jmp #\C_jsll_hexstr_38 ' LTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov r19, #0 ' reg <- coni
C_jsll_hexstr_42
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r17
 and r20, #15 ' BANDU4 coni
 mov r18, ##@C_s4so1_6af55206___chexdigit_L000032 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r17, #4 ' RSHU4 coni
' C_jsll_hexstr_43 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wcz
 if_b jmp #\C_jsll_hexstr_42 ' LTI4
 mov r19, #16 ' reg <- coni
C_jsll_hexstr_46
 mov r22, ##-1 ' reg <- con
 adds r22, r15 ' ADDI/P (2)
 mov r15, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r23 ' ASGNU1 reg reg
' C_jsll_hexstr_47 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
 subs r19, #1 ' SUBI4 coni
 cmps r19,  #0 wz
 if_nz jmp #\C_jsll_hexstr_46 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r0, #16 ' reg <- coni
C_jsll_hexstr_33
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import jsll_udivmod

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_jsll_hexstr_36_L000037 ' <symbol:36>
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 0

 alignl ' align long
C_jsll_udecstr_13_L000014 ' <symbol:13>
 byte 48
 byte 0

' Catalina Code

DAT ' code segment
' end
