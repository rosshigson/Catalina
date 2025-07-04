' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_clear

 alignl_label
C_gk_clear ' <symbol:gk_clear>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gk_clear_3)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_gk_initialize)<<S32 ' CALL addrg
 alignl_label
C_gk_clear_3
 alignl_p1
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_gk_clear_5)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_kb_block)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_gk_clear_2)<<S32 ' JUMPV addrg
 alignl_label
C_gk_clear_5
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_gk_clear_2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import gk_initialize

' Catalina Import kb_block
' end
