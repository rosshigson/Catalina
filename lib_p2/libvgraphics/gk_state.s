' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_gk_state_key_state_L000004 ' <symbol:key_state>
 long $0

' Catalina Export gk_state

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gk_state ' <symbol:gk_state>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_state_5 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_state_5
 PRIMITIVE(#LODI)
 long @C_gk_state_key_state_L000004
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_gk_state_7 ' NEU4
 PRIMITIVE(#LODI)
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #12 ' ADDP4 coni
 PRIMITIVE(#LODL)
 long @C_gk_state_key_state_L000004
 wrlong r22, RI ' ASGNP4 addrg reg
C_gk_state_7
 mov r22, r23
 sar r22, #5 ' RSHI4 coni
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_gk_state_key_state_L000004
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 and r20, #31 ' BANDI4 coni
 sar r22, r20 ' RSHI (1)
 mov r0, r22
 and r0, #1 ' BANDI4 coni
' C_gk_state_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
