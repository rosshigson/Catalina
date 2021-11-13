' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gm_delta_z

 alignl ' align long
C_gm_delta_z ' <symbol:gm_delta_z>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r22, ##@C_m_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r23, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, r23
 neg r20, r20 ' SUBI/P (2)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r20, RI ' ASGNI4 addrli reg
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_delta_z_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export gm_abs_z

 alignl ' align long
C_gm_abs_z ' <symbol:gm_abs_z>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov r22, ##@C_m_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #20 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_abs_z_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import m_block
' end
