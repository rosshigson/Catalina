' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_present

 alignl ' align long
C_gk_present ' <symbol:gk_present>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_present_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_present_3
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_present_5 ' EQU4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C_gk_present_2 ' JUMPV addrg
C_gk_present_5
 mov r0, #0 ' RET coni
C_gk_present_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
