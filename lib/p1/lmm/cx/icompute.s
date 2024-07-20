' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _i_compute

 alignl ' align long
C__i_compute ' <symbol:_i_compute>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r15, r1 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C__i_compute_4 ' NEU4
 cmps r17,  #1 wz,wc
 jmp #BRBE
 long @C__i_compute_2 ' LEI4
C__i_compute_4
 mov r2, r17
 subs r2, #1 ' SUBI4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__i_compute
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C__i_compute_2
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 cmps r15,  #9 wz,wc
 jmp #BRBE
 long @C__i_compute_6 ' LEI4
 mov r20, r15
 subs r20, #10 ' SUBI4 coni
 mov r13, r20
 adds r13, #97 ' ADDI4 coni
 jmp #JMPA
 long @C__i_compute_7 ' JUMPV addrg
C__i_compute_6
 mov r13, r15
 adds r13, #48 ' ADDI4 coni
C__i_compute_7
 mov r20, r13 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C__i_compute_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF

' end
