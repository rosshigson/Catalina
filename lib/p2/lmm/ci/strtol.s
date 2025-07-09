' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strtol

 alignl ' align long
C_strtol ' <symbol:strtol>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s7r4_686cc259_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtol_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export strtoul

 alignl ' align long
C_strtoul ' <symbol:strtoul>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s7r4_686cc259_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtoul_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s7r4_686cc259_string2long_L000003 ' <symbol:string2long>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r15, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r5, RI ' ASGNP4 addrl reg
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_10 ' EQU4
 wrlong r5, r4 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_10 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_9
 adds r5, #1 ' ADDP4 coni
C_s7r4_686cc259_string2long_L000003_10
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_9 ' NEI4
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 cmps r19,  #45 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_15 ' EQI4
 cmps r19,  #43 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_13 ' NEI4
C_s7r4_686cc259_string2long_L000003_15
 cmps r19,  #45 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_16 ' NEI4
 jmp #LODL
 long -1
 mov r15, RI ' reg <- con
C_s7r4_686cc259_string2long_L000003_16
 adds r5, #1 ' ADDP4 coni
C_s7r4_686cc259_string2long_L000003_13
 jmp #LODF
 long -8
 wrlong r5, RI ' ASGNP4 addrl reg
 cmps r3,  #0 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_18 ' NEI4
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_20 ' NEI4
 mov r22, r5
 adds r22, #1 ' ADDP4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_24 ' EQI4
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_22 ' NEI4
C_s7r4_686cc259_string2long_L000003_24
 mov r3, #16 ' reg <- coni
 adds r5, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_29 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_22
 mov r3, #8 ' reg <- coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_29 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_20
 mov r3, #10 ' reg <- coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_29 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_18
 cmps r3,  #16 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_29 ' NEI4
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_29 ' NEI4
 mov r22, r5
 adds r22, #1 ' ADDP4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_27 ' EQI4
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_29 ' NEI4
C_s7r4_686cc259_string2long_L000003_27
 adds r5, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_29 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_28
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_32 ' NEI4
 jmp #LODL
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_34 ' EQI4
 mov r22, r19
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 jmp #BRAE
 long @C_s7r4_686cc259_string2long_L000003_38 ' GEU4
 mov r13, r19
 subs r13, #65 ' SUBI4 coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_39 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_38
 mov r13, r19
 subs r13, #97 ' SUBI4 coni
C_s7r4_686cc259_string2long_L000003_39
 mov r22, r13
 adds r22, #10 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_35 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_34
 mov r22, r19
 subs r22, #48 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_s7r4_686cc259_string2long_L000003_35
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r23, r22 wcz 
 jmp #BR_B
 long @C_s7r4_686cc259_string2long_L000003_40' LTU4
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_30 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_40
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 sub r22, r23 ' SUBU (1)
 mov r20, r3 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 cmp r21, r0 wcz 
 jmp #BRBE
 long @C_s7r4_686cc259_string2long_L000003_42 ' LEU4
 adds r17, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_43 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_42
 mov r22, r3 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r21, r0 ' ADDU
 add r21, r23 ' ADDU (3)
C_s7r4_686cc259_string2long_L000003_43
C_s7r4_686cc259_string2long_L000003_32
 adds r5, #1 ' ADDP4 coni
C_s7r4_686cc259_string2long_L000003_29
 rdbyte r22, r5 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22 ' CVI, CVU or LOAD
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 jmp #BR_B
 long @C_s7r4_686cc259_string2long_L000003_28' LTU4
 jmp #LODL
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_28 ' NEI4
C_s7r4_686cc259_string2long_L000003_30
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_44 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r5 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_46 ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r4 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_47 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_46
 wrlong r5, r4 ' ASGNP4 reg reg
C_s7r4_686cc259_string2long_L000003_47
C_s7r4_686cc259_string2long_L000003_44
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s7r4_686cc259_string2long_L000003_48 ' NEI4
 mov r22, #0 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_50 ' EQI4
 cmps r15, r22 wcz
 jmp #BRAE
 long @C_s7r4_686cc259_string2long_L000003_53 ' GEI4
 jmp #LODL
 long $80000000
 mov r22, RI ' reg <- con
 cmp r21, r22 wcz 
 jmp #BR_A
 long @C_s7r4_686cc259_string2long_L000003_52 ' GTU4
C_s7r4_686cc259_string2long_L000003_53
 cmps r15,  #0 wcz
 jmp #BRBE
 long @C_s7r4_686cc259_string2long_L000003_50 ' LEI4
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r21, r22 wcz 
 jmp #BRBE
 long @C_s7r4_686cc259_string2long_L000003_50 ' LEU4
C_s7r4_686cc259_string2long_L000003_52
 adds r17, #1 ' ADDI4 coni
C_s7r4_686cc259_string2long_L000003_50
C_s7r4_686cc259_string2long_L000003_48
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_54 ' EQI4
 mov r22, #34 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_s7r4_686cc259_string2long_L000003_56 ' EQI4
 cmps r15,  #0 wcz
 jmp #BRAE
 long @C_s7r4_686cc259_string2long_L000003_58 ' GEI4
 jmp #LODL
 long $80000000
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_6 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_58
 jmp #LODL
 long $7fffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_6 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_56
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s7r4_686cc259_string2long_L000003_6 ' JUMPV addrg
C_s7r4_686cc259_string2long_L000003_54
 mov r22, r15 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
C_s7r4_686cc259_string2long_L000003_6
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import __ctype
' end
