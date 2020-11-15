' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_ready

 alignl ' align long
C_gk_ready ' <symbol:gk_ready>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_ready_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_ready_3
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_ready_5 ' EQU4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_ready_8 ' EQI4
 mov r23, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_gk_ready_9 ' JUMPV addrg
C_gk_ready_8
 mov r23, #0 ' reg <- coni
C_gk_ready_9
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_gk_ready_2 ' JUMPV addrg
C_gk_ready_5
 mov r0, #0 ' RET coni
C_gk_ready_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
