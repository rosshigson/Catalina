' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 long ' align long
C_gmtime_br_time_L000003 ' <symbol:br_time>
 byte 0[36]

' Catalina Export gmtime

' Catalina Code

DAT ' code segment

 long ' align long
C_gmtime ' <symbol:gmtime>
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_gmtime_br_time_L000003
 mov r21, RI ' reg <- addrg
 rdlong r13, r23 ' reg <- INDIRU4 reg
 jmp #LODL
 long 1970
 mov r15, RI ' reg <- con
 jmp #LODL
 long $15180
 mov r22, RI ' reg <- con
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1 ' CVI, CVU or LOAD
 mov r19, r20 ' CVI, CVU or LOAD
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #60 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1 ' CVI, CVU or LOAD
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #LODL
 long 3600
 mov r22, RI ' reg <- con
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1 ' CVI, CVU or LOAD
 mov r20, #60 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #LODL
 long 3600
 mov r22, RI ' reg <- con
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, r17
 add r22, #4 ' ADDU4 coni
 mov r20, #7 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 mov r22, r1 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_gmtime_5 ' JUMPV addrg
C_gmtime_4
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_9 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_11 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_gmtime_9 ' NEI4
C_gmtime_11
 mov r11, #366 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_10 ' JUMPV addrg
C_gmtime_9
 mov r11, #365 ' reg <- coni
C_gmtime_10
 mov r22, r11 ' CVI, CVU or LOAD
 sub r17, r22 ' SUBU (1)
 adds r15, #1 ' ADDI4 coni
C_gmtime_5
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_12 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_14 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_gmtime_12 ' NEI4
C_gmtime_14
 mov r11, #366 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_13 ' JUMPV addrg
C_gmtime_12
 mov r11, #365 ' reg <- coni
C_gmtime_13
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r17, r22 wz,wc 
 jmp #BRAE
 long @C_gmtime_4 ' GEU4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 jmp #LODL
 long 1900
 mov r20, RI ' reg <- con
 subs r20, r15
 neg r20, r20 ' SUBI/P (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_gmtime_16 ' JUMPV addrg
C_gmtime_15
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_20 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_22 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_gmtime_20 ' NEI4
C_gmtime_22
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_21 ' JUMPV addrg
C_gmtime_20
 mov r9, #0 ' reg <- coni
C_gmtime_21
 mov r22, #48 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C__ytab
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r17, r22 ' SUBU (1)
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_gmtime_16
 mov r22, #4 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, #0 ' reg <- coni
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_23 ' NEI4
 mov r22, #100 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r20 wz
 jmp #BRNZ
 long @C_gmtime_25 ' NEI4
 mov r22, #400 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_gmtime_23 ' NEI4
C_gmtime_25
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_24 ' JUMPV addrg
C_gmtime_23
 mov r9, #0 ' reg <- coni
C_gmtime_24
 mov r22, #48 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C__ytab
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmp r17, r22 wz,wc 
 jmp #BRAE
 long @C_gmtime_15 ' GEU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, r17
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_gmtime_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _ytab
' end
