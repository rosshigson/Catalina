' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export jsll_decstr

 alignl ' align long
C_jsll_decstr ' <symbol:jsll_decstr>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_jsll_decstr_3 ' GEI4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_jsll_decstr_7 ' EQU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_decstr_8 ' JUMPV addrg
C_jsll_decstr_7
 mov r19, #0 ' reg <- coni
C_jsll_decstr_8
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r19 ' SUBI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, #45 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23
 adds r3, #1 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_udecstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_jsll_decstr_2 ' JUMPV addrg
C_jsll_decstr_3
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_udecstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_jsll_decstr_2
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_jsll_udecstr_10_L000011 ' <symbol:10>
 long $2710
 long $0

' Catalina Export jsll_udecstr

' Catalina Code

DAT ' code segment

 alignl ' align long
C_jsll_udecstr ' <symbol:jsll_udecstr>
 jmp #NEWF
 sub SP, #60
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 jmp #LODL
 long @C_jsll_udecstr_10_L000011
 mov r1, RI ' reg <- addrg
 jmp #CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_jsll_udecstr_12 ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_jsll_udecstr_12 ' NEU4
 jmp #LODL
 long @C_jsll_udecstr_15_L000016
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_jsll_udecstr_9 ' JUMPV addrg
C_jsll_udecstr_12
 mov r15, FP
 sub r15, #-(-48) ' reg <- addrli
C_jsll_udecstr_17
 mov r0, FP
 sub r0, #-(-56) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-28) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov r5, FP
 sub r5, #-(-12) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #BRNZ
 long @C_jsll_udecstr_24 ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_jsll_udecstr_22 ' EQU4
C_jsll_udecstr_24
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_jsll_udecstr_23 ' JUMPV addrg
C_jsll_udecstr_22
 mov r9, #0 ' reg <- coni
C_jsll_udecstr_23
 mov r13, r9 ' CVI, CVU or LOAD
 mov r17, #4 ' reg <- coni
 jmp #JMPA
 long @C_jsll_udecstr_28 ' JUMPV addrg
C_jsll_udecstr_25
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 adds r22, #48 ' ADDI4 coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
' C_jsll_udecstr_26 ' (symbol refcount = 0)
 adds r15, #1 ' ADDP4 coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C_jsll_udecstr_28
 mov r22, #0 ' reg <- coni
 mov r20, r17 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_jsll_udecstr_29 ' EQI4
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_jsll_udecstr_25 ' NEU4
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_jsll_udecstr_25 ' NEI4
C_jsll_udecstr_29
' C_jsll_udecstr_18 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_jsll_udecstr_17 ' NEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 sub r22, r20 ' SUBU (1)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_jsll_udecstr_33 ' JUMPV addrg
C_jsll_udecstr_30
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r15 ' ADDI/P (2)
 mov r15, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r23 ' ASGNU1 reg reg
' C_jsll_udecstr_31 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
C_jsll_udecstr_33
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_jsll_udecstr_30 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r0, r11 ' CVI, CVU or LOAD
C_jsll_udecstr_9
 jmp #POPM ' restore registers
 add SP, #60 ' framesize
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_jsll_hexstr_hexdigit_L000036 ' <symbol:hexdigit>
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
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_jsll_hexstr_37 ' NEU4
 rdlong r20, r21 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_jsll_hexstr_37 ' NEU4
 jmp #LODL
 long @C_jsll_hexstr_39_L000040
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_jsll_hexstr_34 ' JUMPV addrg
C_jsll_hexstr_37
 mov r15, FP
 sub r15, #-(-20) ' reg <- addrli
 rdlong r19, r21 ' reg <- INDIRU4 reg
 mov r17, #0 ' reg <- coni
C_jsll_hexstr_41
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r19
 and r20, #15 ' BANDU4 coni
 jmp #LODL
 long @C_jsll_hexstr_hexdigit_L000036
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r19, #4 ' RSHU4 coni
' C_jsll_hexstr_42 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #8 wcz
 jmp #BR_B
 long @C_jsll_hexstr_41 ' LTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 mov r17, #0 ' reg <- coni
C_jsll_hexstr_45
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r19
 and r20, #15 ' BANDU4 coni
 jmp #LODL
 long @C_jsll_hexstr_hexdigit_L000036
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r19, #4 ' RSHU4 coni
' C_jsll_hexstr_46 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #8 wcz
 jmp #BR_B
 long @C_jsll_hexstr_45 ' LTI4
 mov r17, #16 ' reg <- coni
C_jsll_hexstr_49
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r15 ' ADDI/P (2)
 mov r15, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r23 ' ASGNU1 reg reg
' C_jsll_hexstr_50 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
 subs r17, #1 ' SUBI4 coni
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_jsll_hexstr_49 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r0, #16 ' RET coni
C_jsll_hexstr_34
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import jsll_udivmod

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_jsll_hexstr_39_L000040 ' <symbol:39>
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
C_jsll_udecstr_15_L000016 ' <symbol:15>
 byte 48
 byte 0

' Catalina Code

DAT ' code segment
' end
