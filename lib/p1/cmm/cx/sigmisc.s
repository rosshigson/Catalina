' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_sj44_6864c494___testsigset_L000001 ' <symbol:__testsigset>
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sj44_6864c494___testsigset_L000001_4)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sj44_6864c494___testsigset_L000001_4)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sj44_6864c494___testsigset_L000001_3)<<S32 ' JUMPV addrg
 alignl_label
C_sj44_6864c494___testsigset_L000001_3
 alignl_label
C_sj44_6864c494___testsigset_L000001_4
' C_sj44_6864c494___testsigset_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export __newsigset

 alignl_label
C___newsigset ' <symbol:__newsigset>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__sigprocmask)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C___newsigset_7 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export __oldsigset

 alignl_label
C___oldsigset ' <symbol:__oldsigset>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__sigprocmask)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C___oldsigset_8 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _sigprocmask
' end
