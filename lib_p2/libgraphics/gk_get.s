' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_get

 alignl ' align long
C_gk_get ' <symbol:gk_get>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_get_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_get_3
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_get_5 ' EQU4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_gk_get_7 ' EQI4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 shl r20, #1 ' LSHI4 coni
 mov r18, r22
 adds r18, #44 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdword r20, r20 ' reg <- INDIRI2 reg
 shl r20, #16
 sar r20, #16 ' sign extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r20, RI ' ASGNI4 addrl reg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #15 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_gk_get_7
C_gk_get_5
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gk_get_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
