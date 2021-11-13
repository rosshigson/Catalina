' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 alignl ' align long
C__lseek ' <symbol:_lseek>
 PRIMITIVE(#NEWF)
 sub SP, ##512
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
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
 if_nz jmp #\C__lseek_3 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__lseek_2 ' JUMPV addrg
C__lseek_3
 cmps r19,  #0 wz
 if_nz jmp #\C__lseek_6 ' NEI4
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 adds r2, ##(-512)
' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 mov r20, ##@C___fdtab ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #\@C__lseek_7 ' JUMPV addrg
C__lseek_6
 cmps r19,  #2 wz
 if_nz jmp #\C__lseek_8 ' NEI4
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 adds r2, ##(-512)
' reg ARG ADDRL
 mov r20, ##@C___fdtab+16 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r20, ##@C___fdtab ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #\@C__lseek_9 ' JUMPV addrg
C__lseek_8
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 adds r2, ##(-512)
' reg ARG ADDRL
 mov r20, ##@C___fdtab+24 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r20, ##@C___fdtab ' reg <- addrg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
C__lseek_9
C__lseek_7
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___fdtab+24 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__lseek_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, ##512 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import __fdtab

' Catalina Import DFS_Seek
' end
