' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_db_setup

 alignl ' align long
C_g_db_setup ' <symbol:g_db_setup>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r21)<<D16B
 alignl ' align long
 long @C_G__V_A_R_+140 ' reg <- addrg
 alignl ' align long
 long I32_CALA + (@C_g_flush)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODI + (@C_G__V_A_R_+12)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODI + (@C_G__V_A_R_+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODI + (@C_G__V_A_R_+24)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODA + (@C_G__V_A_R_+2)<<S32
 word I16A_RDWORD + (r20)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg
 word I16A_SHLI + (r20)<<D16A + 16<<S16A
 word I16A_SARI + (r20)<<D16A + 16<<S16A ' sign extend
 alignl ' align long
 long I32_LODA + (@C_G__V_A_R_+4)<<S32
 word I16A_RDWORD + (r18)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg
 word I16A_SHLI + (r18)<<D16A + 16<<S16A
 word I16A_SARI + (r18)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_G__V_A_R_+20 ' reg <- addrg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_G__V_A_R_+140 ' reg <- addrg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__db_setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_db_setup_3 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _db_setcommand

' Catalina Import g_flush

' Catalina Import G_VAR
' end
