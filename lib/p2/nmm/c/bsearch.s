' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export bsearch

 alignl ' align long
C_bsearch ' <symbol:bsearch>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #\@C_bsearch_5 ' JUMPV addrg
C_bsearch_4
 mov r22, r21
 shr r22, #1 ' RSHU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r19, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r15, r0 ' ADDI/P
 adds r15, r23 ' ADDI/P (3)
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r17
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_bsearch_7 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_bsearch_3 ' JUMPV addrg
C_bsearch_7
 cmps r13,  #0 wcz
 if_b jmp #\C_bsearch_9 ' LTI4
 mov r23, r19 ' ADDI/P
 adds r23, r15 ' ADDI/P (3)
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r21, r22
 shr r21, #1 ' RSHU4 coni
 jmp #\@C_bsearch_10 ' JUMPV addrg
C_bsearch_9
 shr r21, #1 ' RSHU4 coni
C_bsearch_10
C_bsearch_5
 cmp r21,  #0 wz
 if_nz jmp #\C_bsearch_4  ' NEU4
 mov r0, ##0 ' RET con
C_bsearch_3
 calld PA,#POPM ' restore registers
 calld PA,#RETF

' end
