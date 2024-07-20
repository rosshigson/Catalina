' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_gmtime_br_time_L000003 ' <symbol:br_time>
 byte 0[36]

' Catalina Export gmtime

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gmtime ' <symbol:gmtime>
 jmp #PSHM
 long $fea800 ' save registers
 jmp #LODL
 long @C_gmtime_br_time_L000003
 mov r23, RI ' reg <- addrg
 rdlong r15, r2 ' reg <- INDIRU4 reg
 jmp #LODL
 long 1970
 mov r17, RI ' reg <- con
 jmp #LODL
 long $15180
 mov r22, RI ' reg <- con
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r21, r1 ' CVI, CVU or LOAD
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #60 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r1 ' CVI, CVU or LOAD
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 3600
 mov r20, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, #60 ' reg <- coni
 mov r0, r1 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 jmp #LODL
 long 3600
 mov r20, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, r19
 add r20, #4 ' ADDU4 coni
 mov r18, #7 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_gmtime_5 ' JUMPV addrg
C_gmtime_4
 mov r22, #0 ' reg <- coni
 mov r20, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_9 ' NEI4
 mov r20, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_11 ' NEI4
 mov r20, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_9 ' NEI4
C_gmtime_11
 mov r13, #366 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_10 ' JUMPV addrg
C_gmtime_9
 mov r13, #365 ' reg <- coni
C_gmtime_10
 mov r22, r13 ' CVI, CVU or LOAD
 sub r19, r22 ' SUBU (1)
 adds r17, #1 ' ADDI4 coni
C_gmtime_5
 mov r22, #0 ' reg <- coni
 mov r20, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_12 ' NEI4
 mov r20, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_14 ' NEI4
 mov r20, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_12 ' NEI4
C_gmtime_14
 mov r13, #366 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_13 ' JUMPV addrg
C_gmtime_12
 mov r13, #365 ' reg <- coni
C_gmtime_13
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r19, r22 wz,wc 
 jmp #BRAE
 long @C_gmtime_4 ' GEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 jmp #LODL
 long 1900
 mov r20, RI ' reg <- con
 subs r20, r17
 neg r20, r20 ' SUBI/P (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_gmtime_16 ' JUMPV addrg
C_gmtime_15
 mov r22, #0 ' reg <- coni
 mov r20, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_20 ' NEI4
 mov r20, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_22 ' NEI4
 mov r20, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_20 ' NEI4
C_gmtime_22
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_21 ' JUMPV addrg
C_gmtime_20
 mov r11, #0 ' reg <- coni
C_gmtime_21
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, #48 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C__ytab
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r19, r22 ' SUBU (1)
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_gmtime_16
 mov r22, #0 ' reg <- coni
 mov r20, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_23 ' NEI4
 mov r20, #100 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_25 ' NEI4
 mov r20, #400 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_gmtime_23 ' NEI4
C_gmtime_25
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_gmtime_24 ' JUMPV addrg
C_gmtime_23
 mov r11, #0 ' reg <- coni
C_gmtime_24
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, #48 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C__ytab
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmp r19, r22 wz,wc 
 jmp #BRAE
 long @C_gmtime_15 ' GEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
' C_gmtime_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _ytab
' end
