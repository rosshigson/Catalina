' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _open_unmanaged

 alignl ' align long
C__open_unmanaged ' <symbol:_open_unmanaged>
 PRIMITIVE(#NEWF)
 sub SP, ##512
 PRIMITIVE(#PSHM)
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 cmps r21,  #1 wz
 if_z jmp #\C__open_unmanaged_3 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #1 ' BORI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C__open_unmanaged_3
 cmps r21,  #0 wz
 if_z jmp #\C__open_unmanaged_5 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #2 ' BORI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C__open_unmanaged_5
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C__open_unmanaged_7  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__mount
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C__open_unmanaged_9 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_9
C__open_unmanaged_7
 mov r17, #3 ' reg <- coni
 jmp #\@C__open_unmanaged_14 ' JUMPV addrg
C__open_unmanaged_11
 cmps r17,  #7 wcz
 if_b jmp #\C__open_unmanaged_16 ' LTI4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_16
' C__open_unmanaged_12 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__open_unmanaged_14
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___fdtab+9 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__open_unmanaged_11 ' NEI4
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C___fdtab ' reg <- addrg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, FP
 adds r3, ##(-512)
' reg ARG ADDRL
 mov r4, r15 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__open_unmanaged_18 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_18
 mov r0, r17 ' CVI, CVU or LOAD
C__open_unmanaged_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, ##512 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import __fdtab

' Catalina Import DFS_OpenFile
' end
