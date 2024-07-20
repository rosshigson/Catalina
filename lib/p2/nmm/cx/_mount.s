' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl ' align long
C__mount ' <symbol:_mount>
 calld PA,#NEWF
 sub SP, ##524
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 adds r2, ##(-520)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-528)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-524)
' reg ARG ADDRL
 mov r22, r21 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 adds RI,##(-516)
 wrlong RI, --PTRA ' stack ARG ADDRL
 mov r22, r23 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__G_etP_tnS_tart
 add SP, #20 ' CALL addrg
 wrlong r0, ##@C___pstart ' ASGNU4 addrg reg
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C__mount_3  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C__mount_2 ' JUMPV addrg
C__mount_3
 mov r2, ##@C___vi ' reg ARG ADDRG
 mov r3, ##@C___pstart
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, FP
 adds r4, ##(-516)
' reg ARG ADDRL
 mov r22, r23 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etV_olI_nfo
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__mount_5 ' EQU4
 mov r22, ##$ffffffff ' reg <- con
 wrlong r22, ##@C___pstart ' ASGNU4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C__mount_2 ' JUMPV addrg
C__mount_5
 mov r0, #0 ' reg <- coni
C__mount_2
 calld PA,#POPM ' restore registers
 add SP, ##524 ' framesize
 calld PA,#RETF


' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_GetVolInfo

' Catalina Import DFS_GetPtnStart
' end
