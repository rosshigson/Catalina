' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _read

 alignl ' align long
C__read ' <symbol:_read>
 PRIMITIVE(#NEWF)
 sub SP, ##516
 PRIMITIVE(#PSHM)
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 cmps r23,  #0 wz
 if_nz jmp #\C__read_3 ' NEI4
 jmp #\@C__read_6 ' JUMPV addrg
C__read_5
 mov r2, ##@C___iotab ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_catalina_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C__read_8 ' NEI4
 jmp #\@C__read_7 ' JUMPV addrg
C__read_8
 cmps r17,  #13 wz
 if_nz jmp #\C__read_10 ' NEI4
 mov r17, #10 ' reg <- coni
C__read_10
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #10 wz
 if_nz jmp #\C__read_12 ' NEI4
 jmp #\@C__read_7 ' JUMPV addrg
C__read_12
C__read_6
 cmps r15, r19 wcz
 if_b jmp #\C__read_5 ' LTI4
C__read_7
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C__read_2 ' JUMPV addrg
C__read_3
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___fdtab+9 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__read_14 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__read_2 ' JUMPV addrg
C__read_14
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-4) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 adds r5, ##(-516)
' reg ARG ADDRL
 mov r20, ##@C___fdtab ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_eadF_ile
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__read_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, ##516 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import catalina_getc

' Catalina Import __fdtab

' Catalina Import DFS_ReadFile

' Catalina Import __iotab
' end
