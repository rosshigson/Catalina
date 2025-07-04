' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_wait

 alignl_label
C_gk_wait ' <symbol:gk_wait>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gk_wait_3)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_gk_initialize)<<S32 ' CALL addrg
 alignl_label
C_gk_wait_3
 alignl_label
C_gk_wait_5
 alignl_p1
 long I32_CALA + (@C_gk_get)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_gk_wait_6 ' (symbol refcount = 0)
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_gk_wait_5)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_gk_wait_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import gk_initialize

' Catalina Import kb_block

' Catalina Import gk_get
' end
