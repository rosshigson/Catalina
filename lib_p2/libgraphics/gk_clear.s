' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_clear

 alignl ' align long
C_gk_clear ' <symbol:gk_clear>
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_clear_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_clear_3
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_clear_5 ' EQU4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #1 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_gk_clear_2 ' JUMPV addrg
C_gk_clear_5
 mov r0, #0 ' RET coni
C_gk_clear_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
