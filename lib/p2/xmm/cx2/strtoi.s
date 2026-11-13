' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _strtoi

 alignl ' align long
C__strtoi ' <symbol:_strtoi>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C__strtoi_4 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_4
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C__strtoi_6 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_6
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_8
 adds r23, #1 ' ADDP4 coni
C__strtoi_9
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C__strtoi_8 ' EQI4
 jmp #JMPA
 long @C__strtoi_12 ' JUMPV addrg
C__strtoi_11
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tonumber ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15, r19 wz,wc
 jmp #BR_A
 long @C__strtoi_16 ' GTI4
 cmps r15,  #0 wz,wc
 jmp #BRAE
 long @C__strtoi_14 ' GEI4
C__strtoi_16
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C__strtoi_3 ' JUMPV addrg
C__strtoi_14
 mov r13, r17 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 adds r17, r15 ' ADDI/P (1)
 cmps r13, r17 wz,wc
 jmp #BRBE
 long @C__strtoi_17 ' LEI4
 mov r11, #1 ' reg <- coni
C__strtoi_17
C__strtoi_12
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__strtoi_11 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__strtoi_19 ' EQU4
 mov RI, r21
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
C__strtoi_19
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C__strtoi_21 ' EQI4
 jmp #LODL
 long 2147483647
 mov r17, RI ' reg <- con
C__strtoi_21
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
C__strtoi_3
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import tonumber

' Catalina Import isnumber
' end
