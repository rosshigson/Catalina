' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_db_setup

 alignl ' align long
C_g_db_setup ' <symbol:g_db_setup>
 PRIMITIVE(#PSHM)
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##@C_G__V_A_R_+140 ' reg <- addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_g_flush ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov r20, ##@C_G__V_A_R_+12
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov r20, ##@C_G__V_A_R_+8
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov r20, ##@C_G__V_A_R_+24
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov r20, ##@C_G__V_A_R_+2
 rdword r20, r20 ' reg <- INDIRI2 addrg
 shl r20, #16
 sar r20, #16 ' sign extend
 mov r18, ##@C_G__V_A_R_+4
 rdword r18, r18 ' reg <- INDIRI2 addrg
 shl r18, #16
 sar r18, #16 ' sign extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r22, ##@C_G__V_A_R_+20 ' reg <- addrg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, ##@C_G__V_A_R_+140 ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__db_setcommand
 add SP, #4 ' CALL addrg
' C_g_db_setup_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _db_setcommand

' Catalina Import g_flush

' Catalina Import G_VAR
' end
