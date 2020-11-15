' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create_directory

 alignl ' align long
C__create_directory ' <symbol:_create_directory>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#LODL)
 long 540
 sub SP, RI
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C___pstart
 mov r22, RI ' reg <- INDIRU4 addrg
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__create_directory_3 ' NEU4
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
 long @C__create_directory_5 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__create_directory_2 ' JUMPV addrg
C__create_directory_5
C__create_directory_3
 PRIMITIVE(#LODF)
 long -540
 mov r2, RI ' reg ARG ADDRL
 PRIMITIVE(#LODF)
 long -512
 mov r3, RI ' reg ARG ADDRL
 mov r4, #6 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 PRIMITIVE(#LODL)
 long @C___vi
 PRIMITIVE(#PSHL) ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__create_directory_7 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__create_directory_2 ' JUMPV addrg
C__create_directory_7
 mov r0, #0 ' RET coni
C__create_directory_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#LODL)
 long 540
 add SP, RI ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_OpenFile
' end
