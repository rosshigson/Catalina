' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unlink

 alignl ' align long
C__unlink ' <symbol:_unlink>
 calld PA,#NEWF
 sub SP, ##512
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C__unlink_3  ' NEU4
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
 if_nz jmp #\C__unlink_5 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__unlink_2 ' JUMPV addrg
C__unlink_5
C__unlink_3
 mov r2, FP
 adds r2, ##(-516)
' reg ARG ADDRL
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C___vi ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__U_nlinkF_ile
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__unlink_7 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__unlink_2 ' JUMPV addrg
C__unlink_7
 mov r0, #0 ' reg <- coni
C__unlink_2
 calld PA,#POPM ' restore registers
 add SP, ##512 ' framesize
 calld PA,#RETF


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_UnlinkFile
' end
