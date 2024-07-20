' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl ' align long
C__mount ' <symbol:_mount>
 jmp #NEWF
 jmp #LODL
 long 524
 sub SP, RI
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODF
 long -520
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -528
 mov r3, RI ' reg ARG ADDRL
 jmp #LODF
 long -524
 mov r4, RI ' reg ARG ADDRL
 mov r22, r21 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODF
 long -516
 jmp #PSHL ' stack ARG ADDRL
 mov r22, r23 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__G_etP_tnS_tart
 add SP, #20 ' CALL addrg
 jmp #LODL
 long @C___pstart
 wrlong r0, RI ' ASGNU4 addrg reg
 jmp #LODI
 long @C___pstart
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__mount_3 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__mount_2 ' JUMPV addrg
C__mount_3
 jmp #LODL
 long @C___vi
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C___pstart
 mov r3, RI ' reg ARG INDIR ADDRG
 jmp #LODF
 long -516
 mov r4, RI ' reg ARG ADDRL
 mov r22, r23 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etV_olI_nfo
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__mount_5 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C___pstart
 wrlong r22, RI ' ASGNU4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__mount_2 ' JUMPV addrg
C__mount_5
 mov r0, #0 ' RET coni
C__mount_2
 jmp #POPM ' restore registers
 jmp #LODL
 long 524
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_GetVolInfo

' Catalina Import DFS_GetPtnStart
' end
