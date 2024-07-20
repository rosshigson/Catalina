' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _open_unmanaged

 alignl ' align long
C__open_unmanaged ' <symbol:_open_unmanaged>
 calld PA,#NEWF
 sub SP, ##512
 calld PA,#PSHM
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
 calld PA,#CALA
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
 cmps r17,  #63 wcz
 if_b jmp #\C__open_unmanaged_15 ' LTI4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_15
' C__open_unmanaged_12 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__open_unmanaged_14
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C__open_unmanaged_11  ' NEU4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C__open_unmanaged_17  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_17
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-516)
' reg ARG ADDRL
 mov r4, r15 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__open_unmanaged_19 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__open_unmanaged_2 ' JUMPV addrg
C__open_unmanaged_19
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
C__open_unmanaged_2
 calld PA,#POPM ' restore registers
 add SP, ##512 ' framesize
 calld PA,#RETF


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import __fdtab

' Catalina Import DFS_OpenFile
' end
