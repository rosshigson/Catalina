' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_arc

 alignl ' align long
C_g_arc ' <symbol:g_arc>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r15, RI ' reg <- addrg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #20 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 wrlong r17, r15 ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #6 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_arc_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import G_VAR
' end
