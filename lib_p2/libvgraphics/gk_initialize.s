' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export kb_block

 alignl ' align long
C_kb_block ' <symbol:kb_block>
 long $0

' Catalina Export gk_initialize

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gk_initialize ' <symbol:gk_initialize>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_initialize_3 ' NEU4
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__locate_plugin ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_gk_initialize_5 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long @C_kb_block
 wrlong r22, RI ' ASGNP4 addrg reg
C_gk_initialize_5
C_gk_initialize_3
' C_gk_initialize_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _locate_plugin

' Catalina Import _registry
' end
