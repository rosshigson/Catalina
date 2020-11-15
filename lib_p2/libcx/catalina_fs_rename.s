' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _rename

 alignl ' align long
C__rename ' <symbol:_rename>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#LODL)
 long 512
 sub SP, RI
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C___pstart
 mov r22, RI ' reg <- INDIRU4 addrg
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__rename_3 ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__mount
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__rename_5 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__rename_2 ' JUMPV addrg
C__rename_5
C__rename_3
 PRIMITIVE(#LODF)
 long -512
 mov r2, RI ' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C___vi
 mov r5, RI ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_enameF_ile
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__rename_7 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__rename_2 ' JUMPV addrg
C__rename_7
 mov r0, #0 ' RET coni
C__rename_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#LODL)
 long 512
 add SP, RI ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_RenameFile
' end
