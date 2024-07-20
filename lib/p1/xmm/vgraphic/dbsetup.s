' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_db_setup

 alignl ' align long
C_g_db_setup ' <symbol:g_db_setup>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+140
 mov r21, RI ' reg <- addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_g_flush ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 jmp #LODI
 long @C_G__V_A_R_+12
 mov r20, RI ' reg <- INDIRP4 addrg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 jmp #LODI
 long @C_G__V_A_R_+8
 mov r20, RI ' reg <- INDIRP4 addrg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 jmp #LODI
 long @C_G__V_A_R_+24
 mov r20, RI ' reg <- INDIRP4 addrg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #4 ' ADDP4 coni
 jmp #LODL
 long @C_G__V_A_R_+2
 jmp #RWRD
 mov r20, BC ' reg <- INDIRI2 addrg
 shl r20, #16
 sar r20, #16 ' sign extend
 jmp #LODL
 long @C_G__V_A_R_+4
 jmp #RWRD
 mov r18, BC ' reg <- INDIRI2 addrg
 shl r18, #16
 sar r18, #16 ' sign extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+20
 mov r22, RI ' reg <- addrg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+140
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__db_setcommand
 add SP, #4 ' CALL addrg
' C_g_db_setup_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _db_setcommand

' Catalina Import g_flush

' Catalina Import G_VAR
' end
