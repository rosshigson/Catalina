' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_clear

 alignl_label
C_g_clear ' <symbol:g_clear>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r23)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_LODI + (@C_G__V_A_R_+32)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (16)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_clear_4 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _setcommand

' Catalina Import G_VAR
' end
