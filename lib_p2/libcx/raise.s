' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s7cg_619c55de__sig_handler_L000001 ' <symbol:_sig_handler>
 long $1
 byte 0[60]

' Catalina Export raise

' Catalina Code

DAT ' code segment

 alignl ' align long
C_raise ' <symbol:raise>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmps r23,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_raise_5 ' LTI4
 cmps r23,  #16 wcz
 PRIMITIVE(#BRBE)
 long @C_raise_3 ' LEI4
C_raise_5
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_raise_2 ' JUMPV addrg
C_raise_3
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_s7cg_619c55de__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #1 wz
 PRIMITIVE(#BR_Z)
 long @C_raise_6 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 PRIMITIVE(#CALI) ' CALL indirect
C_raise_6
 cmps r23,  #6 wz
 PRIMITIVE(#BRNZ)
 long @C_raise_8 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_exit ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C_raise_9 ' JUMPV addrg
C_raise_8
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_raise_2 ' JUMPV addrg
C_raise_9
 mov r0, #0 ' RET coni
C_raise_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export signal

 alignl ' align long
C_signal ' <symbol:signal>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 cmps r3,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_signal_13 ' LTI4
 cmps r3,  #16 wcz
 PRIMITIVE(#BRBE)
 long @C_signal_11 ' LEI4
C_signal_13
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_signal_10 ' JUMPV addrg
C_signal_11
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_s7cg_619c55de__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_signal_14 ' NEU4
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_s7cg_619c55de__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 PRIMITIVE(#LODL)
 long $1
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#JMPA)
 long @C_signal_15 ' JUMPV addrg
C_signal_14
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_s7cg_619c55de__sig_handler_L000001
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNP4 reg reg
C_signal_15
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
C_signal_10
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import exit
' end
