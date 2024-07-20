' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_decl

 alignl ' align long
C_tty_decl ' <symbol:tty_decl>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 1000000000
 mov r17, RI ' reg <- con
 mov r13, #0 ' reg <- coni
 cmps r21,  #1 wcz
 jmp #BRAE
 long @C_tty_decl_2 ' GEI4
 mov r21, #1 ' reg <- coni
C_tty_decl_2
 cmps r21,  #10 wcz
 jmp #BRBE
 long @C_tty_decl_4 ' LEI4
 mov r21, #10 ' reg <- coni
C_tty_decl_4
 cmps r23,  #0 wcz
 jmp #BRAE
 long @C_tty_decl_6 ' GEI4
 neg r23, r23 ' NEGI4
 mov r2, #45 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tty_tx ' CALL addrg
C_tty_decl_6
 mov r22, r19
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_tty_decl_8 ' EQI4
 mov r22, #10 ' reg <- coni
 mov r15, r22 ' SUBI/P
 subs r15, r21 ' SUBI/P (3)
 jmp #JMPA
 long @C_tty_decl_13 ' JUMPV addrg
C_tty_decl_10
 mov r22, #10 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r17, r0 ' CVI, CVU or LOAD
' C_tty_decl_11 ' (symbol refcount = 0)
 subs r15, #1 ' SUBI4 coni
C_tty_decl_13
 cmps r15,  #0 wcz
 jmp #BR_A
 long @C_tty_decl_10 ' GTI4
C_tty_decl_8
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_tty_decl_17 ' JUMPV addrg
C_tty_decl_14
 cmps r23, r17 wcz
 jmp #BR_B
 long @C_tty_decl_18 ' LTI4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 adds r22, #48 ' ADDI4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tty_tx ' CALL addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r23, r1 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 jmp #JMPA
 long @C_tty_decl_19 ' JUMPV addrg
C_tty_decl_18
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_tty_decl_23 ' EQI4
 mov r22, #0 ' reg <- coni
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_tty_decl_23 ' NEI4
 mov r20, r19
 and r20, #2 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_tty_decl_20 ' EQI4
C_tty_decl_23
 mov r2, #48 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tty_tx ' CALL addrg
 jmp #JMPA
 long @C_tty_decl_21 ' JUMPV addrg
C_tty_decl_20
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_tty_decl_24 ' EQI4
 mov r2, #32 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tty_tx ' CALL addrg
C_tty_decl_24
C_tty_decl_21
C_tty_decl_19
 mov r22, #10 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r17, r0 ' CVI, CVU or LOAD
' C_tty_decl_15 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_tty_decl_17
 cmps r15, r21 wcz
 jmp #BR_B
 long @C_tty_decl_14 ' LTI4
' C_tty_decl_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import tty_tx
' end
