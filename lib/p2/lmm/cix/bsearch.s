' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export bsearch

 alignl ' align long
C_bsearch ' <symbol:bsearch>
 jmp #NEWF
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_bsearch_5 ' JUMPV addrg
C_bsearch_4
 mov r22, r21
 shr r22, #1 ' RSHU4 coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r15, r0 ' ADDI/P
 adds r15, r23 ' ADDI/P (3)
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r17
 jmp #CALI
 add SP, #4 ' CALL indirect
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_bsearch_7 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_bsearch_3 ' JUMPV addrg
C_bsearch_7
 cmps r13,  #0 wcz
 jmp #BR_B
 long @C_bsearch_9 ' LTI4
 mov r23, r19 ' ADDI/P
 adds r23, r15 ' ADDI/P (3)
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r21, r22
 shr r21, #1 ' RSHU4 coni
 jmp #JMPA
 long @C_bsearch_10 ' JUMPV addrg
C_bsearch_9
 shr r21, #1 ' RSHU4 coni
C_bsearch_10
C_bsearch_5
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_bsearch_4 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_bsearch_3
 jmp #POPM ' restore registers
 jmp #RETF

' end
