' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s2_decl

 alignl ' align long
C_s2_decl ' <symbol:s2_decl>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long 1000000000
 mov r15, RI ' reg <- con
 mov r11, #0 ' reg <- coni
 cmps r19,  #1 wcz
 jmp #BRAE
 long @C_s2_decl_2 ' GEI4
 mov r19, #1 ' reg <- coni
C_s2_decl_2
 cmps r19,  #10 wcz
 jmp #BRBE
 long @C_s2_decl_4 ' LEI4
 mov r19, #10 ' reg <- coni
C_s2_decl_4
 cmps r21,  #0 wcz
 jmp #BRAE
 long @C_s2_decl_6 ' GEI4
 neg r21, r21 ' NEGI4
 mov r2, #45 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s2_tx
 add SP, #4 ' CALL addrg
C_s2_decl_6
 mov r22, r17
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s2_decl_8 ' EQI4
 mov r22, #10 ' reg <- coni
 mov r13, r22 ' SUBI/P
 subs r13, r19 ' SUBI/P (3)
 jmp #JMPA
 long @C_s2_decl_13 ' JUMPV addrg
C_s2_decl_10
 mov r22, #10 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r15, r0 ' CVI, CVU or LOAD
' C_s2_decl_11 ' (symbol refcount = 0)
 subs r13, #1 ' SUBI4 coni
C_s2_decl_13
 cmps r13,  #0 wcz
 jmp #BR_A
 long @C_s2_decl_10 ' GTI4
C_s2_decl_8
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_s2_decl_17 ' JUMPV addrg
C_s2_decl_14
 cmps r21, r15 wcz
 jmp #BR_B
 long @C_s2_decl_18 ' LTI4
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 adds r22, #48 ' ADDI4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s2_tx
 add SP, #4 ' CALL addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r21, r1 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
 jmp #JMPA
 long @C_s2_decl_19 ' JUMPV addrg
C_s2_decl_18
 cmps r15,  #1 wz
 jmp #BR_Z
 long @C_s2_decl_23 ' EQI4
 mov r22, #0 ' reg <- coni
 cmps r11, r22 wz
 jmp #BRNZ
 long @C_s2_decl_23 ' NEI4
 mov r20, r17
 and r20, #2 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s2_decl_20 ' EQI4
C_s2_decl_23
 mov r2, #48 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s2_tx
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s2_decl_21 ' JUMPV addrg
C_s2_decl_20
 mov r22, r17
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s2_decl_24 ' EQI4
 mov r2, #32 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s2_tx
 add SP, #4 ' CALL addrg
C_s2_decl_24
C_s2_decl_21
C_s2_decl_19
 mov r22, #10 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r15, r0 ' CVI, CVU or LOAD
' C_s2_decl_15 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_s2_decl_17
 cmps r13, r19 wcz
 jmp #BR_B
 long @C_s2_decl_14 ' LTI4
' C_s2_decl_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import s2_tx
' end
